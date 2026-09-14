package com.sms.servlet;

import com.sms.dao.FeeDAO;
import com.sms.model.Fee;

import java.io.IOException;
import java.sql.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UpdateFeeServlet")
public class UpdateFeeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Fee fee = new Fee();

        fee.setId(Integer.parseInt(request.getParameter("id")));
        fee.setStudentId(Integer.parseInt(request.getParameter("studentId")));
        fee.setAmount(Double.parseDouble(request.getParameter("amount")));
        fee.setFeeType(request.getParameter("feeType"));
        fee.setPaymentDate(Date.valueOf(request.getParameter("paymentDate")));
        fee.setStatus(request.getParameter("status"));

        FeeDAO dao = new FeeDAO();

        dao.updateFee(fee);

        response.sendRedirect(request.getContextPath() + "/FeeListServlet");
    }
}