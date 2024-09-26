package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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

	public static void main(String[] args) {
		CATEGORIESDao ctg = new CATEGORIESDao();
		ArrayList<CATEGORIES> kq = ctg.selectAll();
		for (CATEGORIES categories : kq) {
			System.out.println(categories.toString());
		}

	}
}
