package com.sms.servlet;

import com.sms.dao.ResultDAO;
import com.sms.model.Result;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EditResultServlet")
public class EditResultServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        ResultDAO dao = new ResultDAO();

        Result result = dao.getResultById(id);

        request.setAttribute("result", result);

        request.getRequestDispatcher("admin/edit-result.jsp")
                .forward(request, response);
    }
}