package com.sms.servlet;

import com.sms.dao.ResultDAO;
import com.sms.model.Result;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/AddTeacherResultServlet")
public class AddTeacherResultServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        Result result = new Result();

        result.setStudentId(
                Integer.parseInt(
                        request.getParameter("studentId")
                )
        );

        result.setSubject(
                request.getParameter("subject")
        );

        result.setMarks(
                Double.parseDouble(
                        request.getParameter("marks")
                )
        );

        result.setGrade(
                request.getParameter("grade")
        );

        result.setExamDate(
                Date.valueOf(
                        request.getParameter("examDate")
                )
        );

        ResultDAO dao = new ResultDAO();

        dao.addResult(result);

        response.sendRedirect(
                request.getContextPath()
                + "/TeacherResultsServlet"
        );
    }
}
