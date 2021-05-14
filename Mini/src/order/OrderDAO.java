package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OrderDAO {

	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Context init;
	private static final OrderDAO instance = new OrderDAO();
	
	public static OrderDAO getInstance() {
		return instance;
	}
	
	private OrderDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			System.out.println("생상자 예외 발생 : " + e);
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
	
	// 주문 요청 했을 때
	public int orderMenu(OrderDTO dto) {
		int row = 0;
		String sql = "insert into ordertable"
				+ " (idx, product, cnt, orderer, address, price, total) "
				+ "values(ordertable_seq.nextval, ?, ?, ?, ?, ?, ?)";
		System.out.println("SQL : " + sql);
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getProduct());
			pstmt.setInt(2, dto.getCnt());
			pstmt.setString(3, dto.getOrderer());
			pstmt.setString(4, dto.getAddress());
			pstmt.setInt(5, dto.getPrice());
			pstmt.setInt(6, dto.getPrice() * dto.getCnt());
			row = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("orderMenu : " + e);
		} finally { close(); }
		System.out.println(dto.getProduct() + ", " + dto.getCnt() + ", " + dto.getOrderer() + ", " + dto.getAddress() + ", " + dto.getPrice());
		return row;
	}
	
	// 주문 내역 리스트
	public ArrayList<OrderDTO> listOrder(String orderer) {
		ArrayList<OrderDTO> list = null;
		String sql = "select * from ordertable where orderer=?"
				+ " order by idx desc";
		System.out.println("SQL : " + sql);
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderer);
			rs = pstmt.executeQuery();
			list = new ArrayList<OrderDTO>();
			
			while(rs.next()) {
				OrderDTO dto = new OrderDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setProduct(rs.getString("product"));
				dto.setCnt(rs.getInt("cnt"));
				dto.setOrderer(rs.getString("orderer"));
				dto.setAddress(rs.getString("address"));
				dto.setOrdertime(rs.getString("ordertime"));
				dto.setPaycheck(rs.getString("paycheck"));
				dto.setPrice(rs.getInt("price"));
				dto.setTotal(rs.getInt("total"));
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("listOrder : " + e);
		}
		System.out.println(orderer);
		return list;
	}
	
	// paycheck가 n인 주문의  idx를 불러와서 쿼리스트링 형식의 문자열로 반환하는 메서드
	public String notpayedIdx() {
		String data = "?";
		String sql = "select idx from ordertable where paycheck='n'";
		ArrayList<Integer> list = new ArrayList<Integer>();
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getInt("idx"));
			}
			for(int i = 0; i < list.size(); i++) {
				data += "idx=" + list.get(i) + (list.size() - 1 == i ? "" : "&");
			}
			System.out.println("data : [" + data + "]");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}
	
	// 장바구니(paycheck가 n인 것) 리스트
	public ArrayList<OrderDTO> shoppingBasket(String orderer) {
		ArrayList<OrderDTO> list = null;
		String sql = "select * from ordertable"
				+ " where paycheck='n' and orderer=?"
				+ " order by idx desc";
		System.out.println("SQL : " + sql);
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderer);
			rs = pstmt.executeQuery();
			list = new ArrayList<OrderDTO>();
			
			while(rs.next()) {
				OrderDTO dto = new OrderDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setProduct(rs.getString("product"));
				dto.setCnt(rs.getInt("cnt"));
				dto.setOrderer(rs.getString("orderer"));
				dto.setAddress(rs.getString("address"));
				dto.setOrdertime(rs.getString("ordertime"));
				dto.setPaycheck(rs.getString("paycheck"));
				dto.setPrice(rs.getInt("price"));
				dto.setTotal(rs.getInt("total"));
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("listOrder : " + e);
		}
		System.out.println(orderer);
		return list;
	}
	// 결제를 누르면
	public int payYes(String orderer) {
		int row = 0;
		String sql = "update ordertable set paycheck='y' where orderer=?";
		System.out.println("SQL : " + sql);
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderer);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("payYes : " + e);
		}
		System.out.println(orderer);
		return row;
	}
	
	// 주문 삭제
	public int deleteOrder(int idx) {
		int row = 0;
		String sql = "delete from ordertable where idx=?";
		System.out.println("SQL : " + sql);
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("deleteOrder : " + e);
		}

		return row;
	}
}
