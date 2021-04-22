package day14;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {

	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String user = "c##itbank";
	private final String password = "it";
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public MemberDAO() {
		String driver = "oracle.jdbc.driver.OracleDriver";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버를 찾을 수 없습니다 : " + e);
		} catch (SQLException e) {
			System.out.println("접속에 문제가 발생했습니다 : " + e);
		}
	}
	
	// 전체 목록 불러오기
	public ArrayList<MemberDTO> selectList() {
		String sql = "select * from member order by id";
		ArrayList<MemberDTO> list = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<MemberDTO>();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setAge(rs.getInt("age"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPw(rs.getString("pw"));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return list;
	}
	
	// 회원가입 기능을 구현하는 메서드
	public int getJoinMember(MemberDTO inputData) {
		int row = 0;
		String sql = "insert into member values(?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputData.getId());
			pstmt.setString(2, inputData.getPw());
			pstmt.setString(3, inputData.getName());
			pstmt.setInt(4, inputData.getAge());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("getJoinMember : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return row;
	}
	
	// 로그인 기능을 구현하는 메서드
	public MemberDTO getLoginMember(String id, String pw) {
		String sql = "select * from member where id=? and pw=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			MemberDTO login = null;
			while(rs.next()) {
				login = new MemberDTO();
				login.setId(rs.getString("id"));
				login.setPw(rs.getString("pw"));
				login.setName(rs.getString("name"));
				login.setAge(rs.getInt("age"));
				return login;
			}
			
		} catch (SQLException e) {
			System.out.println("getLoginMember : " + e);
		}
		return null;
	}
}
