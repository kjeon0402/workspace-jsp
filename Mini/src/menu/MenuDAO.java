package menu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MenuDAO {
	
	private Connection conn;				//위에 3개는 기본적으로 사용하는것
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource ds;					// 및에 2개는 DB 연결할 때 필요한것
	private Context init;
	
	private static final MenuDAO instance = new MenuDAO();	// 싱글톤 사용할 때 필요한 문구
	
	public static MenuDAO getInstance() {		// 싱글톤 - 불러올 때 한번만 불러오면 더 이상 불러올 필요가 없는 것
		return instance;
	}
	
	private MenuDAO() {					// DB연결문구
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e) {
			System.out.println("생성자 예외 발생 : " + e );
		}
	}
	
	private void close() {				// 쓰고나서 닫는 것을 편하게 close만 쓰게 만든 것 
		try {
				if(rs != null)		{	rs.close();		rs = null;		}
				if(pstmt != null) 	{	pstmt.close();	pstmt = null;	}
				if(conn != null)	{	conn.close();	conn = null;	}
		}catch (SQLException e) {
			System.out.println("close : " + e);
		}
	}
	
	public List<MenuDTO> selectMenuToOrder(int cnt, String name) {
		String sql = "select * from (select " + 
				"    menu.*," + 
				"    menu.price * ? as total" + 
				"        from menu) A" + 
				"    where A.total != 0 and name=?";
		
		ArrayList<MenuDTO> list = new ArrayList<MenuDTO>();
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cnt);
			pstmt.setString(2, name);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MenuDTO dto = new MenuDTO();
				dto.setIDX(rs.getInt("IDX"));
				dto.setIMG(rs.getString("IMG"));
				dto.setKIND(rs.getString("KIND"));
				dto.setNAME(rs.getString("NAME"));
				dto.setPRICE(rs.getInt("PRICE"));
				dto.setTOTAL(rs.getInt("TOTAL"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally { close(); }
		return list;
	}
	
	// KIND가 햄버거인것만 불러오는 것 ( 햄버거 페이지)
	public ArrayList<MenuDTO> listHambuger(String kind){
		String sql = "select * from menu where KIND = ? ";
		System.out.println("SQL : " +sql);
		System.out.println("DTO.getKIND : " + kind);
		ArrayList<MenuDTO> list =null;
		
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,kind);
				rs = pstmt.executeQuery();
				list = new ArrayList<MenuDTO>();
				
				while(rs.next()) {
					MenuDTO dto = new MenuDTO();
					dto.setIDX(rs.getInt("idx"));
					dto.setNAME(rs.getString("name"));
					dto.setIMG(rs.getString("img"));
					dto.setPRICE(rs.getInt("price"));
					dto.setKIND(rs.getString("kind"));
					list.add(dto);			// dto를 리스트에 추가를 한다.
				}
			} catch (SQLException e) {
				System.out.println("listHambuger : " + e);
				e.printStackTrace();
			}finally {close();}
			System.out.println(list);

		
		return list;
	}
	
	// 하나만 뽑아오는 메서드
	public MenuDTO selectOne(String name) {
		MenuDTO dto = null;
		String sql = "select * from menu where name=?";
		System.out.println("SQL : " + sql);
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new MenuDTO();
				dto.setIDX(rs.getInt("IDX"));
				dto.setNAME(rs.getString("NAME"));
				dto.setIMG(rs.getString("IMG"));
				dto.setKIND(rs.getString("KIND"));
				dto.setPRICE(rs.getInt("PRICE"));
			}
		} catch (SQLException e) {
			System.out.println("selectOne : " + e);
		} finally { close(); }
		System.out.println(name);
		
		return dto;
	}
	
	
	// 전체를 출력하는 메서드
	public ArrayList<MenuDTO> allList(){
		String sql = "select * from menu order by KIND ";
		ArrayList<MenuDTO> list =null;
		
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				list = new ArrayList<MenuDTO>();
				
				while(rs.next()) {
					MenuDTO dto = new MenuDTO();
					dto.setIDX(rs.getInt("idx"));
					dto.setNAME(rs.getString("name"));
					dto.setIMG(rs.getString("img"));
					dto.setPRICE(rs.getInt("price"));
					dto.setKIND(rs.getString("kind"));
					list.add(dto);			// dto를 리스트에 추가를 한다.
				}
			} catch (SQLException e) {
				System.out.println("allList : " + e);
				e.printStackTrace();
			}finally {close();}
			System.out.println(list);

		
		return list;
	}
}