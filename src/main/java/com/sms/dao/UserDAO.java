package com.sms.dao;

import com.sms.model.User;
import com.sms.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    // ================= REGISTER USER =================
    public boolean registerUser(User user) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO users(fullname,email,phone,role,username,password,status) VALUES(?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getFullname());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getRole());
            ps.setString(5, user.getUsername());
            ps.setString(6, user.getPassword());

            // Every new user will be Pending
            ps.setString(7, "Pending");

            int row = ps.executeUpdate();

            if (row > 0) {
                status = true;
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // ================= LOGIN USER =================
    public User loginUser(String username, String password) {

        User user = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM users WHERE username=? AND password=? AND status='Approved'";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                user = new User();

                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setRole(rs.getString("role"));
                user.setUsername(rs.getString("username"));
                user.setStatus(rs.getString("status"));

            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    // ================= GET PENDING USERS =================
    public List<User> getPendingUsers() {

        List<User> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM users WHERE status='Pending'";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                User user = new User();

                user.setId(rs.getInt("id"));
                user.setFullname(rs.getString("fullname"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setRole(rs.getString("role"));
                user.setUsername(rs.getString("username"));
                user.setStatus(rs.getString("status"));

                list.add(user);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ================= APPROVE USER =================
    public boolean approveUser(int id) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE users SET status='Approved' WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            int row = ps.executeUpdate();

            if (row > 0) {
                status = true;
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // ================= GET USER BY ID =================
public User getUserById(int id) {

    User user = null;

    try {

        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM users WHERE id=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            user = new User();

            user.setId(rs.getInt("id"));
            user.setFullname(rs.getString("fullname"));
            user.setEmail(rs.getString("email"));
            user.setPhone(rs.getString("phone"));
            user.setRole(rs.getString("role"));
            user.setUsername(rs.getString("username"));
            user.setStatus(rs.getString("status"));
        }

        con.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

    return user;
}
}