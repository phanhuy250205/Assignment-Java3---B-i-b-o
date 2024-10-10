package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import JDBC.jdbc;
import model.NEWSLETTERS;

public class NewsletterDAO {

    // Method để thêm một email mới
    public int addEmail(NEWSLETTERS newsletter) {
        String sql = "INSERT INTO NEWSLETTERS (Email, Enabled) VALUES (?, ?)";
        try (Connection con = jdbc.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, newsletter.getEmail());
            ps.setBoolean(2, newsletter.isEnabled());
            return ps.executeUpdate();  // Trả về số hàng được thêm

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;  // Trả về 0 nếu thêm không thành công
        }
    }

    // Method để cập nhật trạng thái của email
    public int updateEmailStatus(NEWSLETTERS newsletter) {
        String sql = "UPDATE NEWSLETTERS SET Enabled = ? WHERE Email = ?";
        try (Connection con = jdbc.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setBoolean(1, newsletter.isEnabled());
            ps.setString(2, newsletter.getEmail());
            return ps.executeUpdate();  // Trả về số hàng được cập nhật

        } catch (SQLException e) {
            System.err.println("Error when updating email status: " + e.getMessage());
            return 0;  // Trả về 0 nếu cập nhật không thành công
        }
    }

    // Method để xóa một email subscription
    public int deleteEmail(String email) {
        String sql = "DELETE FROM NEWSLETTERS WHERE Email = ?";
        try (Connection con = jdbc.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            return ps.executeUpdate();  // Trả về số hàng đã xóa

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;  // Trả về 0 nếu xóa không thành công
        }
    }

    // Method để lấy tất cả email
    public List<NEWSLETTERS> getAllEmails() {
        ArrayList<NEWSLETTERS> newsletters = new ArrayList<>();
        String sql = "SELECT * FROM NEWSLETTERS";
        try (Connection con = jdbc.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String email = rs.getString("Email");
                boolean enabled = rs.getBoolean("Enabled");
                newsletters.add(new NEWSLETTERS(email, enabled));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newsletters;
    }

    // Method để kiểm tra xem email đã tồn tại chưa
    public boolean exists(String email) {
        String sql = "SELECT 1 FROM NEWSLETTERS WHERE Email = ?";
        try (Connection con = jdbc.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);  // Đặt giá trị của email vào câu truy vấn
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();  // Trả về true nếu có dòng nào trong kết quả
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;  // Trả về false nếu có lỗi hoặc email không tồn tại
    }
}
