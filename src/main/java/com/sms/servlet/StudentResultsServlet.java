package com.sms.servlet;

import com.sms.dao.ResultDAO;
import com.sms.dao.StudentDAO;
import com.sms.model.Result;
import com.sms.model.Student;
import com.sms.model.User;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/StudentResultsServlet")
public class StudentResultsServlet extends HttpServlet {

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

        // Find student using logged-in user's email
        StudentDAO studentDAO = new StudentDAO();

        Student student =
                studentDAO.getStudentByEmail(user.getEmail());

        if (student == null) {

            response.getWriter().println("Student profile not found.");

            return;
        }

        // Get results for this student
        ResultDAO resultDAO = new ResultDAO();

        List<Result> resultList =
                resultDAO.getResultsByStudentId(student.getId());

        request.setAttribute("student", student);
        request.setAttribute("resultList", resultList);

        // Forward to JSP
        request.getRequestDispatcher("/student/results.jsp")
               .forward(request, response);
    }
}