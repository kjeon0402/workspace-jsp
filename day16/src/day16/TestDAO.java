package day16;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

public class TestDAO {
	// xml : 속성 이름과 값을 태그언어 형식으로 표현하는 방식
	// <속성>값</속성>
	// <name>강지언</name>
	
	private Connection conn;
	private Context init;
	private DataSource ds;		// 여러 개의 Connection 객체를 보유하고 있는 객체
	
	public TestDAO() {
		try {
			init = (Context) new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			System.out.println("생성자 예외 발생 : " + e);
		} finally {
			if(conn != null) try { conn.close(); } catch (Exception e) {}
		}
	}
	
	public String test() {
		String sql = "select * from v$version";
		String result = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = ds.getConnection();			// DataSource에게 Connection을 하나 받아온다
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				result = rs.getString(1);
				System.out.println("result : " + result);
				return result;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			BasicDataSource bds = (BasicDataSource)ds;
			System.out.println("============================");
			System.out.println("활성화 연결 개수 : " + bds.getNumActive());
			System.out.println("최대 활성화 개수 : " + bds.getMaxTotal());
			System.out.println("유휴 연결 개수 : " + bds.getNumIdle());
			System.out.println("최대 유휴 개수 : " + bds.getMaxIdle());
			System.out.println("============================");
			
			try {
				if(rs != null)		rs.close();
				if(pstmt != null)	pstmt.close();
				if(conn != null) 	conn.close();
			} catch(Exception e) {}
		}
		return result;
	}
}
