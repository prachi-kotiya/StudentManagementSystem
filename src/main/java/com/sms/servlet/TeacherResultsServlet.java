package com.sms.servlet;

import com.sms.dao.ResultDAO;
import com.sms.model.Result;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/TeacherResultsServlet")
public class TeacherResultsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        ResultDAO dao = new ResultDAO();

        List<Result> resultList = dao.getAllResults();

        request.setAttribute("resultList", resultList);

        request.getRequestDispatcher("/teacher/results.jsp")
                .forward(request, response);
    }
}