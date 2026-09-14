package com.sms.servlet;

import com.sms.dao.TeacherDAO;
import com.sms.model.Teacher;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddTeacherServlet")
public class AddTeacherServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Teacher teacher = new Teacher();

        teacher.setFullName(request.getParameter("fullName"));
        teacher.setEmail(request.getParameter("email"));
        teacher.setPhone(request.getParameter("phone"));
        teacher.setDepartment(request.getParameter("department"));
        teacher.setQualification(request.getParameter("qualification"));
        teacher.setAddress(request.getParameter("address"));

        TeacherDAO dao = new TeacherDAO();

        boolean status = dao.addTeacher(teacher);

        if (status) {
            response.sendRedirect(request.getContextPath() + "/TeachersServlet");
        } else {
            response.getWriter().println("Failed to add teacher.");
        }
    }
}