package com.sms.servlet;

import com.sms.dao.CourseDAO;
import com.sms.model.Course;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CoursesServlet")
public class CoursesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CourseDAO dao = new CourseDAO();

        List<Course> courseList = dao.getAllCourses();

        request.setAttribute("courseList", courseList);

        request.getRequestDispatcher("/admin/courses.jsp")
               .forward(request, response);
    }
}