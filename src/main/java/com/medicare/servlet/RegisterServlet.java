package com.medicare.servlet;

import com.medicare.dao.UserDAO;
import com.medicare.model.User;
import com.medicare.util.EmailUtil;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String fullName = req.getParameter("fullName").trim();
        String email    = req.getParameter("email").trim().toLowerCase();
        String password = req.getParameter("password");
        String confirm  = req.getParameter("confirmPassword");

        // Basic validation
        if (fullName.isEmpty() || email.isEmpty() || password.isEmpty()) {
            req.setAttribute("error", "All fields are required.");
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
            return;
        }
        if (!password.equals(confirm)) {
            req.setAttribute("error", "Passwords do not match.");
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
            return;
        }
        if (password.length() < 6) {
            req.setAttribute("error", "Password must be at least 6 characters.");
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
            return;
        }

        try {
            if (userDAO.emailExists(email)) {
                req.setAttribute("error", "Email already registered. Please login.");
                req.getRequestDispatcher("/register.jsp").forward(req, resp);
                return;
            }

            String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
            User user = new User(fullName, email, hashed);
            userDAO.registerUser(user);

            // Generate & send OTP
            String otp = EmailUtil.generateOTP();
            userDAO.saveOTP(email, otp);
            EmailUtil.sendOTPEmail(email, otp, fullName);

            // Store email in session for OTP page
            HttpSession session = req.getSession();
            session.setAttribute("pendingEmail", email);
            session.setAttribute("pendingName", fullName);

            resp.sendRedirect(req.getContextPath() + "/verify-otp.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Registration failed: " + e.getMessage());
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/register.jsp").forward(req, resp);
    }
}
