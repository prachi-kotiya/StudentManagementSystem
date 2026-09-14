package com.sms.servlet;

import com.sms.dao.ParentDAO;
import com.sms.model.Parent;
import com.sms.model.User;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ParentProfileServlet")
public class ParentProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check login
        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.html"
            );

            return;
        }

        // Get logged-in user
        User user = (User) session.getAttribute("user");

        String email = user.getEmail();

        System.out.println("Parent Profile - User Email: " + email);

        if (email == null || email.trim().isEmpty()) {

            response.getWriter().println("User email not found.");

            return;
        }

        // Get parent from database
        ParentDAO dao = new ParentDAO();

        Parent parent = dao.getParentByEmail(email.trim());

        if (parent == null) {

            System.out.println(
                    "No parent record found for email: " + email
            );

            response.getWriter().println("Parent profile not found.");

            return;
        }

        // Send parent data to JSP
        request.setAttribute("parent", parent);

        // Open parent profile page
        request.getRequestDispatcher(
                "/Parent/profile.jsp"
        ).forward(request, response);
    }
}