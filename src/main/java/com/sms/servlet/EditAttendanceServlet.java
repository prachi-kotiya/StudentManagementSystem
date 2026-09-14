package com.sms.servlet;

import com.sms.dao.AttendanceDAO;
import com.sms.model.Attendance;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/EditAttendanceServlet")
public class EditAttendanceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        AttendanceDAO dao = new AttendanceDAO();

        Attendance attendance = dao.getAttendanceById(id);

        request.setAttribute("attendance", attendance);

        request.getRequestDispatcher("/admin/edit-attendance.jsp")
                .forward(request, response);
    }
}