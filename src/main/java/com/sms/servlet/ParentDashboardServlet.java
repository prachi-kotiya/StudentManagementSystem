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

@WebServlet("/ParentDashboardServlet")
public class ParentDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login.html");
            return;
        }

        User user = (User) session.getAttribute("user");

        ParentDAO dao = new ParentDAO();

        Parent parent = dao.getParentByEmail(user.getEmail());

        if (parent == null) {
            response.getWriter().println("Parent record not found.");
            return;
        }

        request.setAttribute("parent", parent);

        // IMPORTANT: Parent folder has capital P
        request.getRequestDispatcher("/Parent/dashboard.jsp")
                .forward(request, response);
    }
}