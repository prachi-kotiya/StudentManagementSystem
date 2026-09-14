package com.sms.servlet;

import com.sms.dao.AttendanceDAO;
import com.sms.model.Attendance;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/TeacherAttendanceServlet")
public class TeacherAttendanceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        AttendanceDAO dao = new AttendanceDAO();

        List<Attendance> attendanceList = dao.getAllAttendance();

        request.setAttribute("attendanceList", attendanceList);

        request.getRequestDispatcher("/teacher/attendance.jsp")
                .forward(request, response);
    }
}