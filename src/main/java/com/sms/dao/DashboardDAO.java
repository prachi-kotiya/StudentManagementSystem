package com.sms.dao;

import com.sms.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DashboardDAO {

    // Student Count
   public int getStudentCount() {

    System.out.println("NEW DashboardDAO Loaded");

    int count = 0;
        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement("SELECT COUNT(*) FROM students");

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    // Teacher Count
    public int getTeacherCount() {

        int count = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement("SELECT COUNT(*) FROM teachers");

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    // Attendance Count
    public int getAttendanceCount() {

    int count = 0;

    try {

        Connection con = DBConnection.getConnection();

        System.out.println("Attendance DB Connected");

        String sql = "SELECT COUNT(*) FROM attendance";

        PreparedStatement ps = con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            count = rs.getInt(1);

            System.out.println("Attendance Count = " + count);
        }

    } catch (Exception e) {

        System.out.println("Attendance Error:");
        e.printStackTrace();
    }

    return count;
}

    // Fee Count
    public int getFeeCount() {

        int count = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement("SELECT COUNT(*) FROM fees");

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    // Result Count
    public int getResultCount() {

        int count = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement("SELECT COUNT(*) FROM results");

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    // User Count
    public int getUserCount() {

        int count = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement("SELECT COUNT(*) FROM user");

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }
    public int getParentCount() {

    int count = 0;

    try {

        Connection con = DBConnection.getConnection();

        PreparedStatement ps =
                con.prepareStatement("SELECT COUNT(*) FROM parents");

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            count = rs.getInt(1);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return count;
}
}