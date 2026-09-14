package com.sms.servlet;

import com.sms.dao.AttendanceDAO;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/TeacherDeleteAttendanceServlet")
public class TeacherDeleteAttendanceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(
                    request.getParameter("id")
            );

            AttendanceDAO dao = new AttendanceDAO();

            dao.deleteAttendance(id);

            response.sendRedirect(
                    request.getContextPath()
                    + "/TeacherAttendanceServlet"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath()
                    + "/TeacherAttendanceServlet"
            );
        }
    }
}