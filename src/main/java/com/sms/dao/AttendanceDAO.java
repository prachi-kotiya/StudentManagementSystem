package com.sms.dao;

import com.sms.model.Attendance;
import com.sms.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AttendanceDAO {

    // ================= ADD ATTENDANCE =================
    public boolean addAttendance(Attendance attendance) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO attendance(student_id, attendance_date, status) VALUES(?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, attendance.getStudentId());
            ps.setDate(2, attendance.getAttendanceDate());
            ps.setString(3, attendance.getStatus());

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // ================= GET ALL ATTENDANCE =================
    // ================= GET ALL ATTENDANCE =================
    public List<Attendance> getAllAttendance() {

        List<Attendance> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql
                    = "SELECT a.id, a.student_id, s.full_name, "
                    + "a.attendance_date, a.status "
                    + "FROM attendance a "
                    + "LEFT JOIN students s ON a.student_id = s.id "
                    + "ORDER BY a.attendance_date DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Attendance attendance = new Attendance();

                attendance.setId(rs.getInt("id"));

                attendance.setStudentId(
                        rs.getInt("student_id")
                );

                attendance.setStudentName(
                        rs.getString("full_name")
                );

                attendance.setAttendanceDate(
                        rs.getDate("attendance_date")
                );

                attendance.setStatus(
                        rs.getString("status")
                );

                list.add(attendance);
            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return list;
    }
    // ================= GET ATTENDANCE BY ID =================

    public Attendance getAttendanceById(int id) {

        Attendance attendance = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM attendance WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                attendance = new Attendance();

                attendance.setId(rs.getInt("id"));
                attendance.setStudentId(rs.getInt("student_id"));
                attendance.setAttendanceDate(rs.getDate("attendance_date"));
                attendance.setStatus(rs.getString("status"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return attendance;
    }

    // ================= UPDATE ATTENDANCE =================
    public boolean updateAttendance(Attendance attendance) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE attendance SET student_id=?, attendance_date=?, status=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, attendance.getStudentId());
            ps.setDate(2, attendance.getAttendanceDate());
            ps.setString(3, attendance.getStatus());
            ps.setInt(4, attendance.getId());
            status = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // ================= DELETE ATTENDANCE =================
    public boolean deleteAttendance(int id) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM attendance WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public List<Attendance> getAttendanceByEmail(String email) {

        List<Attendance> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT a.id, a.student_id, s.full_name, a.attendance_date, a.status "
                    + "FROM attendance a "
                    + "JOIN students s ON a.student_id = s.id "
                    + "WHERE s.email = ? "
                    + "ORDER BY a.attendance_date DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Attendance attendance = new Attendance();

                attendance.setId(rs.getInt("id"));
                attendance.setStudentId(rs.getInt("student_id"));
                attendance.setStudentName(rs.getString("full_name"));
                attendance.setAttendanceDate(rs.getDate("attendance_date"));
                attendance.setStatus(rs.getString("status"));

                list.add(attendance);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ================= GET ATTENDANCE BY STUDENT ID =================
    public List<Attendance> getAttendanceByStudentId(int studentId) {

        List<Attendance> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT a.id, a.student_id, s.full_name, "
                    + "a.attendance_date, a.status "
                    + "FROM attendance a "
                    + "JOIN students s ON a.student_id = s.id "
                    + "WHERE a.student_id = ? "
                    + "ORDER BY a.attendance_date DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Attendance attendance = new Attendance();

                attendance.setId(rs.getInt("id"));
                attendance.setStudentId(rs.getInt("student_id"));
                attendance.setStudentName(rs.getString("full_name"));
                attendance.setAttendanceDate(
                        rs.getDate("attendance_date")
                );
                attendance.setStatus(
                        rs.getString("status")
                );

                list.add(attendance);
            }

        } catch (Exception e) {

            e.printStackTrace();

        }
        return list;
    }
}
