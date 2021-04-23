package day15_quiz;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ManagerDAO {
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String user = "c##itbank";
	private final String password = "it";
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public ManagerDAO() {
		String driver = "oracle.jdbc.driver.OracleDriver";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버를 찾을 수 없습니다 : " + e);
		} catch (SQLException e) {
			System.out.println("접속에 문제가 발생하였습니다 : " + e);
		}
	}
	
	// 로그인
	public ManagerDTO loginManager(ManagerDTO inputData) {
		ManagerDTO login = null;
		String sql = "select * from manager where id=? and pw=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputData.getId());
			pstmt.setString(2, inputData.getPw());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				login = new ManagerDTO();
				login.setId(rs.getString("id"));
				login.setPw(rs.getString("pw"));
				login.setName(rs.getString("name"));
				login.setEmail(rs.getString("email"));
				return login;
			}
		} catch (SQLException e) {
			System.out.println("loginManager : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return login;
	}
	
	// 회원가입
	public int joinManager(ManagerDTO inputData) {
		int row = 0;
		String sql = "insert into manager values(?, ?, ?, ?)";
		System.out.println("SQL : " + sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputData.getId());
			pstmt.setString(2, inputData.getPw());
			pstmt.setString(3, inputData.getName());
			pstmt.setString(4, inputData.getEmail());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("joinManager : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return row;
	}
	
	// 회원 탈퇴
	public int dropManager(ManagerDTO inputData) {
		int row = 0;
		String sql = "delete from manager where id=? and pw=?";
		System.out.println("SQL : " + sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputData.getId());
			pstmt.setString(2, inputData.getPw());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("dropManager : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return row;
	}
	
	// 회원 정보 수정(이름, 이메일)
	public int updateManager(ManagerDTO inputData) {
		int row = 0;
		String sql = "update manager set name=?, email=? where id=?";
		System.out.println("SQL : " + sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputData.getName());
			pstmt.setString(2, inputData.getEmail());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("updateManager : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return row;
	}
	
	// 비밀번호 변경
	public int updatePassword(ManagerDTO inputData) {
		int row = 0;
		String sql = "update manager set pw=? where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputData.getPw());
		} catch (SQLException e) {
			System.out.println("updatePassword : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return row;
	}
}
