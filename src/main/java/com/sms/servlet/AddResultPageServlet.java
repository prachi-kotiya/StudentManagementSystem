package com.sms.servlet;

import com.sms.dao.StudentDAO;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddResultPageServlet")
public class AddResultPageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        StudentDAO dao = new StudentDAO();

        // Fetch all students
        request.setAttribute("studentList", dao.getAllStudents());

        // Open add-result.jsp
        request.getRequestDispatcher("admin/add-result.jsp")
                .forward(request, response);
    }
}
