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

@WebServlet("/TeacherStudentsServlet")
public class TeacherStudentsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        StudentDAO dao = new StudentDAO();

        String search = request.getParameter("search");

        List<Student> studentList;

        if(search!=null && !search.trim().isEmpty()){
            studentList = dao.searchStudents(search);
        }else{
            studentList = dao.getAllStudents();
        }

        request.setAttribute("studentList", studentList);

        request.getRequestDispatcher("/teacher/students.jsp")
                .forward(request,response);
    }
}