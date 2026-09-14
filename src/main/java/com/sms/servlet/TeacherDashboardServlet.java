package com.sms.servlet;

import com.sms.dao.DashboardDAO;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/TeacherDashboardServlet")
public class TeacherDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        DashboardDAO dao = new DashboardDAO();

        request.setAttribute("studentCount", dao.getStudentCount());
        request.setAttribute("attendanceCount", dao.getAttendanceCount());
        request.setAttribute("resultCount", dao.getResultCount());

        request.getRequestDispatcher("/teacher/dashboard.jsp")
               .forward(request, response);
    }
}