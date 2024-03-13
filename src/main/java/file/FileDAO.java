package file;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class FileDAO {

	private Connection conn;
	
	public FileDAO() {
		
		try { // 데이터 베이스 연동
			String dbURL = "jdbc:mysql://localhost:3306/file";
			String dbID = "root";
			String dbPassword = "12345";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int uploae(String fileName, String fileRealName) {
		String SQL = "insert into file valuse(?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);// Statement=SQL구문실행 역할 -> PreparedStatement는 Statement클래스의 기능 향상
			pstmt.setString(1, fileName);
			pstmt.setString(2, fileRealName);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 정수 리턴값을 사용하는 경우 0:거짓, 1:참 / 1:검색 후, 0:검색 , -1:검색전
	}
	
}
