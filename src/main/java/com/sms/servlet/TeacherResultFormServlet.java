package com.sms.servlet;

import com.sms.dao.StudentDAO;
import com.sms.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/TeacherResultFormServlet")
public class TeacherResultFormServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        StudentDAO dao = new StudentDAO();

        List<Student> studentList = dao.getAllStudents();

        request.setAttribute("studentList", studentList);

        request.getRequestDispatcher("/teacher/add-result.jsp")
                .forward(request, response);
    }
}