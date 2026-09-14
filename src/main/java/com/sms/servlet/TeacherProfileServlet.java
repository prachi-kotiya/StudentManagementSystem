package com.sms.servlet;

import com.sms.dao.TeacherDAO;
import com.sms.model.Teacher;
import com.sms.model.User;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/TeacherProfileServlet")
public class TeacherProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        TeacherDAO dao = new TeacherDAO();

        System.out.println("Logged in Teacher Email : " + user.getEmail());

        Teacher teacher = dao.getTeacherByEmail(user.getEmail());

        if (teacher == null) {

            request.setAttribute("error",
                    "Teacher profile not found. Please contact Admin.");

            request.getRequestDispatcher("/teacher/profile.jsp")
                    .forward(request, response);

            return;
        }

        request.setAttribute("teacher", teacher);

        request.getRequestDispatcher("/teacher/profile.jsp")
                .forward(request, response);
    }
}