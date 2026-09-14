package com.medicare.servlet;

import com.medicare.dao.UserDAO;
import com.medicare.model.User;
import com.medicare.util.EmailUtil;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email    = req.getParameter("email").trim().toLowerCase();
        String password = req.getParameter("password");

        try {
            User user = userDAO.getUserByEmail(email);

            if (user == null) {
                req.setAttribute("error", "No account found with this email.");
                req.getRequestDispatcher("/login.jsp").forward(req, resp);
                return;
            }

            if (!BCrypt.checkpw(password, user.getPasswordHash())) {
                req.setAttribute("error", "Incorrect password. Please try again.");
                req.getRequestDispatcher("/login.jsp").forward(req, resp);
                return;
            }

            if (!user.isVerified()) {
                // Resend OTP and redirect to verification
                String otp = EmailUtil.generateOTP();
                userDAO.saveOTP(email, otp);
                EmailUtil.sendOTPEmail(email, otp, user.getFullName());

                HttpSession session = req.getSession();
                session.setAttribute("pendingEmail", email);
                session.setAttribute("pendingName", user.getFullName());

                req.setAttribute("info", "Your account is not verified. A new OTP has been sent to your email.");
                req.getRequestDispatcher("/verify-otp.jsp").forward(req, resp);
                return;
            }

            // ---- SUCCESS: Send OTP for login verification ----
            String otp = EmailUtil.generateOTP();
            userDAO.saveOTP(email, otp);
            EmailUtil.sendOTPEmail(email, otp, user.getFullName());

            HttpSession session = req.getSession();
            session.setAttribute("pendingEmail", email);
            session.setAttribute("pendingName", user.getFullName());
            session.setAttribute("loginFlow", "true");

            resp.sendRedirect(req.getContextPath() + "/verify-otp.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Login failed: " + e.getMessage());
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }
}
