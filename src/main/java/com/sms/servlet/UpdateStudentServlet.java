package com.sms.servlet;

import com.sms.dao.StudentDAO;
import com.sms.model.Student;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateStudentServlet")
public class UpdateStudentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Student student = new Student();

        student.setId(Integer.parseInt(request.getParameter("id")));
        student.setStudentId(request.getParameter("studentId"));
        student.setFullName(request.getParameter("fullName"));
        student.setEmail(request.getParameter("email"));
        student.setPhone(request.getParameter("phone"));
        student.setCourse(request.getParameter("course"));
        student.setSemester(request.getParameter("semester"));
        student.setAddress(request.getParameter("address"));

        StudentDAO dao = new StudentDAO();

        dao.updateStudent(student);

        response.sendRedirect(request.getContextPath() + "/StudentsServlet");
    }
}