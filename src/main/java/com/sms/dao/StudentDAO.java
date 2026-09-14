package com.sms.dao;

import com.sms.model.Attendance;
import com.sms.model.Student;
import com.sms.model.User;
import com.sms.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    // Add Student
public boolean addStudent(Student student) {

    try {

        Connection con = DBConnection.getConnection();

        // Generate Next Student ID
        String studentId = "S101";

        PreparedStatement ps1 =
                con.prepareStatement("SELECT MAX(student_id) FROM students");

        ResultSet rs = ps1.executeQuery();

        if (rs.next() && rs.getString(1) != null) {

            String lastId = rs.getString(1);

            int num = Integer.parseInt(lastId.substring(1));

            studentId = "S" + (num + 1);
        }

        String sql = "INSERT INTO students(student_id, full_name, email, phone, course, semester, address) VALUES(?,?,?,?,?,?,?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, studentId);
        ps.setString(2, student.getFullName());
        ps.setString(3, student.getEmail());
        ps.setString(4, student.getPhone());
        ps.setString(5, student.getCourse());
        ps.setString(6, student.getSemester());
        ps.setString(7, student.getAddress());

        return ps.executeUpdate() > 0;

    } catch (Exception e) {
        e.printStackTrace();
    }

    return false;
}

    // Get All Students
    public List<Student> getAllStudents() {

        List<Student> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM students";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Student s = new Student();

                s.setId(rs.getInt("id"));
                s.setStudentId(rs.getString("student_id"));
                s.setFullName(rs.getString("full_name"));
                s.setEmail(rs.getString("email"));
                s.setPhone(rs.getString("phone"));
                s.setCourse(rs.getString("course"));
                s.setSemester(rs.getString("semester"));
                s.setAddress(rs.getString("address"));

                list.add(s);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }

    // Get Student By ID
    public Student getStudentById(int id) {

        Student student = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM students WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                student = new Student();

                student.setId(rs.getInt("id"));
                student.setStudentId(rs.getString("student_id"));
                student.setFullName(rs.getString("full_name"));
                student.setEmail(rs.getString("email"));
                student.setPhone(rs.getString("phone"));
                student.setCourse(rs.getString("course"));
                student.setSemester(rs.getString("semester"));
                student.setAddress(rs.getString("address"));
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return student;
    }

    // Update Student
    public boolean updateStudent(Student student) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

           String sql = "UPDATE students SET full_name=?, email=?, phone=?, course=?, semester=?, address=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

          ps.setString(1, student.getFullName());
ps.setString(2, student.getEmail());
ps.setString(3, student.getPhone());
ps.setString(4, student.getCourse());
ps.setString(5, student.getSemester());
ps.setString(6, student.getAddress());
ps.setInt(7, student.getId());
            status = ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }

    // Delete Student
    public boolean deleteStudent(int id) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM students WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {

            e.printStackTrace();
        }

        return status;
    }

    // Search Students
    public List<Student> searchStudents(String keyword) {

        List<Student> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM students WHERE student_id LIKE ? OR full_name LIKE ? OR email LIKE ?";

            PreparedStatement ps = con.prepareStatement(sql);

            String search = "%" + keyword + "%";

            ps.setString(1, search);
            ps.setString(2, search);
            ps.setString(3, search);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Student s = new Student();

                s.setId(rs.getInt("id"));
                s.setStudentId(rs.getString("student_id"));
                s.setFullName(rs.getString("full_name"));
                s.setEmail(rs.getString("email"));
                s.setPhone(rs.getString("phone"));
                s.setCourse(rs.getString("course"));
                s.setSemester(rs.getString("semester"));
                s.setAddress(rs.getString("address"));

                list.add(s);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return list;
    }
    // Get Student By Email
public Student getStudentByEmail(String email) {

    Student student = null;

    try {

        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM students WHERE email=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, email);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            student = new Student();

            student.setId(rs.getInt("id"));
            student.setStudentId(rs.getString("student_id"));
            student.setFullName(rs.getString("full_name"));
            student.setEmail(rs.getString("email"));
            student.setPhone(rs.getString("phone"));
            student.setCourse(rs.getString("course"));
            student.setSemester(rs.getString("semester"));
            student.setAddress(rs.getString("address"));
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return student;
}

    public List<Attendance> getAttendanceByEmail(String email) {
    List<Attendance> list = new ArrayList<>();

    String sql = "SELECT a.* FROM attendance a "
               + "JOIN students s ON a.student_id = s.id "
               + "WHERE s.email = ?";

    try {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, email);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Attendance a = new Attendance();

            a.setId(rs.getInt("id"));
            a.setStudentId(rs.getInt("student_id"));
            a.setDate(rs.getString("date"));
            a.setStatus(rs.getString("status"));

            list.add(a);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}
public boolean addStudentFromUser(User user) {

    try {

        Connection con = DBConnection.getConnection();

        // Generate next Student ID
        String studentId = "S101";

        PreparedStatement ps1 = con.prepareStatement(
                "SELECT MAX(student_id) FROM students");

        ResultSet rs = ps1.executeQuery();

        if (rs.next() && rs.getString(1) != null) {

            String lastId = rs.getString(1);   // Example: S105

            int num = Integer.parseInt(lastId.substring(1));

            studentId = "S" + (num + 1);
        }

        String sql = "INSERT INTO students(student_id, full_name, email, phone, course, semester, address) VALUES(?,?,?,?,?,?,?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, studentId);
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