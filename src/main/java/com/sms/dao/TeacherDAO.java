package com.sms.dao;

import com.sms.model.Teacher;
import com.sms.model.User;
import com.sms.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TeacherDAO {

 // Add Teacher
public boolean addTeacher(Teacher teacher) {

    try {

        Connection con = DBConnection.getConnection();

        // Generate Next Teacher ID
        String teacherId = "T101";

        PreparedStatement ps1 =
                con.prepareStatement("SELECT MAX(teacher_id) FROM teachers");

        ResultSet rs = ps1.executeQuery();

        if (rs.next() && rs.getString(1) != null) {

            String lastId = rs.getString(1);

            int num = Integer.parseInt(lastId.substring(1));

            teacherId = "T" + (num + 1);
        }

        String sql = "INSERT INTO teachers(teacher_id, full_name, email, phone, department, qualification, address) VALUES(?,?,?,?,?,?,?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, teacherId);
        ps.setString(2, teacher.getFullName());
        ps.setString(3, teacher.getEmail());
        ps.setString(4, teacher.getPhone());
        ps.setString(5, teacher.getDepartment());
        ps.setString(6, teacher.getQualification());
        ps.setString(7, teacher.getAddress());

        return ps.executeUpdate() > 0;

    } catch (Exception e) {

        e.printStackTrace();
    }

    return false;
}

    // Get All Teachers
    
    public List<Teacher> getAllTeachers() {

        List<Teacher> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM teachers";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Teacher t = new Teacher();

                t.setId(rs.getInt("id"));
                t.setTeacherId(rs.getString("teacher_id"));
                t.setFullName(rs.getString("full_name"));
                t.setEmail(rs.getString("email"));
                t.setPhone(rs.getString("phone"));
                t.setDepartment(rs.getString("department"));
                t.setQualification(rs.getString("qualification"));
                t.setAddress(rs.getString("address"));

                list.add(t);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    // Get Teacher By ID
public Teacher getTeacherById(int id) {

    Teacher teacher = null;

    try {

        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM teachers WHERE id=?";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            teacher = new Teacher();

            teacher.setId(rs.getInt("id"));
            teacher.setTeacherId(rs.getString("teacher_id"));
            teacher.setFullName(rs.getString("full_name"));
            teacher.setEmail(rs.getString("email"));
            teacher.setPhone(rs.getString("phone"));
            teacher.setDepartment(rs.getString("department"));
            teacher.setQualification(rs.getString("qualification"));
            teacher.setAddress(rs.getString("address"));
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return teacher;
}

// Update Teacher
public boolean updateTeacher(Teacher teacher) {

    boolean status = false;

    try {

        Connection con = DBConnection.getConnection();

        String sql = "UPDATE teachers SET full_name=?, email=?, phone=?, department=?, qualification=?, address=? WHERE id=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, teacher.getFullName());
ps.setString(2, teacher.getEmail());
ps.setString(3, teacher.getPhone());
ps.setString(4, teacher.getDepartment());
ps.setString(5, teacher.getQualification());
ps.setString(6, teacher.getAddress());
ps.setInt(7, teacher.getId());
        status = ps.executeUpdate() > 0;

    } catch (Exception e) {
        e.printStackTrace();
    }

    return status;
}

// Delete Teacher
public boolean deleteTeacher(int id) {

    boolean status = false;

    try {

        Connection con = DBConnection.getConnection();

        String sql = "DELETE FROM teachers WHERE id=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);

        status = ps.executeUpdate() > 0;

    } catch (Exception e) {
        e.printStackTrace();
    }

    return status;
}
public List<Teacher> searchTeachers(String keyword) {

    List<Teacher> list = new ArrayList<>();

    try {

        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM teachers WHERE teacher_id LIKE ? OR full_name LIKE ? OR email LIKE ?";

        PreparedStatement ps = con.prepareStatement(sql);

        String search = "%" + keyword + "%";

        ps.setString(1, search);
        ps.setString(2, search);
        ps.setString(3, search);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {

            Teacher t = new Teacher();

            t.setId(rs.getInt("id"));
            t.setTeacherId(rs.getString("teacher_id"));
            t.setFullName(rs.getString("full_name"));
            t.setEmail(rs.getString("email"));
            t.setPhone(rs.getString("phone"));
            t.setDepartment(rs.getString("department"));
            t.setQualification(rs.getString("qualification"));
            t.setAddress(rs.getString("address"));

            list.add(t);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}
    public Teacher getTeacherByEmail(String email){

    Teacher teacher = null;

    try{

        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM teachers WHERE email=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1,email);

        ResultSet rs = ps.executeQuery();

        if(rs.next()){

            teacher = new Teacher();

            teacher.setId(rs.getInt("id"));
            teacher.setTeacherId(rs.getString("teacher_id"));
            teacher.setFullName(rs.getString("full_name"));
            teacher.setEmail(rs.getString("email"));
            teacher.setPhone(rs.getString("phone"));
            teacher.setDepartment(rs.getString("department"));
            teacher.setQualification(rs.getString("qualification"));
            teacher.setAddress(rs.getString("address"));

        }

    }catch(Exception e){

        e.printStackTrace();

    }

    return teacher;
}

 public boolean addTeacherFromUser(User user) {

    try {

        Connection con = DBConnection.getConnection();

        String teacherId = "T101";

        PreparedStatement ps1 =
                con.prepareStatement("SELECT MAX(teacher_id) FROM teachers");

        ResultSet rs = ps1.executeQuery();

        if (rs.next() && rs.getString(1) != null) {

            String lastId = rs.getString(1);

            int num = Integer.parseInt(lastId.substring(1));

            teacherId = "T" + (num + 1);
        }

        String sql = "INSERT INTO teachers(teacher_id, full_name, email, phone, department, qualification, address) VALUES(?,?,?,?,?,?,?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, teacherId);
        ps.setString(2, user.getFullname());
        ps.setString(3, user.getEmail());
        ps.setString(4, user.getPhone());
        ps.setString(5, "");
        ps.setString(6, "");
        ps.setString(7, "");

        return ps.executeUpdate() > 0;

    } catch (Exception e) {

        e.printStackTrace();
    }

    return false;
}
}