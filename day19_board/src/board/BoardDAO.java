package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
		return selectList(null, null);
	}
	
	// 조건을 전달받아서, 조건에 맞는 리스트를 반환하는 메서드
	public List<BoardDTO> selectList(String type, String word) {
		ArrayList<BoardDTO> list = null;
		boolean flag = type != null && word != null;	// 검색 쿼리를 적용할 조건
		String search = String.format("%s like '%%%s%%' and ", type, word);
		
		String sql = "select * from board where ";
		sql += (flag ? search : "");
		sql += " deleted = 'n' order by idx desc";
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
	
	// idx를 전달받아서 삭제 처리(update)하는 메서드
	public int delete(int idx) {
		int row = 0;
		String sql = "update board set deleted='y' where idx=?";
		System.out.println("SQL : " + sql);
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("delete : " + e);
		} finally { close(); }
		
		return row;
	}
	
	/// dto를 전달받아서 내용을 수정하고 row를 반환하는 메서드
	public int modify(BoardDTO dto) {
		int row = 0;
		String writeDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
//		String writeDate = new SimpleDateFormat("yyyy-MM-dd a hh:mm").format(new Date());
		// hh는 12시간, HH는 24시간 a : 오전 오후
		boolean flag = dto.getUploadFile() == null;
		String sql = "update board set "
				+ "title=?"
				+ ", writer=?"
				+ ", content=?"
				+ ", writeDate=?"
				+ ", ipaddr=? "
				+ (flag ? "" : ", uploadFile=?")
				+ "where idx=?";
		System.out.println("SQL : " + sql);
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, writeDate);
			pstmt.setString(5, dto.getIpaddr());
			if(flag == false)
				pstmt.setString(6, dto.getUploadFile());
			pstmt.setInt(flag ? 6 : 7, dto.getIdx());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("modify : " + e);
		} finally { close(); }
		
		return row;
	}
	
	// 조회수 올리기
	public int viewUp(int idx) {
		int row = 0;
		String sql = "update board set viewCount = viewCount + 1 where idx=?";
		System.out.println("SQL : " + sql);
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("viewUp : " + e);
		}
		return row;
	}
	
	
}
