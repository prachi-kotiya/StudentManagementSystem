package com.sms.dao;
import com.sms.model.Course;
import com.sms.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
public class CourseDAO {

    // Add Course
    public boolean addCourse(Course course) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO courses(course_code, course_name, duration, semester, fee, description) VALUES(?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, course.getCourseCode());
            ps.setString(2, course.getCourseName());
            ps.setString(3, course.getDuration());
            ps.setString(4, course.getSemester());
            ps.setDouble(5, course.getFee());
            ps.setString(6, course.getDescription());

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // Get All Courses
    public List<Course> getAllCourses() {

        List<Course> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM courses";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Course course = new Course();

                course.setId(rs.getInt("id"));
                course.setCourseCode(rs.getString("course_code"));
                course.setCourseName(rs.getString("course_name"));
                course.setDuration(rs.getString("duration"));
                course.setSemester(rs.getString("semester"));
                course.setFee(rs.getDouble("fee"));
                course.setDescription(rs.getString("description"));

                list.add(course);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Get Course By ID
    public Course getCourseById(int id) {

        Course course = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM courses WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                course = new Course();

                course.setId(rs.getInt("id"));
                course.setCourseCode(rs.getString("course_code"));
                course.setCourseName(rs.getString("course_name"));
                course.setDuration(rs.getString("duration"));
                course.setSemester(rs.getString("semester"));
                course.setFee(rs.getDouble("fee"));
                course.setDescription(rs.getString("description"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return course;
    }

    // Update Course
    public boolean updateCourse(Course course) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE courses SET course_code=?, course_name=?, duration=?, semester=?, fee=?, description=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, course.getCourseCode());
            ps.setString(2, course.getCourseName());
            ps.setString(3, course.getDuration());
            ps.setString(4, course.getSemester());
            ps.setDouble(5, course.getFee());
            ps.setString(6, course.getDescription());
            ps.setInt(7, course.getId());

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // Delete Course
    public boolean deleteCourse(int id) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM courses WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}