package com.sms.dao;
import com.sms.model.Parent;
import com.sms.model.User;
import com.sms.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ParentDAO {

   // Add Parent
public boolean addParent(Parent parent) {

    try {

        Connection con = DBConnection.getConnection();

        // Generate Next Parent ID
        String parentId = "P101";

        PreparedStatement ps1 =
                con.prepareStatement("SELECT MAX(parent_id) FROM parents");

        ResultSet rs = ps1.executeQuery();

        if (rs.next() && rs.getString(1) != null) {

            String lastId = rs.getString(1);

            int num = Integer.parseInt(lastId.substring(1));

            parentId = "P" + (num + 1);
        }

        String sql = "INSERT INTO parents(parent_id, student_id, full_name, email, phone, occupation, address) VALUES(?,?,?,?,?,?,?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, parentId);
        ps.setInt(2, parent.getStudentId());
        ps.setString(3, parent.getFullName());
        ps.setString(4, parent.getEmail());
        ps.setString(5, parent.getPhone());
        ps.setString(6, parent.getOccupation());
        ps.setString(7, parent.getAddress());

        return ps.executeUpdate() > 0;

    } catch (Exception e) {

        e.printStackTrace();
    }

    return false;
}

    // Get All Parents
    public List<Parent> getAllParents() {

        List<Parent> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM parents";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Parent p = new Parent();

                p.setId(rs.getInt("id"));
                p.setParentId(rs.getString("parent_id"));
                p.setStudentId(rs.getInt("student_id"));
                p.setFullName(rs.getString("full_name"));
                p.setEmail(rs.getString("email"));
                p.setPhone(rs.getString("phone"));
                p.setOccupation(rs.getString("occupation"));
                p.setAddress(rs.getString("address"));

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Get Parent By ID
    public Parent getParentById(int id) {

        Parent parent = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM parents WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                parent = new Parent();

                parent.setId(rs.getInt("id"));
                parent.setParentId(rs.getString("parent_id"));
                parent.setStudentId(rs.getInt("student_id"));
                parent.setFullName(rs.getString("full_name"));
                parent.setEmail(rs.getString("email"));
                parent.setPhone(rs.getString("phone"));
                parent.setOccupation(rs.getString("occupation"));
                parent.setAddress(rs.getString("address"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return parent;
    }

    // Update Parent
    public boolean updateParent(Parent parent) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE parents SET student_id=?, full_name=?, email=?, phone=?, occupation=?, address=? WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

          ps.setInt(1, parent.getStudentId());
ps.setString(2, parent.getFullName());
ps.setString(3, parent.getEmail());
ps.setString(4, parent.getPhone());
ps.setString(5, parent.getOccupation());
ps.setString(6, parent.getAddress());
ps.setInt(7, parent.getId());
            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // Delete Parent
    public boolean deleteParent(int id) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM parents WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            status = ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;

    }
public Parent getParentByEmail(String email) {

    Parent parent = null;

    try {

        Connection con = DBConnection.getConnection();

        String sql =
                "SELECT * FROM parents " +
                "WHERE LOWER(TRIM(email)) = LOWER(TRIM(?))";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, email);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            parent = new Parent();

            parent.setId(rs.getInt("id"));
            parent.setParentId(rs.getString("parent_id"));
            parent.setStudentId(rs.getInt("student_id"));
            parent.setFullName(rs.getString("full_name"));
            parent.setEmail(rs.getString("email"));
            parent.setPhone(rs.getString("phone"));
            parent.setOccupation(rs.getString("occupation"));
            parent.setAddress(rs.getString("address"));
        }

    } catch (Exception e) {

        e.printStackTrace();
    }

    return parent;
}

    public boolean addParentFromUser(User user) {

    try {

        // Check if parent already exists
        if (getParentByEmail(user.getEmail()) != null) {
            return true;
        }

        Connection con = DBConnection.getConnection();

        // Generate next Parent ID
        String parentId = "P101";

        PreparedStatement ps1 =
                con.prepareStatement("SELECT MAX(parent_id) FROM parents");

        ResultSet rs = ps1.executeQuery();

        if (rs.next() && rs.getString(1) != null) {

            String lastId = rs.getString(1);

            int num = Integer.parseInt(lastId.substring(1));

            parentId = "P" + (num + 1);
        }

        String sql = "INSERT INTO parents(parent_id, student_id, full_name, email, phone, occupation, address) VALUES(?,?,?,?,?,?,?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, parentId);

        // No student linked yet
        ps.setInt(2, 0);

        ps.setString(3, user.getFullname());
        ps.setString(4, user.getEmail());
        ps.setString(5, user.getPhone());
        ps.setString(6, "");
        ps.setString(7, "");

        return ps.executeUpdate() > 0;

    } catch (Exception e) {

        e.printStackTrace();
    }

    return false;
}
}
