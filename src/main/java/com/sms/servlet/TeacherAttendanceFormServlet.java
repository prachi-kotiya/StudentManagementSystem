package com.sms.servlet;

import com.sms.dao.StudentDAO;
import com.sms.model.Student;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/TeacherAttendanceFormServlet")
public class TeacherAttendanceFormServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        StudentDAO dao = new StudentDAO();

        List<Student> studentList = dao.getAllStudents();

        request.setAttribute("studentList", studentList);

        request.getRequestDispatcher("/teacher/add-attendance.jsp")
                .forward(request, response);
    }
}