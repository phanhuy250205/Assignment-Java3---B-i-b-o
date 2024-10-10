package Dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import JDBC.jdbc;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
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
				String image = rs.getString("image");

				Users user = new Users(id, email, password, role, fullname, birthday, gender, mobile, image);
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

		try (Connection con = jdbc.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {

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
					String image = rs.getString("image");

					result = new Users(id, email, password, role, fullname, birthday, gender, mobile, image);
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

		try (Connection con = jdbc.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {

			st.setString(1, user.getemail());
			st.setString(2, user.getpassword());

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
					String image = rs.getString("image");

					result = new Users(id, email, password, role, fullname, birthday, gender, mobile, image);
				}
			}

		} catch (SQLException e) {
			System.err.println("Error in selectByEmailAndPassword: " + e.getMessage());
		}

		return result;
	}

	public int insert(Users user) {
	    int result = 0;
	    String sql = "INSERT INTO Users (Id, Email, Password, Role, Fullname, Birthday, Gender, Mobile, image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

	    // Sử dụng try-with-resources để tự động đóng Connection và PreparedStatement
	    try (Connection con = jdbc.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {

	        // Thiết lập các tham số cho câu truy vấn
	        st.setString(1, user.getId()); // ID người dùng
	        st.setString(2, user.getemail()); // Email người dùng
	        st.setString(3, user.getpassword()); // Mật khẩu (chuyển hash mật khẩu nếu cần)
	        st.setBoolean(4, user.isRole()); // Vai trò (admin/nhân viên)
	        st.setString(5, user.getfullname()); // Họ và tên người dùng
	        st.setDate(6, new java.sql.Date(user.getbirthday().getTime())); // Ngày sinh
	        st.setBoolean(7, user.isgender()); // Giới tính
	        st.setString(8, user.getmobile()); // Số điện thoại
	        st.setString(9, user.getimage());
	        
	        

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


	public int delete(Users user) {
		int result = 0;
		String sql = "DELETE FROM Users WHERE Id=?";

		try (Connection con = jdbc.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {

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
		String sql = "UPDATE Users SET Email=?, password=?, Role=?, Fullname=?, Birthday=?, Gender=?, Mobile=? , image = ? WHERE Id=?";

		try (Connection con = jdbc.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {

			st.setString(1, user.getemail());
			st.setString(2, user.getpassword());
			st.setBoolean(3, user.isRole());
			st.setString(4, user.getfullname());
			st.setDate(5, new Date(user.getbirthday().getTime()));
			st.setBoolean(6, user.isgender());
			st.setString(7, user.getmobile());
			st.setString(8, user.getimage());
			st.setString(9, user.getId());
			

			result = st.executeUpdate();
			System.out.println("Updated: " + result + " rows.");

		} catch (SQLException e) {
			System.err.println("Error in update: " + e.getMessage());
		}

		return result;
	}
	
	public int updateInfo(Users user) {
	    int result = 0;
	    String sql = "UPDATE Users SET Email=?, Fullname=?, Birthday=?, Gender=?, Mobile=?  WHERE Id=?";

	    try (Connection con = jdbc.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
	        // Cài đặt tham số cho câu lệnh SQL
	        st.setString(1, user.getemail()); // Đặt Email vào vị trí 1
	        st.setString(2, user.getfullname()); // Đặt Fullname vào vị trí 2
	        st.setDate(3, new java.sql.Date(user.getbirthday().getTime())); // Ngày sinh ở vị trí 3
	        st.setBoolean(4, user.isgender()); // Giới tính ở vị trí 4
	        st.setString(5, user.getmobile()); // Số điện thoại ở vị trí 5
	        
	        st.setString(6, user.getId()); // ID người dùng ở vị trí 6

	        // Thực thi câu lệnh cập nhật
	        result = st.executeUpdate();
	        System.out.println("Updated: " + result + " rows.");

	    } catch (SQLException e) {
	        System.err.println("Error in update: " + e.getMessage());
	    }

	    return result;
	}



	public boolean changePassword(Users user) {
		int result = 0;
		String sql = "UPDATE Users SET password=? WHERE Email=?";

		try (Connection con = jdbc.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {

			// Kiểm tra xem email có tồn tại và hợp lệ không trước khi đổi mật khẩu
			if (user.getemail() != null && !user.getemail().isEmpty()) {
				st.setString(1, user.getpassword());
				st.setString(2, user.getemail());

				result = st.executeUpdate();
				System.out.println("Password changed for email: " + user.getemail());
			} else {
				System.out.println("Email is not valid: " + user.getemail());
			}

		} catch (SQLException e) {
			System.err.println("Error in changePassword: " + e.getMessage());
		}

		return result > 0;
	}

	public boolean checkUsernameExists(String email) {
		boolean exists = false;
		String sql = "SELECT * FROM Users WHERE Email=?";

		try (Connection con = jdbc.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {

			st.setString(1, email);

			try (ResultSet rs = st.executeQuery()) {
				exists = rs.next(); // true if a record was found
			}

		} catch (SQLException e) {
			System.err.println("Error in checkUsernameExists: " + e.getMessage());
		}

		return exists;
	}

	public Users findByEmail(String Email) {
    	Users users = null;
    	String sql = "SELECT * from Users  WHERE Email = ? ";
    	try (Connection con = jdbc.getConnection();
    	PreparedStatement st = con.prepareStatement(sql)){
			st.setString(1, Email);
			ResultSet rs = st.executeQuery();
			if (rs.next()) {
				users = new Users();
				users.setId(rs.getString("Id"));  // Lấy ID của người dùng
				 
				users.setemail(rs.getString("Email"));
				users.setpassword(rs.getString("password"));  // Lấy mật khẩu hiện tại của người dùng
	           
			}
		} catch (Exception e) {
			System.err.println("Error in findByEmail: " + e.getMessage());
		}
			
		return users;
    }

}
