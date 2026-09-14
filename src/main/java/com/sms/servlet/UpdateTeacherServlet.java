package com.sms.servlet;

import com.sms.dao.TeacherDAO;
import com.sms.model.Teacher;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateTeacherServlet")
public class UpdateTeacherServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Teacher teacher = new Teacher();

        teacher.setId(Integer.parseInt(request.getParameter("id")));
        teacher.setTeacherId(request.getParameter("teacherId"));
        teacher.setFullName(request.getParameter("fullName"));
        teacher.setEmail(request.getParameter("email"));
        teacher.setPhone(request.getParameter("phone"));
        teacher.setDepartment(request.getParameter("department"));
        teacher.setQualification(request.getParameter("qualification"));
        teacher.setAddress(request.getParameter("address"));

        TeacherDAO dao = new TeacherDAO();

        dao.updateTeacher(teacher);

        response.sendRedirect(request.getContextPath() + "/TeachersServlet");
    }
}