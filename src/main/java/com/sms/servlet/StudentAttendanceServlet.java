package com.sms.servlet;

import com.sms.dao.AttendanceDAO;
import com.sms.model.Attendance;
import com.sms.model.User;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/StudentAttendanceServlet")
public class StudentAttendanceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check login
        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.html"
            );

            return;
        }

        // Get logged-in user
        User user = (User) session.getAttribute("user");

        // Get email of logged-in student
        String email = user.getEmail();

        // Get ONLY this student's attendance
        AttendanceDAO dao = new AttendanceDAO();

        List<Attendance> attendanceList =
                dao.getAttendanceByEmail(email);

        // Send attendance to JSP
        request.setAttribute("attendanceList", attendanceList);

        // Open student attendance page
        request.getRequestDispatcher("/student/attendance.jsp")
                .forward(request, response);
    }
}