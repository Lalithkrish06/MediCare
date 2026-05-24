package com.medicare.servlet;

import com.medicare.dao.MedicineDAO;
import com.medicare.dao.UserDAO;
import com.medicare.model.Medicine;
import com.medicare.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/search-medicine")
public class MedicineSearchServlet extends HttpServlet {

    private final MedicineDAO medicineDAO = new MedicineDAO();
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Session guard
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("loggedInUser") == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        String symptom = req.getParameter("symptom");
        if (symptom == null || symptom.trim().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/home.jsp");
            return;
        }

        try {
            List<Medicine> medicines = medicineDAO.getMedicinesBySymptom(symptom.trim());
            req.setAttribute("medicines", medicines);
            req.setAttribute("searchedSymptom", symptom.trim());

            // Log search
            User user = (User) session.getAttribute("loggedInUser");
            userDAO.logSearch(user.getId(), symptom.trim());

            req.getRequestDispatcher("/results.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Search failed: " + e.getMessage());
            req.getRequestDispatcher("/home.jsp").forward(req, resp);
        }
    }
}
