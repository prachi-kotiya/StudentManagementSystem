package com.sms.servlet;

import com.sms.dao.CourseDAO;
import com.sms.model.Course;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditCourseServlet")
public class EditCourseServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        CourseDAO dao = new CourseDAO();

        Course course = dao.getCourseById(id);

        request.setAttribute("course", course);

        request.getRequestDispatcher("/admin/edit-course.jsp")
               .forward(request, response);
    }
}