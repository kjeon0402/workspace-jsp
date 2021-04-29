package day13;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.DriverManager;

public class MemberDAO {	// Database Access Object
	
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";		// 접속 주소
	private final String user = "c##itbank";		// 계정
	private final String password = "it";	// 비밀번호
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	public MemberDAO() {	// 예외처리도 직접 수행해보세요
		String driver = "oracle.jdbc.driver.OracleDriver";	// JDBC Driver의 패키지. 클래스
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버를 찾을 수 없습니다 : " + e);
		} catch (SQLException e) {
			System.out.println("접속에 문제가 발생했습니다 : " + e);
		}
	}
	
	// 전체 목록을 리스트 형태로 반환하는 메서드
	public List<MemberDTO> getMemberList() {
		// ArrayList 객체를 생성해도 List 형태로 반환할 수 있다(List는 ArrayList의 상위 클래스, 인터페이스)
		String sql = "select * from member";
		ArrayList<MemberDTO> list = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			list = new ArrayList<MemberDTO>();
			
			while(rs.next()) {	// 결과가 3줄이면 3번 반복된다. 반복분 한 번당 한 줄씩 처리한다
				MemberDTO m = new MemberDTO();
				m.setId(rs.getString("id"));		// 컬럼 이름을 일치시켜주자
				m.setPw(rs.getString("pw"));
				m.setName(rs.getString("name"));
				m.setAge(rs.getInt("age"));
				list.add(m);
			}
		} catch (SQLException e) {
			System.out.println("getMemberList : " + e);
		} finally {
			try { if(rs != null) 	rs.close(); } 	catch(Exception e) {}
			try { if(stmt != null) 	stmt.close(); } catch(Exception e) {}
			try { if(conn != null) 	conn.close(); } catch(Exception e) {}
		}
		return list;
	}
	
	// id 검색어 전달 받아서 조건에 맞는 객체 하나를 반환하는 메서드
	public MemberDTO getMember(String id) {	// request.getParameter("id")
		String sql = "select * from member where id='" + id + "'";
		System.out.println("SQL : " + sql);
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {	// while은 재사용 가능한 if라고 생각할 수 있다
				MemberDTO m = new MemberDTO();
				m.setId(rs.getString("id"));		
				m.setPw(rs.getString("pw"));
				m.setName(rs.getString("name"));
				m.setAge(rs.getInt("age"));
				return m;
			}
			
		} catch (SQLException e) {
			System.out.println("getMember : " + e);
		} finally {
			try { if(rs != null) 	rs.close(); } 	catch(Exception e) {}
			try { if(stmt != null) 	stmt.close(); } catch(Exception e) {}
			try { if(conn != null) 	conn.close(); } catch(Exception e) {}
		}
		return null;	// 조건에 맞는 값이 없으면 null을 반환하도록 처리
	}
}


