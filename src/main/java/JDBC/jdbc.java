package JDBC;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import Dao.usedao;
import model.Users;



public class jdbc {
	static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    static String dburl = "jdbc:sqlserver://localhost:1433;databaseName=QLBaiBao;encrypt=true;trustServerCertificate=true";
    static String username = "huy";
    static String password = "123456";
    
    static {
    	try {
			Class.forName(driver);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
    }
    
    //Mở kết nối 
    
    public static Connection getConnection() throws SQLException {
    	return DriverManager.getConnection(dburl , username,password);
    }
    //Thao tác Với Dữ Liệu 
    public static int executeUpdate(String sql, Object... values) throws SQLException {
        try (Connection connection = getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            for (int i = 0; i < values.length; i++) {
                statement.setObject(i + 1, values[i]);
            }
            return statement.executeUpdate();
        }
    }
    
    //Truy Vấn Dữ Liệu 
    public static ResultSet executeQuery(String sql , Object...values) throws SQLException {
    	Connection connection = getConnection();
    	CallableStatement statement = connection.prepareCall(sql);
    	for (int i = 0; i < values.length; i++) {
			statement.setObject(i+1, values[i]);
		}
    	return statement.executeQuery();
    }
    public static void closeConnection(Connection c) {
    	try {
    		if(c!=null) {
    			c.close();
    		}
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    }
    public static void main(String[] args) {
        // Tạo một đối tượng usedao để gọi các phương thức từ DAO
        usedao userDao = new usedao();
        
        // Tạo dữ liệu cho người dùng mới
        String userId = "U011"; // Giá trị giả định, bạn có thể thay đổi
        String email = "example@example.com";
        String password = "password123";
        boolean role = false; // False là user bình thường, true là admin (tùy theo logic của bạn)
        String fullName = "John Doe";
        Date birthday = new Date(0); // Lấy ngày hiện tại, bạn có thể thay đổi theo nhu cầu
        boolean gender = true; // True là nam, False là nữ
        String mobile = "0123456789";

        // Tạo đối tượng user mới
        Users newUser = new Users(userId, email, password, role, fullName, new java.sql.Date(birthday.getTime()), gender, mobile, mobile);
        
        // Gọi phương thức insert từ usedao
        int rowsInserted = userDao.insert(newUser);
        
        // Kiểm tra kết quả
        if (rowsInserted > 0) {
            System.out.println("User đã được thêm thành công!");
        } else {
            System.out.println("Thêm User thất bại!");
        }
    }
    
}
