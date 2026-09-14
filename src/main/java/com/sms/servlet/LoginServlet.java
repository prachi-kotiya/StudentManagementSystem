package com.sms.servlet;

import com.sms.dao.UserDAO;
import com.sms.model.User;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null) {
            username = "";
        }

        if (password == null) {
            password = "";
        }

        username = username.trim();

        UserDAO dao = new UserDAO();

        User user = dao.loginUser(username, password);

        if (user != null) {

            // Check user status first
            if ("Pending".equalsIgnoreCase(user.getStatus())) {

                request.setAttribute("error",
                        "Your account is pending admin approval.");

                request.getRequestDispatcher("/login.jsp")
                        .forward(request, response);

                return;
            }

            if ("Rejected".equalsIgnoreCase(user.getStatus())) {

                request.setAttribute("error",
                        "Your account has been rejected.");

                request.getRequestDispatcher("/login.jsp")
                        .forward(request, response);

                return;
            }

            HttpSession session = request.getSession(true);

            session.setAttribute("user", user);

            String role = user.getRole();

            if ("Admin".equalsIgnoreCase(role)) {

                response.sendRedirect(request.getContextPath()
                        + "/DashboardServlet");

            } else if ("Teacher".equalsIgnoreCase(role)) {

                response.sendRedirect(request.getContextPath()
                        + "/TeacherDashboardServlet");

            } else if ("Student".equalsIgnoreCase(role)) {

                response.sendRedirect(request.getContextPath()
                        + "/StudentDashboardServlet");

            } else if ("Parent".equalsIgnoreCase(role)) {

                response.sendRedirect(request.getContextPath()
                        + "/ParentDashboardServlet");

            } else {

                session.invalidate();

                request.setAttribute("error", "Invalid User Role");

                request.getRequestDispatcher("/login.jsp")
                        .forward(request, response);
            }

        } else {

            request.setAttribute("error",
                    "Record not found. Please check your username and password.");

            request.getRequestDispatcher("/login.jsp")
                    .forward(request, response);
        }
    }
}