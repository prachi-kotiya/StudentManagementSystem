package com.sms.servlet;

import com.sms.dao.TeacherDAO;
import com.sms.model.Teacher;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/TeachersServlet")
public class TeachersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        TeacherDAO dao = new TeacherDAO();

        String keyword = request.getParameter("keyword");

        List<Teacher> teacherList;

        if (keyword != null && !keyword.trim().isEmpty()) {
            teacherList = dao.searchTeachers(keyword);
        } else {
            teacherList = dao.getAllTeachers();
        }

        request.setAttribute("teacherList", teacherList);

        request.getRequestDispatcher("admin/teachers.jsp")
                .forward(request, response);
    }
}