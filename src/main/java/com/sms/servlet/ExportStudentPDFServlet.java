package com.sms.servlet;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import com.sms.dao.StudentDAO;
import com.sms.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/ExportStudentPDFServlet")
public class ExportStudentPDFServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition",
                "attachment; filename=Students_Report.pdf");

        try {

            Document document = new Document();

            PdfWriter.getInstance(document, response.getOutputStream());

            document.open();

            Font title = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18);

            Paragraph p = new Paragraph("Student Management System\nStudent Report\n\n", title);

            p.setAlignment(Element.ALIGN_CENTER);

            document.add(p);

            PdfPTable table = new PdfPTable(5);

            table.setWidthPercentage(100);

            table.addCell("Student ID");
            table.addCell("Name");
            table.addCell("Email");
            table.addCell("Course");
            table.addCell("Semester");

            StudentDAO dao = new StudentDAO();

            List<Student> list = dao.getAllStudents();

            for (Student s : list) {

                table.addCell(s.getStudentId());
                table.addCell(s.getFullName());
                table.addCell(s.getEmail());
                table.addCell(s.getCourse());
                table.addCell(s.getSemester());

            }

            document.add(table);

            document.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

    }
}