package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {
	// DataSource, Singleton
	private Connection conn;
	private Context init;
	private DataSource ds;
	private static BoardDAO instance;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public static BoardDAO getInstance() {
		if(instance == null) {
			instance = new BoardDAO();
		}
		return instance;
	}
	
	public BoardDAO() {
		try {
			init = (Context) new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.out.println("생성자 예외 발생 : " + e);
		} finally {
			if(conn != null) try { conn.close(); } catch(Exception e) {}
		}
	}
	
	private void close() {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			System.out.println("close : " + e);
		}
	}
	
	// 게시글의 목록을 불러와서 리스트형태로 반환하는 메서드
	public List<BoardDTO> selectList() {
		ArrayList<BoardDTO> list = null;
		
		String sql = "select * from board where deleted = 'n' order by idx desc";
		System.out.println("SQL : " + sql);
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<BoardDTO>();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setWriteDate(rs.getString("writeDate"));
				dto.setIpaddr(rs.getString("ipaddr"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setUploadFile(rs.getString("uploadFile"));
				dto.setDeleted(rs.getString("deleted"));
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("selectList : " + e);
		} finally {
			close();
		}
		
		return list;
	}
	
	// idx로 글을 하나 불러오는 메서드
	public BoardDTO selectOne(int idx) {
		BoardDTO dto = null;
		String sql = "select * from board where idx=?";
		System.out.println("SQL : " + sql);
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new BoardDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setWriteDate(rs.getString("writeDate"));
				dto.setIpaddr(rs.getString("ipaddr"));
				dto.setViewCount(rs.getInt("viewCount"));
				dto.setUploadFile(rs.getString("uploadFile"));
				dto.setDeleted(rs.getString("deleted"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		
		return dto;
	}
	
	// dto를 전달받아서 DB에 insert하는 메서드
	public int insert(BoardDTO dto) {
//		System.out.println(dto);
		int row = 0;
		String sql = "insert into board (idx, title, writer, content, ipaddr, uploadFile) "
				+ "values (board_seq.nextval, ?, ?, ?, ?, ?)";
		System.out.println("SQL : " + sql);
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getIpaddr());
			pstmt.setString(5, dto.getUploadFile() == null ? "default.jpg" : dto.getUploadFile());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insert : " + e);
		} finally { close(); }
		return row;
	}
}
