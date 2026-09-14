package com.sms.servlet;

import com.sms.dao.ResultDAO;
import com.sms.model.Result;

import java.io.IOException;
import java.sql.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddResultServlet")
public class AddResultServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String studentId = request.getParameter("studentId");
        String subject = request.getParameter("subject");
        String marks = request.getParameter("marks");
        String grade = request.getParameter("grade");
        String examDate = request.getParameter("examDate");

        System.out.println("Student ID = " + studentId);
        System.out.println("Subject = " + subject);
        System.out.println("Marks = " + marks);
        System.out.println("Grade = " + grade);
        System.out.println("Exam Date = " + examDate);

        Result result = new Result();

        result.setStudentId(Integer.parseInt(studentId));
        result.setSubject(subject);
        result.setMarks(Double.parseDouble(marks));
        result.setGrade(grade);
        result.setExamDate(Date.valueOf(examDate));

        ResultDAO dao = new ResultDAO();

        boolean status = dao.addResult(result);

        System.out.println("Insert Status = " + status);

        response.sendRedirect(request.getContextPath() + "/ResultListServlet");
    }
}
