package com.sms.servlet;

import com.sms.dao.AttendanceDAO;
import com.sms.model.Attendance;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/TeacherEditAttendanceServlet")
public class TeacherEditAttendanceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(
                    request.getParameter("id")
            );

            AttendanceDAO dao = new AttendanceDAO();

            Attendance attendance =
                    dao.getAttendanceById(id);

            if (attendance == null) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/TeacherAttendanceServlet"
                );

                return;
            }

            request.setAttribute(
                    "attendance",
                    attendance
            );

            request.getRequestDispatcher(
                    "/teacher/edit-attendance.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath()
                    + "/TeacherAttendanceServlet"
            );
        }
    }
}