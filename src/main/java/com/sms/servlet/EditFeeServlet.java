package com.sms.servlet;

import com.sms.dao.FeeDAO;
import com.sms.dao.StudentDAO;
import com.sms.model.Fee;
import com.sms.model.Student;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/EditFeeServlet")
public class EditFeeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        FeeDAO feeDao = new FeeDAO();
        StudentDAO studentDao = new StudentDAO();

        Fee fee = feeDao.getFeeById(id);

        List<Student> studentList = studentDao.getAllStudents();

        request.setAttribute("fee", fee);
        request.setAttribute("studentList", studentList);

        request.getRequestDispatcher("/admin/edit-fee.jsp")
                .forward(request, response);
    }
}