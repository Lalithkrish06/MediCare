package com.medicare.servlet;

import com.medicare.dao.UserDAO;
import com.medicare.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/verify-otp")
public class OTPVerifyServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("pendingEmail") == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        String email = (String) session.getAttribute("pendingEmail");
        String name  = (String) session.getAttribute("pendingName");
        String otp   = req.getParameter("otp").trim();

        try {
            String result = userDAO.verifyOTP(email, otp);

            switch (result) {
                case "SUCCESS":
                    // Fetch full user and create authenticated session
                    User user = userDAO.getUserByEmail(email);
                    session.removeAttribute("pendingEmail");
                    session.removeAttribute("pendingName");
                    session.removeAttribute("loginFlow");
                    session.setAttribute("loggedInUser", user);
                    session.setAttribute("userName", user.getFullName());
                    session.setAttribute("userEmail", email);
                    resp.sendRedirect(req.getContextPath() + "/home.jsp");
                    break;

                case "INVALID_OTP":
                    req.setAttribute("error", "Invalid OTP. Please check your email and try again.");
                    req.getRequestDispatcher("/verify-otp.jsp").forward(req, resp);
                    break;

                case "EXPIRED_OTP":
                    req.setAttribute("error", "OTP has expired. Please login again to receive a new OTP.");
                    req.getRequestDispatcher("/verify-otp.jsp").forward(req, resp);
                    break;

                default:
                    req.setAttribute("error", "Verification failed. Please try again.");
                    req.getRequestDispatcher("/verify-otp.jsp").forward(req, resp);
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "OTP verification error: " + e.getMessage());
            req.getRequestDispatcher("/verify-otp.jsp").forward(req, resp);
        }
    }
}
