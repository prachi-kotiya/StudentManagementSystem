package com.sms.servlet;

import com.sms.dao.AttendanceDAO;
import com.sms.model.Attendance;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/AttendanceListServlet")
public class AttendanceListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        AttendanceDAO dao = new AttendanceDAO();

        List<Attendance> attendanceList = dao.getAllAttendance();

        request.setAttribute("attendanceList", attendanceList);

        request.getRequestDispatcher("/admin/attendance.jsp")
                .forward(request, response);
    }
}