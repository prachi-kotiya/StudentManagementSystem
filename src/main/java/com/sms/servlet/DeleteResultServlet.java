package com.sms.servlet;

import com.sms.dao.ResultDAO;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteResultServlet")
public class DeleteResultServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        ResultDAO dao = new ResultDAO();

        dao.deleteResult(id);

        response.sendRedirect(request.getContextPath() + "/ResultListServlet");
    }
}