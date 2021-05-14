package guest;

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

public class GuestDAO {

	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Context init;
	private static final GuestDAO instance = new GuestDAO();
	
	public static GuestDAO getInstance() {
		return instance;
	}
	
	private GuestDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.out.println("생성자 예외 발생 : " + e);
		}
	}
	
	private void close() {
		try {
			if(rs != null)		{		rs.close();		rs = null;			}
			if(pstmt != null) 	{		pstmt.close();	pstmt = null;		}
			if(conn != null)	{		conn.close();	conn = null;		}
		} catch (SQLException e) {
			System.out.println("close : " + e);
		}
	}
	
	// 회원가입
	public int join(GuestDTO dto) {
		int row = 0;
		String sql = "insert into guest values (guest_seq.nextval, ?, ?, ?, ?, ?, ?)";
		System.out.println("SQL : " + sql);
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getAddress());
			pstmt.setString(5, dto.getCard());
			pstmt.setString(6, dto.getCardpw());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("join : " + e);
		} finally { close(); }
		
		return row;
	}
	
	// 로그인
	public GuestDTO login(GuestDTO input) {
		GuestDTO dto = null;
		String sql = "select * from guest where id=? and pw=?";
		System.out.println("SQL : " + sql);
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, input.getId());
			pstmt.setString(2, input.getPw());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new GuestDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setAddress(rs.getString("address"));
				dto.setCard(rs.getString("card"));
				dto.setCardpw(rs.getString("cardpw"));
			}
			
		} catch (SQLException e) {
			System.out.println("login : " + e);
		} finally { close(); }
		System.out.println(input.getId() + ", " + input.getPw());
		return dto;
	}
	
	// 회원 정보 수정(이름, 주소)
	public int modify(GuestDTO dto) {
		int row = 0;
		String sql = "update guest set name=?, address=? where idx=?";
		System.out.println("SQL : " + sql);
		
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getName());
				pstmt.setString(2, dto.getAddress());
				pstmt.setInt(3, dto.getIdx());
				row = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally { close(); }
		
		return row;
	}
	
	// 회원 정보 수정(비밀번호, 카드 번호, 카드 비밀번호)
	public int changePw(GuestDTO dto) {
		int row = 0;
		String sql = "update guest set ";
		if(dto.getPw() != null) {
			sql += "pw=?, ";
		} 
		if(dto.getCard() != null) {
			sql += "card=?, ";
		} 
		if(dto.getCardpw() != null) {
			sql += "cardpw=? ";
		}
		sql += "where idx=?";
		System.out.println("SQL : " + sql);
		System.out.println(dto.getPw() + ", " + dto.getCard() + ", " + dto.getCardpw() + ", " + dto.getIdx());
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getCard());
			pstmt.setString(3, dto.getCardpw());
			pstmt.setInt(4, dto.getIdx());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("changePw : " + e);
		} finally { close(); }
		
		return row;
	}
	
	// 회원 탈퇴
	public int drop(int idx, String pw) {
		int row = 0;
		String sql = "delete from guest where idx=? and pw=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setString(2, pw);
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("drop : " + e);
		} finally { close(); }
		
		return row;
	}

	// 마스터 회원탈퇴 (한번에 탈퇴)
	public int masterdrop(int idx) {
		int row = 0;
		String sql="delete from guest where idx=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("masterdrop : " + e);
		}finally {close();}
		return row;
	}
	
	// 전체 회원목록 출력
	public List<GuestDTO> guestList(){
		String sql = "select * from guest order by idx";
		
		ArrayList<GuestDTO> list = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<GuestDTO>();
			
			while(rs.next()) {
				GuestDTO dto = new GuestDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setAddress(rs.getString("address"));
				dto.setCard(rs.getString("card"));
				dto.setCardpw(rs.getString("cardpw"));
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("guestList : " + e);
			e.printStackTrace();
		}finally {close();}
		
		return list;
	}
}
