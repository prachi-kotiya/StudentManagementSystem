package com.sms.servlet;

import com.sms.dao.FeeDAO;
import com.sms.dao.StudentDAO;
import com.sms.model.Fee;
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

@WebServlet("/StudentFeesServlet")
public class StudentFeesServlet extends HttpServlet {

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

        // Get student using logged-in email
        StudentDAO studentDAO = new StudentDAO();

        Student student =
                studentDAO.getStudentByEmail(user.getEmail());

        if (student == null) {

            response.getWriter().println("Student profile not found.");

            return;
        }

        // Get fees
        FeeDAO feeDAO = new FeeDAO();

        List<Fee> feeList =
                feeDAO.getFeesByStudentId(student.getId());

        // Send data to JSP
        request.setAttribute("student", student);
        request.setAttribute("feeList", feeList);

        // Open fees page
        request.getRequestDispatcher("/student/fees.jsp")
                .forward(request, response);
    }
}