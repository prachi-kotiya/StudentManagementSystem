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

@WebServlet("/StudentProfileServlet")
public class StudentProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.html");
            return;
        }

        StudentDAO dao = new StudentDAO();

        Student student = dao.getStudentByEmail(user.getEmail());

        request.setAttribute("student", student);

        request.getRequestDispatcher("student/profile.jsp")
               .forward(request, response);
    }
}