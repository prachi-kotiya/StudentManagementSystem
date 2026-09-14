package com.sms.dao;
import com.sms.model.Fee;
import com.sms.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FeeDAO {

    // ================= ADD FEE =================

    public boolean addFee(Fee fee) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO fees(student_id, amount, fee_type, payment_date, status) "
                    + "VALUES(?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, fee.getStudentId());
            ps.setDouble(2, fee.getAmount());
            ps.setString(3, fee.getFeeType());
            ps.setDate(4, fee.getPaymentDate());
            ps.setString(5, fee.getStatus());

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }


    // ================= GET ALL FEES =================

    public List<Fee> getAllFees() {

        List<Fee> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT f.id, f.student_id, s.full_name, "
                    + "f.amount, f.fee_type, f.payment_date, f.status "
                    + "FROM fees f "
                    + "JOIN students s ON f.student_id = s.id";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Fee fee = new Fee();

                fee.setId(rs.getInt("id"));
                fee.setStudentId(rs.getInt("student_id"));
                fee.setStudentName(rs.getString("full_name"));
                fee.setAmount(rs.getDouble("amount"));
                fee.setFeeType(rs.getString("fee_type"));
                fee.setPaymentDate(rs.getDate("payment_date"));
                fee.setStatus(rs.getString("status"));

                list.add(fee);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }


    // ================= GET FEE BY ID =================

    public Fee getFeeById(int id) {

        Fee fee = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM fees WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                fee = new Fee();

                fee.setId(rs.getInt("id"));
                fee.setStudentId(rs.getInt("student_id"));
                fee.setAmount(rs.getDouble("amount"));
                fee.setFeeType(rs.getString("fee_type"));
                fee.setPaymentDate(rs.getDate("payment_date"));
                fee.setStatus(rs.getString("status"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return fee;
    }


    // ================= UPDATE FEE =================

    public boolean updateFee(Fee fee) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "UPDATE fees SET student_id=?, amount=?, fee_type=?, "
                    + "payment_date=?, status=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, fee.getStudentId());
            ps.setDouble(2, fee.getAmount());
            ps.setString(3, fee.getFeeType());
            ps.setDate(4, fee.getPaymentDate());
            ps.setString(5, fee.getStatus());
            ps.setInt(6, fee.getId());

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }


    // ================= DELETE FEE =================

    public boolean deleteFee(int id) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM fees WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }


    // ================= GET FEES BY STUDENT ID =================

    public List<Fee> getFeesByStudentId(int studentId) {

        List<Fee> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT f.id, f.student_id, s.full_name, "
                    + "f.amount, f.fee_type, f.payment_date, f.status "
                    + "FROM fees f "
                    + "JOIN students s ON f.student_id = s.id "
                    + "WHERE f.student_id=? "
                    + "ORDER BY f.payment_date DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Fee fee = new Fee();

                fee.setId(rs.getInt("id"));
                fee.setStudentId(rs.getInt("student_id"));
                fee.setStudentName(rs.getString("full_name"));
                fee.setAmount(rs.getDouble("amount"));
                fee.setFeeType(rs.getString("fee_type"));
                fee.setPaymentDate(rs.getDate("payment_date"));
                fee.setStatus(rs.getString("status"));

                list.add(fee);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}