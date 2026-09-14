package com.sms.servlet;

import com.sms.dao.AttendanceDAO;
import com.sms.dao.ParentDAO;
import com.sms.model.Attendance;
import com.sms.model.Parent;
import com.sms.model.User;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ParentAttendanceServlet")
public class ParentAttendanceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login.html"
            );

            return;
        }

        User user = (User) session.getAttribute("user");

        // Get logged-in parent's record
        ParentDAO parentDAO = new ParentDAO();

        Parent parent = parentDAO.getParentByEmail(user.getEmail());

        if (parent == null) {

            response.getWriter().println("Parent record not found.");

            return;
        }

        // Get linked student's ID
        int studentId = parent.getStudentId();

        // Get attendance of that student
        AttendanceDAO attendanceDAO = new AttendanceDAO();

        List<Attendance> attendanceList =
                attendanceDAO.getAttendanceByStudentId(studentId);

        request.setAttribute("parent", parent);
        request.setAttribute("attendanceList", attendanceList);

        request.getRequestDispatcher("/Parent/attendance.jsp")
                .forward(request, response);
    }
}