package com.sms.servlet;

import com.sms.dao.FeeDAO;
import com.sms.model.Fee;

import java.io.IOException;
import java.sql.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddFeeServlet")
public class AddFeeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("===== AddFeeServlet Called =====");

        Fee fee = new Fee();

        fee.setStudentId(Integer.parseInt(request.getParameter("studentId")));
        fee.setAmount(Double.parseDouble(request.getParameter("amount")));
        fee.setFeeType(request.getParameter("feeType"));
        fee.setPaymentDate(Date.valueOf(request.getParameter("paymentDate")));
        fee.setStatus(request.getParameter("status"));

        FeeDAO dao = new FeeDAO();

        boolean result = dao.addFee(fee);

        System.out.println("Fee Insert Result = " + result);

        if (result) {
            response.sendRedirect(request.getContextPath() + "/FeeListServlet");
        } else {
            response.getWriter().println("Fee could not be saved.");
        }
    }

}
