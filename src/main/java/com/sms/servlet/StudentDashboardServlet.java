package com.sms.servlet;
import com.sms.dao.StudentDAO;
import com.sms.model.Student;
import com.sms.model.User;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/StudentDashboardServlet")
public class StudentDashboardServlet extends HttpServlet {

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

        User user = (User) session.getAttribute("user");

        // Get student using logged-in user's email
        StudentDAO dao = new StudentDAO();

        Student student = dao.getStudentByEmail(user.getEmail());

        if (student == null) {

            response.getWriter().println("Student profile not found.");

            return;
        }

        // Send student information to JSP
        request.setAttribute("student", student);

        // Open dashboard
        request.getRequestDispatcher("/student/dashboard.jsp")
               .forward(request, response);
    }
}