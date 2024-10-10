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
}
    
