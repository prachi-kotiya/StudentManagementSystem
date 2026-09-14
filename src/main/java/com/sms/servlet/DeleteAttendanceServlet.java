package com.sms.servlet;

import com.sms.dao.AttendanceDAO;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/DeleteAttendanceServlet")
public class DeleteAttendanceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        AttendanceDAO dao = new AttendanceDAO();

        dao.deleteAttendance(id);

        response.sendRedirect(request.getContextPath() + "/AttendanceListServlet");
    }
}