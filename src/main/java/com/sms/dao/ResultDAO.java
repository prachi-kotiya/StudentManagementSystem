package com.sms.dao;

import com.sms.model.Result;
import com.sms.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ResultDAO {

    // Add Result
    public boolean addResult(Result result) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO results(student_id, subject, marks, grade, exam_date) VALUES(?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, result.getStudentId());
            ps.setString(2, result.getSubject());
            ps.setDouble(3, result.getMarks());
            ps.setString(4, result.getGrade());
            ps.setDate(5, result.getExamDate());

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // Get All Results
    public List<Result> getAllResults() {

        List<Result> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT r.id, r.student_id, s.full_name, r.subject, r.marks, r.grade, r.exam_date "
                    + "FROM results r "
                    + "JOIN students s ON r.student_id = s.id";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Result result = new Result();

                result.setId(rs.getInt("id"));
                result.setStudentId(rs.getInt("student_id"));
                result.setStudentName(rs.getString("full_name"));
                result.setSubject(rs.getString("subject"));
                result.setMarks(rs.getDouble("marks"));
                result.setGrade(rs.getString("grade"));
                result.setExamDate(rs.getDate("exam_date"));

                list.add(result);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Get Result By ID
    public Result getResultById(int id) {

        Result result = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM results WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                result = new Result();

                result.setId(rs.getInt("id"));
                result.setStudentId(rs.getInt("student_id"));
                result.setSubject(rs.getString("subject"));
                result.setMarks(rs.getDouble("marks"));
                result.setGrade(rs.getString("grade"));
                result.setExamDate(rs.getDate("exam_date"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    // Update Result
    public boolean updateResult(Result result) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE results SET student_id=?, subject=?, marks=?, grade=?, exam_date=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, result.getStudentId());
            ps.setString(2, result.getSubject());
            ps.setDouble(3, result.getMarks());
            ps.setString(4, result.getGrade());
            ps.setDate(5, result.getExamDate());
            ps.setInt(6, result.getId());

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // Delete Result
    public boolean deleteResult(int id) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM results WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    public List<Result> getResultsByStudentId(int studentId) {

    List<Result> list = new ArrayList<>();

    try {

        Connection con = DBConnection.getConnection();

        String sql = "SELECT r.id, r.student_id, s.full_name, r.subject, r.marks, r.grade, r.exam_date "
                   + "FROM results r "
                   + "JOIN students s ON r.student_id = s.id "
                   + "WHERE r.student_id=? "
                   + "ORDER BY r.exam_date DESC";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, studentId);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {

            Result result = new Result();

            result.setId(rs.getInt("id"));
            result.setStudentId(rs.getInt("student_id"));
            result.setStudentName(rs.getString("full_name"));
            result.setSubject(rs.getString("subject"));
            result.setMarks(rs.getDouble("marks"));
            result.setGrade(rs.getString("grade"));
            result.setExamDate(rs.getDate("exam_date"));

            list.add(result);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}
}