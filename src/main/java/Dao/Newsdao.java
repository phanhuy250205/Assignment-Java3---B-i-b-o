package Dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import JDBC.jdbc;
import model.CATEGORIES;
import model.News;

public class Newsdao {

	// Lấy tất cả các tin tức
	public static ArrayList<News> selectAll() {
		ArrayList<News> result = new ArrayList<>();
		String sql = "SELECT * FROM News";

		System.out.println("Executing SQL: " + sql);
		try (Connection con = jdbc.getConnection();
				PreparedStatement st = con.prepareStatement(sql);
				ResultSet rs = st.executeQuery()) {

			while (rs.next()) {
				String id = rs.getString("Id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String image = rs.getString("Image");
				Date postDate = rs.getDate("PostedDate");
				String author = rs.getString("Author");
				int viewCount = rs.getInt("ViewCount"); // Change to camelCase
				String categoryId = rs.getString("CategoryId");
				boolean home = rs.getBoolean("Home");

				News news = new News(id, title, content, image, postDate, author, viewCount, categoryId, home);
				result.add(news);
			}
		} catch (Exception e) {
			System.err.println("Error in selectAll: " + e.getMessage());
		}
		return result;
	}

	// Lấy tin tức theo ID
	public News selectById(String id) {
		News result = null;
		String sql = "SELECT * FROM News WHERE Id = ?";

		try (Connection con = jdbc.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
			st.setString(1, id);

			try (ResultSet rs = st.executeQuery()) {
				if (rs.next()) {
					String title = rs.getString("title");
					String content = rs.getString("content");
					String image = rs.getString("Image");
					Date postDate = rs.getDate("PostedDate");
					String author = rs.getString("Author");
					int viewCount = rs.getInt("ViewCount"); // Change to camelCase
					String categoryId = rs.getString("CategoryId");
					boolean home = rs.getBoolean("Home");

					result = new News(id, title, content, image, postDate, author, viewCount, categoryId, home);
				}
			}
		} catch (SQLException e) {
			System.err.println("Error in selectById: " + e.getMessage());
		}
		return result;
	}

	// Chèn tin tức mới
	public int insert(News news) {
		int result = 0;
		String sql = "INSERT INTO News (Id, Title, Content, Image, PostedDate, Author, ViewCount, CategoryId, Home) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection con = jdbc.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
			st.setString(1, news.getId());
			st.setString(2, news.getTitle());
			st.setString(3, news.getContent());
			st.setString(4, news.getImage());
			st.setDate(5, new java.sql.Date(news.getPostedDate().getTime()));
			st.setString(6, news.getAuthor());
			st.setInt(7, news.getViewCount()); // Change to camelCase
			st.setString(8, news.getCategoryId());
			st.setBoolean(9, news.isHome());

			result = st.executeUpdate();
			System.out.println("Inserted: " + result + " rows.");
		} catch (SQLException e) {
			System.err.println("Error in insert: " + e.getMessage());
		}
		return result;
	}

	// Xóa tin tức theo ID
	public int delete(String id) {
		int result = 0;
		String sql = "DELETE FROM News WHERE Id=?";

		try (Connection con = jdbc.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
			st.setString(1, id);
			result = st.executeUpdate();
			System.out.println("Deleted: " + result + " rows.");
		} catch (SQLException e) {
			System.err.println("Error in delete: " + e.getMessage());
		}

		return result;
	}

	// Cập nhật tin tức theo ID
	public int update(News news) {
		int result = 0;
		String sql = "UPDATE News SET Title=?, Content=?, Image=?, PostedDate=?, Author=?, ViewCount=?, CategoryId=?, Home=? WHERE Id=?";

		try (Connection con = jdbc.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
			System.out.println("Updating news with ID: " + news.getId());

			st.setString(1, news.getTitle());
			st.setString(2, news.getContent());
			st.setString(3, news.getImage());
			st.setDate(4, new java.sql.Date(news.getPostedDate().getTime()));
			st.setString(5, news.getAuthor());
			st.setInt(6, news.getViewCount()); // Change to camelCase
			st.setString(7, news.getCategoryId());
			st.setBoolean(8, news.isHome());
			st.setString(9, news.getId());

			result = st.executeUpdate();
			System.out.println("Updated: " + result + " rows.");
		} catch (SQLException e) {
			System.err.println("Error in update: " + e.getMessage());
		}

		return result;
	}

	public List<News> selectByCategory(String categoryId) {
		List<News> newsList = new ArrayList<>();
		String sql = "SELECT id, title, content, author, postedDate, image FROM news WHERE categoryId = ?";

		try (Connection conn = jdbc.getConnection(); // Hàm này cần trả về một kết nối hợp lệ
				PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, categoryId);
			ResultSet rs = pstmt.executeQuery();

			// Duyệt kết quả trả về từ ResultSet
			while (rs.next()) {
				News news = new News();
				news.setId(rs.getString("id"));
				news.setTitle(rs.getString("title"));
				news.setContent(rs.getString("content"));
				news.setAuthor(rs.getString("author"));
				news.setPostedDate(rs.getDate("postedDate"));
				news.setImage(rs.getString("image"));

				// Thêm đối tượng News vào danh sách
				newsList.add(news);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return newsList;
	}

	// Hàm chính để kiểm tra thao tác xóa (test)
	
	    public List<CATEGORIES> selectAllCatty() {
	        List<CATEGORIES> categoriesList = new ArrayList<>();
	        String sql = "SELECT Id, Name FROM CATEGORIES"; // Câu lệnh SQL để lấy tất cả thể loại

	        try (Connection con = jdbc.getConnection();
	             PreparedStatement st = con.prepareStatement(sql);
	             ResultSet rs = st.executeQuery()) {

	            while (rs.next()) {
	                String id = rs.getString("Id");
	                String name = rs.getString("Name");
	                categoriesList.add(new CATEGORIES(id, name));
	            }
	        } catch (SQLException e) {
	            System.err.println("Error in selectAll: " + e.getMessage());
	        }

	        return categoriesList;
	    }
	    public List<News> getLatestNews() {
	        List<News> newsList = new ArrayList<>();
	        String sql = "{CALL GetLatestNews}";  // Gọi stored procedure GetLatestNews

	        try (Connection conn = jdbc.getConnection();
	             CallableStatement stmt = conn.prepareCall(sql);
	             ResultSet rs = stmt.executeQuery()) {

	            while (rs.next()) {
	                News news = new News();
	                news.setId(rs.getString("Id"));
	                news.setTitle(rs.getString("Title"));
	                news.setContent(rs.getString("Content"));
	                news.setImage(rs.getString("Image"));
	                news.setPostedDate(rs.getDate("PostedDate"));
	                news.setAuthor(rs.getString("Author"));
	                news.setViewCount(rs.getInt("ViewCount"));
	                news.setCategoryId(rs.getString("CategoryId"));
	                

	                newsList.add(news);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return newsList;
	    }

	    public List<News> getTopViewedNews() {
	        List<News> newsList = new ArrayList<>();
	        String sql = "{CALL GetTopViewedNews}";  // Gọi stored procedure GetTopViewedNews

	        try (Connection conn = jdbc.getConnection();
	             CallableStatement stmt = conn.prepareCall(sql);
	             ResultSet rs = stmt.executeQuery()) {

	            while (rs.next()) {
	                News news = new News();
	                news.setId(rs.getString("Id"));
	                news.setTitle(rs.getString("Title"));
	                news.setContent(rs.getString("Content"));
	                news.setImage(rs.getString("Image"));
	                news.setPostedDate(rs.getDate("PostedDate"));
	                news.setAuthor(rs.getString("Author"));
	                news.setViewCount(rs.getInt("ViewCount"));
	                news.setCategoryId(rs.getString("CategoryId"));
	                

	                newsList.add(news);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return newsList;
	    }

}


