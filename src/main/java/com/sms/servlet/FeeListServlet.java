package com.sms.servlet;

import com.sms.dao.FeeDAO;
import com.sms.model.Fee;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/FeeListServlet")
public class FeeListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        FeeDAO dao = new FeeDAO();

        List<Fee> feeList = dao.getAllFees();

        request.setAttribute("feeList", feeList);

        request.getRequestDispatcher("admin/fees.jsp")
                .forward(request, response);
    }
}