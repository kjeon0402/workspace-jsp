package day16_quiz;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {

	private Connection conn;
	private Context init;
	private DataSource ds;
	private static MemberDAO instance;
	
	public static MemberDAO getInstance() {
		if(instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}
	
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MemberDAO() {
		try {
			init = (Context) new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.out.println("생성자 예외 발생 : " + e);
		} finally {
			if(conn != null) try { conn.close(); } catch (Exception e) {}
		}
	}
	
	// 회원 전체 목록
	public ArrayList<MemberDTO> listMember() {
		String sql = "select * from member order by idx";
		ArrayList<MemberDTO> list = null;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<MemberDTO>();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setUserid(rs.getString("userid"));
				dto.setUserpw(rs.getString("userpw"));
				dto.setUsername(rs.getString("username"));
				dto.setAge(rs.getInt("age"));
				dto.setGender(rs.getString("gender"));
				dto.setRegistDate(rs.getDate("registDate"));
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("listMember : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		return list;
	}
	
	// 회원 가입
	public int joinMember(MemberDTO inputData, String date) {
		int row = 0;
		String sql = "insert into member values(member_seq.nextval, ?, ?, ?, ?, ?, ?)";
		System.out.println("SQL : " + sql);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date registDate = null;
		try {
			registDate = sdf.parse(date);
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputData.getUserid());
			pstmt.setString(2, inputData.getUserpw());
			pstmt.setString(3, inputData.getUsername());
			pstmt.setInt(4, inputData.getAge());
			pstmt.setString(5, inputData.getGender());
			pstmt.setString(6, new SimpleDateFormat("yy/MM/dd").format(registDate));
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("joinMember : " + e);
		} catch (ParseException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		System.out.println(inputData.getUserid() + ", " + inputData.getUserpw() + ", " + 
				inputData.getUsername() + ", " + inputData.getAge() + ", " + 
				inputData.getGender() + ", " + new SimpleDateFormat("yy/MM/dd").format(registDate));
		return row;
	}
	
	// 로그인
	public MemberDTO loginMember(MemberDTO inputData) {
		MemberDTO login = null;
		String sql = "select * from member where userid=? and userpw=?";
		System.out.println("SQL : " + sql);
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputData.getUserid());
			pstmt.setString(2, inputData.getUserpw());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				login = new MemberDTO();
				login.setIdx(rs.getInt("idx"));
				login.setUserid(rs.getString("userid"));
				login.setUserpw(rs.getString("userpw"));
				login.setUsername(rs.getString("username"));
				login.setAge(rs.getInt("age"));
				login.setGender(rs.getString("gender"));
				login.setRegistDate(rs.getDate("registDate"));
				return login;
			}
		} catch (SQLException e) {
			System.out.println("loginMember : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		System.out.println(inputData.getUserid() + ", " + inputData.getUserpw());
		return login;
	}
	// 회원 정보 수정(비밀번호 외)
	public int updateMember(MemberDTO inputData) {
		int row = 0;
		String sql = "update member set username=?, age=?, gender=? where userid=?";
		System.out.println("SQL : " + sql);
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputData.getUsername());
			pstmt.setInt(2, inputData.getAge());
			pstmt.setString(3, inputData.getGender());
			pstmt.setString(4, inputData.getUserid());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("updateMember : " + e);
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
	public int dropMember(int idx) {
		int row = 0;
		String sql = "delete from member where idx=?";
		System.out.println("SQL : " + sql);
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("dropMember : " + e);
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {}
		}
		System.out.println(idx);
		return row;
	}
}
