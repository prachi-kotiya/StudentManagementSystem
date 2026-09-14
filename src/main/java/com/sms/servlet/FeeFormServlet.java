package com.sms.servlet;

import com.sms.dao.StudentDAO;
import com.sms.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/FeeFormServlet")
public class FeeFormServlet extends HttpServlet {
@Override
protected void doGet(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {

    StudentDAO dao = new StudentDAO();

    List<Student> studentList = dao.getAllStudents();

    if(studentList == null || studentList.isEmpty()){

        request.setAttribute("msg",
                "No students found. Please add students first.");

    }

    request.setAttribute("studentList", studentList);

    request.getRequestDispatcher("/admin/add-fee.jsp")
            .forward(request,response);

}
}