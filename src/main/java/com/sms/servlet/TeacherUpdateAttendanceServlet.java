package com.sms.servlet;

import com.sms.dao.AttendanceDAO;
import com.sms.model.Attendance;

import java.io.IOException;
import java.sql.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/TeacherUpdateAttendanceServlet")
public class TeacherUpdateAttendanceServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            Attendance attendance = new Attendance();

            attendance.setId(
                    Integer.parseInt(
                            request.getParameter("id")
                    )
            );

            attendance.setStudentId(
                    Integer.parseInt(
                            request.getParameter("studentId")
                    )
            );

            attendance.setAttendanceDate(
                    Date.valueOf(
                            request.getParameter("attendanceDate")
                    )
            );

            attendance.setStatus(
                    request.getParameter("status")
            );

            AttendanceDAO dao = new AttendanceDAO();

            dao.updateAttendance(attendance);

            response.sendRedirect(
                    request.getContextPath()
                    + "/TeacherAttendanceServlet"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "Error while updating attendance: "
                    + e.getMessage()
            );
        }
    }
}