package com.sms.servlet;

import com.sms.dao.ParentDAO;
import com.sms.dao.StudentDAO;
import com.sms.model.Parent;
import com.sms.model.Student;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditParentServlet")
public class EditParentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        ParentDAO parentDAO = new ParentDAO();
        Parent parent = parentDAO.getParentById(id);

        StudentDAO studentDAO = new StudentDAO();
        List<Student> studentList = studentDAO.getAllStudents();

        request.setAttribute("parent", parent);
        request.setAttribute("studentList", studentList);

        request.getRequestDispatcher("/admin/edit-parent.jsp")
                .forward(request, response);
    }
}