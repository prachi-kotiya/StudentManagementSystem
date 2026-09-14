package com.sms.servlet;

import com.sms.dao.DashboardDAO;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {

   @Override
protected void doGet(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {

    System.out.println("===== DashboardServlet Executed =====");

    DashboardDAO dao = new DashboardDAO();

   request.setAttribute("studentCount", dao.getStudentCount());
request.setAttribute("teacherCount", dao.getTeacherCount());
request.setAttribute("attendanceCount", dao.getAttendanceCount());
request.setAttribute("feeCount", dao.getFeeCount());
request.setAttribute("resultCount", dao.getResultCount());
request.setAttribute("parentCount", dao.getParentCount());

request.getRequestDispatcher("/admin/admin-dashboard.jsp")
       .forward(request, response);
}
}