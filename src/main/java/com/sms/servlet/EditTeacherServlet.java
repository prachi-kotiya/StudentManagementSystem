package com.sms.servlet;

import com.sms.dao.TeacherDAO;
import com.sms.model.Teacher;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditTeacherServlet")
public class EditTeacherServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        TeacherDAO dao = new TeacherDAO();

        Teacher teacher = dao.getTeacherById(id);

        request.setAttribute("teacher", teacher);

        request.getRequestDispatcher("/admin/edit-teacher.jsp")
               .forward(request, response);
    }
}