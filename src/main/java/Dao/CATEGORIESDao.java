package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import JDBC.jdbc;

import model.CATEGORIES;



//Loại tên
public class CATEGORIESDao {
	private ArrayList<CATEGORIES> ketqua = new ArrayList<CATEGORIES>();

	private ArrayList<CATEGORIES> selectAll() {
		try {
			// Tạo kết nối đến CSDL
			Connection con = jdbc.getConnection();

			String sql = "SELECT * from CATEGORIES";
			PreparedStatement st = con.prepareStatement(sql);

			// Thực thi câu lệnh sql
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				String maTacGia = rs.getString("Id");
				String Name = rs.getString("Name");

				CATEGORIES tg = new CATEGORIES(maTacGia , Name);

				ketqua.add(tg);

			}
			jdbc.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return ketqua;
	}

	CATEGORIES selectById(CATEGORIES t) {

		CATEGORIES keua = null;
		try {
			Connection con = jdbc.getConnection();

			String sql = "select * from tacgia where matacgia = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getId());

			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				String maTacGia = rs.getString("Id");
				String Name = rs.getString("Name");
				

				keua = new CATEGORIES();
				break;
//			 	ketqua.add(tg);

			}
			jdbc.closeConnection(con);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return keua;
	}
	private int insert(CATEGORIES t) {
		int ketqua = 0;
		try {
			Connection con = jdbc.getConnection();
			String sql = "INSERT INTO CATEGORIES(Id , Name) VALUES(?, ?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getId());
			st.setString(2, t.getName());
			
			ketqua = st.executeUpdate();
			System.out.println("Câu Lệnh Bạn thực thi "+sql);
			System.out.println("Có"+ketqua+"Dòng bị thay đổi");
			
			jdbc.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ketqua;
	}
	
	private int insertAll(ArrayList<CATEGORIES> list) {
		int dem = 0;
		for (CATEGORIES tacGia : list) {
			dem+=this.insert(tacGia);
		}
		return dem;

	}
	
	private int delete(CATEGORIES t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = jdbc.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "DELETE from CATEGORIES "+
					 " WHERE Id=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getId());
			
			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ketQua = st.executeUpdate();
			
			// Bước 4:
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ ketQua+" dòng bị thay đổi!");
			
			// Bước 5:
			jdbc.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ketQua;

	}
	public int deleteAll(ArrayList<CATEGORIES> arr) {
		int dem = 0;
		for (CATEGORIES cate : arr) {
			dem+=this.delete(cate);
		}
		return dem;
	}
	
	public int update(CATEGORIES t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = jdbc.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE CATEGORIES "+
					 " SET " +
					 " Name=?"+
					 " WHERE Id=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getId());
			st.setString(2,t.getName());
			
			// Bước 3: thực thi câu lệnh SQL

			System.out.println(sql);
			ketQua = st.executeUpdate();
			
			// Bước 4:
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ ketQua+" dòng bị thay đổi!");
			
			// Bước 5:
			jdbc.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ketQua;
	}

	public static void main(String[] args) {
		CATEGORIESDao ctg = new CATEGORIESDao();
		ArrayList<CATEGORIES> kq = ctg.selectAll();
		for (CATEGORIES categories : kq) {
			System.out.println(categories.toString());
		}

	}
}
