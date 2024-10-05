package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import JDBC.jdbc;
import model.News;
import model.Users;

public class Newsdao {
	public ArrayList<News> selectAll() {
		ArrayList<News> result = new ArrayList<News>();
		String sql = "select * from News";
		try (Connection con = jdbc.getConnection();
				PreparedStatement st = con.prepareStatement(sql);
				ResultSet rs = st.executeQuery();) {

			while (rs.next()) {
				String Id = rs.getString("Id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String Image = rs.getString("Image");
				Date PostDate = rs.getDate("PostDate"); // Ngày Đăng
				String Author = rs.getString("Author");
				int ViewCount = rs.getInt("ViewCount");// Số lượt xem
				String CategoryId = rs.getString("CategoryId");// Mã loại tin (liên kết với bảng CATEGORIES)
				boolean BIT = rs.getBoolean("BIT");

				News news = new News(Id, title, content, Image, PostDate, Author, ViewCount, CategoryId, BIT);
				result.add(news);
			}
		} catch (Exception e) {

			System.err.println("Error in selectAll: " + e.getMessage());
		}
		return result;
	}

	public News selectById(News news) {
		News result = null;
		String sql = "SELECT * FROM News WHERE Id=?";

		try (Connection con = jdbc.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {

			st.setString(1, news.getId());

			try (ResultSet rs = st.executeQuery()) {
				if (rs.next()) {
					String Id = rs.getString("Id");
					String title = rs.getString("title");
					String content = rs.getString("content");
					String Image = rs.getString("Image");
					Date PostDate = rs.getDate("PostDate"); // Ngày Đăng
					String Author = rs.getString("Author");
					int ViewCount = rs.getInt("ViewCount");// Số lượt xem
					String CategoryId = rs.getString("CategoryId");// Mã loại tin (liên kết với bảng CATEGORIES)
					boolean BIT = rs.getBoolean("BIT");
					result = new News(Id, title, content, Image, PostDate, Author, ViewCount, CategoryId, BIT);
				}
			}

		} catch (SQLException e) {
			System.err.println("Error in selectById: " + e.getMessage());
		}
		return result;

	}
	public int insert(News news) {
		int result = 0;
		String sql = "INSERT INTO News (Id, Title, Content, Image, PostedDate, Author, ViewCount, CategoryId, Home) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)";

		// Sử dụng try-with-resources để tự động đóng Connection và PreparedStatement
		try (Connection con = jdbc.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {

			// Thiết lập các tham số cho câu truy vấn
			st.setString(1, news.getId()); // ID người dùng
			st.setString(2, news.gettitle()); // Email người dùng
			st.setString(3, news.getcontent()); // Mật khẩu (chuyển hash mật khẩu nếu cần)
			st.setString(4, news.getimage()); // Vai trò (admin/nhân viên)
			st.setDate(5, (java.sql.Date) news.getpostedDate()); // Họ và tên người dùng
			st.setString(4, news.getauthor()); 
			st.setInt(6, news.getviewcount()); // Ngày sinh
			st.setString(7, news.getcategoryId()); // Giới tính
			st.setBoolean(8, news.ishome()); // Số điện thoại

			// Thực thi câu truy vấn và lấy số bản ghi đã chèn
			result = st.executeUpdate();

			// In thông tin câu truy vấn đã thực hiện
			System.out.println("SQL Query: " + st.toString());
			System.out.println("Inserted: " + result + " rows.");

		} catch (SQLException e) {
			// Xử lý ngoại lệ liên quan đến cơ sở dữ liệu
			System.err.println("Error in insert: " + e.getMessage());
		} catch (Exception e) {
			// Xử lý ngoại lệ khác
			System.err.println("Unexpected error: " + e.getMessage());
		}

		return result; // Trả về số bản ghi đã chèn (có thể là 0 nếu thất bại)
	}

}
