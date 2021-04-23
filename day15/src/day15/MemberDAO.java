package day15;

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
	
	// 로그인 기능을 구현하는 메서드
	public MemberDTO getLoginMember(MemberDTO inputData) {
		MemberDTO login = null;
		String sql = "select * from member where id=? and pw=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputData.getId());
			pstmt.setString(2, inputData.getPw());
			rs = pstmt.executeQuery();
			
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
		} finally {		// return 이후에도 finally는 반드시 실행된다
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return login;
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
	
	// 회원탈퇴 기능
	public int getDropMember(MemberDTO inputData) {
		int row = 0;
		String sql = "delete from member where id=? and pw=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputData.getId());
			pstmt.setString(2, inputData.getPw());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("getDropMember : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return row;
	}
	
	// 정보 수정 기능
	public int getUpdateMember(MemberDTO inputData) {
		int row = 0;
		System.out.println("[" + inputData.getPw() + "]");
		boolean flag = inputData.getPw() != null;
		
		String sql = "update member set " + (flag ? "pw=?, " : "") + "name=?, age=? where id=?";
		System.out.println("SQL : " + sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			if(flag == true) {	// 비밀번호까지 들어간 쿼리문
				pstmt.setString(1, inputData.getPw());
				pstmt.setString(2, inputData.getName());
				pstmt.setInt(3, inputData.getAge());
				pstmt.setString(4, inputData.getId());
			} else {
				pstmt.setString(1, inputData.getName());
				pstmt.setInt(2, inputData.getAge());
				pstmt.setString(3, inputData.getId());
			}
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("getUpdateMember : " + e);
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
