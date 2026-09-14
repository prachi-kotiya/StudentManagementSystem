package com.sms.servlet;

import com.sms.dao.StudentDAO;
import com.sms.model.Student;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Student student = new Student();

        student.setFullName(request.getParameter("fullName"));
        student.setEmail(request.getParameter("email"));
        student.setPhone(request.getParameter("phone"));
        student.setCourse(request.getParameter("course"));
        student.setSemester(request.getParameter("semester"));
        student.setAddress(request.getParameter("address"));

        // Debug
        System.out.println("===== ADD STUDENT =====");
        System.out.println(student.getStudentId());
        System.out.println(student.getFullName());
        System.out.println(student.getEmail());
        System.out.println(student.getPhone());
        System.out.println(student.getCourse());
        System.out.println(student.getSemester());
        System.out.println(student.getAddress());

        StudentDAO dao = new StudentDAO();

        boolean status = dao.addStudent(student);

        if (status) {

            System.out.println("Student Added Successfully");

            response.sendRedirect(
                    request.getContextPath() + "/StudentsServlet");

        } else {

            System.out.println("Student Add Failed");

            response.getWriter().println("<h2>Student Not Added</h2>");
        }

    }
}
