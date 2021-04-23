package day15_quiz;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BookDAO {
	private final String url = "jdbc.oracle.thin:@localhost:1521:xe";
	private final String user = "c##itbank";
	private final String password = "it";
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public BookDAO() {
		String driver = "oracle.jdbc.driver.OracleDriver";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버를 찾을 수 없습니다 : " + e);
		} catch (SQLException e) {
			System.out.println("접속을 할 수 없습니다 : " + e);
		}
	}
	
	// 책 전체 목록 불러오기
	public ArrayList<BookDTO> allList() {
		String sql = "select * from book order by title";
		ArrayList<BookDTO> list = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<BookDTO>();
			
			while(rs.next()) {
				BookDTO dto = new BookDTO();
				dto.setTitle(rs.getString("title"));
				dto.setAuthor(rs.getString("author"));
				dto.setPublisher(rs.getString("publisher"));
				dto.setPbday(rs.getString("pbday"));
				dto.setCount(rs.getInt("count"));
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("allList : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return list;
	}
	
	// 목록에 책 추가하기
	public int addBook(BookDTO inputData) {
		int row = 0;
		String sql = "insert into book values(?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputData.getTitle());
			pstmt.setString(2, inputData.getAuthor());
			pstmt.setString(3, inputData.getPublisher());
			pstmt.setString(4, inputData.getPbday());
			pstmt.setInt(5, inputData.getCount());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("addBook : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}		
		return row;
	}
	
	// 책 삭제하기
	public int deleteBooke(BookDTO inputData) {
		int row = 0;
		String sql = "delete from member where title=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputData.getTitle());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("deleteBook : " + e);
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
