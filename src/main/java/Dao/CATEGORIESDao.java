package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import JDBC.jdbc;
import model.CATEGORIES;

public class CATEGORIESDao {

    public ArrayList<CATEGORIES> selectAll() {
        ArrayList<CATEGORIES> categories = new ArrayList<>();
        String sql = "SELECT * FROM CATEGORIES";
        try (Connection con = jdbc.getConnection();
             PreparedStatement st = con.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                String id = rs.getString("Id");
                String name = rs.getString("Name");
                categories.add(new CATEGORIES(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    public CATEGORIES selectById(String id) {
        String sql = "SELECT * FROM CATEGORIES WHERE Id = ?";
        try (Connection con = jdbc.getConnection();
             PreparedStatement st = con.prepareStatement(sql)) {
             
            st.setString(1, id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return new CATEGORIES(rs.getString("Id"), rs.getString("Name"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int insert(CATEGORIES category) {
        String sql = "INSERT INTO CATEGORIES (Id, Name) VALUES (?, ?)";
        try (Connection con = jdbc.getConnection();
             PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, category.getId());
            st.setString(2, category.getName());
            return st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int update(CATEGORIES category) {
        String sql = "UPDATE CATEGORIES SET Name = ? WHERE Id = ?";
        try (Connection con = jdbc.getConnection();
             PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, category.getName());
            st.setString(2, category.getId());
            return st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int delete(CATEGORIES category) {
        String sql = "DELETE FROM CATEGORIES WHERE Id = ?";
        try (Connection con = jdbc.getConnection();
             PreparedStatement st = con.prepareStatement(sql)) {

            st.setString(1, category.getId());
            return st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
