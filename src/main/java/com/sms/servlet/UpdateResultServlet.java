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

@WebServlet("/UpdateResultServlet")
public class UpdateResultServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Result result = new Result();

        result.setId(Integer.parseInt(request.getParameter("id")));
        result.setStudentId(Integer.parseInt(request.getParameter("studentId")));
        result.setSubject(request.getParameter("subject"));
        result.setMarks(Double.parseDouble(request.getParameter("marks")));
        result.setGrade(request.getParameter("grade"));
        result.setExamDate(Date.valueOf(request.getParameter("examDate")));

        ResultDAO dao = new ResultDAO();

        dao.updateResult(result);

        response.sendRedirect(request.getContextPath() + "/ResultListServlet");
    }
}