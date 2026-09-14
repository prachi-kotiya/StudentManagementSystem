package com.sms.servlet;

import com.sms.dao.CourseDAO;
import com.sms.model.Course;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateCourseServlet")
public class UpdateCourseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Course course = new Course();

        course.setId(Integer.parseInt(request.getParameter("id")));
        course.setCourseCode(request.getParameter("courseCode"));
        course.setCourseName(request.getParameter("courseName"));
        course.setDuration(request.getParameter("duration"));
        course.setSemester(request.getParameter("semester"));
        course.setFee(Double.parseDouble(request.getParameter("fee")));
        course.setDescription(request.getParameter("description"));

        CourseDAO dao = new CourseDAO();

        boolean status = dao.updateCourse(course);

        if (status) {
            response.sendRedirect(request.getContextPath() + "/CoursesServlet");
        } else {
            response.getWriter().println("Failed to update course.");
        }
    }
}