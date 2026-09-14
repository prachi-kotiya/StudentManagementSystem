package com.sms.servlet;

import com.sms.dao.FeeDAO;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/DeleteFeeServlet")
public class DeleteFeeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        FeeDAO dao = new FeeDAO();

        dao.deleteFee(id);

        response.sendRedirect(request.getContextPath() + "/FeeListServlet");
    }
}