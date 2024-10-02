package Dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import JDBC.jdbc;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import model.Users;

public class usedao {

    public ArrayList<Users> selectAll() {
        ArrayList<Users> results = new ArrayList<>();
        String sql = "SELECT * FROM Users";

        try (Connection con = jdbc.getConnection(); 
             PreparedStatement st = con.prepareStatement(sql); 
             ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                String id = rs.getString("Id");
                String email = rs.getString("Email");
                String password = rs.getString("password");
                String fullname = rs.getString("Fullname");
                Date birthday = rs.getDate("Birthday");
                boolean gender = rs.getBoolean("Gender");
                String mobile = rs.getString("Mobile");
                boolean role = rs.getBoolean("Role");

                Users user = new Users(id, email, password, role, fullname, birthday, gender, mobile, mobile);
                results.add(user);
            }

        } catch (SQLException e) {
            // Log error message
            System.err.println("Error in selectAll: " + e.getMessage());
        }

        return results;
    }

    public Users selectById(Users user) {
        Users result = null;
        String sql = "SELECT * FROM Users WHERE Id=?";

        try (Connection con = jdbc.getConnection(); 
             PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, user.getId());

            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    String id = rs.getString("Id");
                    String email = rs.getString("Email");
                    String password = rs.getString("password");
                    String fullname = rs.getString("Fullname");
                    Date birthday = rs.getDate("Birthday");
                    boolean gender = rs.getBoolean("Gender");
                    String mobile = rs.getString("Mobile");
                    boolean role = rs.getBoolean("Role");

                    result = new Users(id, email, password, role, fullname, birthday, gender, mobile, mobile);
                }
            }

        } catch (SQLException e) {
            System.err.println("Error in selectById: " + e.getMessage());
        }

        return result;
    }

    public Users selectByEmailAndPassword(Users user) {
        Users result = null;
        String sql = "SELECT * FROM Users WHERE Email=? AND password=?";

        try (Connection con = jdbc.getConnection(); 
             PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, user.getEmail());
            st.setString(2, user.getPassword());

            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    String id = rs.getString("Id");
                    String email = rs.getString("Email");
                    String password = rs.getString("password");
                    String fullname = rs.getString("Fullname");
                    Date birthday = rs.getDate("Birthday");
                    boolean gender = rs.getBoolean("Gender");
                    String mobile = rs.getString("Mobile");
                    boolean role = rs.getBoolean("Role");

                    result = new Users(id, email, password, role, fullname, birthday, gender, mobile, mobile);
                }
            }

        } catch (SQLException e) {
            System.err.println("Error in selectByEmailAndPassword: " + e.getMessage());
        }

        return result;
    }

    public int insert(Users user) {
        int result = 0;
        String sql = "INSERT INTO Users (Id, Email, Password, Role, Fullname, Birthday, Gender, Mobile) VALUES(?,?,?,?,?,?,?,?)";

        try (Connection con = jdbc.getConnection(); 
             PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, user.getId());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPassword());
            st.setBoolean(4, user.isRole());
            st.setString(5, user.getFullName());
            st.setDate(6, new Date(user.getBirthday().getTime()));
            st.setBoolean(7, user.isGender());
            st.setString(8, user.getMobile());

            result = st.executeUpdate();
            System.out.println("Inserted: " + result + " rows.");

        } catch (SQLException e) {
            System.err.println("Error in insert: " + e.getMessage());
        }

        return result;
    }

    public int delete(Users user) {
        int result = 0;
        String sql = "DELETE FROM Users WHERE Id=?";

        try (Connection con = jdbc.getConnection(); 
             PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, user.getId());
            result = st.executeUpdate();
            System.out.println("Deleted: " + result + " rows.");

        } catch (SQLException e) {
            System.err.println("Error in delete: " + e.getMessage());
        }

        return result;
    }

    public int update(Users user) {
        int result = 0;
        String sql = "UPDATE Users SET Email=?, password=?, Role=?, Fullname=?, Birthday=?, Gender=?, Mobile=? WHERE Id=?";

        try (Connection con = jdbc.getConnection(); 
             PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, user.getEmail());
            st.setString(2, user.getPassword());
            st.setBoolean(3, user.isRole());
            st.setString(4, user.getFullName());
            st.setDate(5, new Date(user.getBirthday().getTime()));
            st.setBoolean(6, user.isGender());
            st.setString(7, user.getMobile());
            st.setString(8, user.getId());

            result = st.executeUpdate();
            System.out.println("Updated: " + result + " rows.");

        } catch (SQLException e) {
            System.err.println("Error in update: " + e.getMessage());
        }

        return result;
    }

    public boolean changePassword(Users user) {
        int result = 0;
        String sql = "UPDATE Users SET password=? WHERE Id=?";

        try (Connection con = jdbc.getConnection(); 
             PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, user.getPassword());
            st.setString(2, user.getId());

            result = st.executeUpdate();
            System.out.println("Password changed for: " + user.getId());

        } catch (SQLException e) {
            System.err.println("Error in changePassword: " + e.getMessage());
        }

        return result > 0;
    }

    public boolean checkUsernameExists(String email) {
        boolean exists = false;
        String sql = "SELECT * FROM Users WHERE Email=?";

        try (Connection con = jdbc.getConnection(); 
             PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, email);

            try (ResultSet rs = st.executeQuery()) {
                exists = rs.next(); // true if a record was found
            }

        } catch (SQLException e) {
            System.err.println("Error in checkUsernameExists: " + e.getMessage());
        }

        return exists;
    }
    
}
