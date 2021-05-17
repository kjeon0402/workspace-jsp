package day25;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 자바 서블릿은 자바 클래스를 이용하여 만드는 웹 프로그램
// 자바의 상속 기능을 통해 서블릿의 모든 기능을 가져올 수 있다 HttpServlet

public class HelloServlet extends HttpServlet{

	// 데이터 직렬화에 필요한 구성 요소
	private static final long serialVersionUID = 1L;
	
	// 선언부(declaration)
	private int num;	// 멤버 필드의 초기값은 0에 해당하는 값
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		int num2 = 0;
		
		System.out.println("num : " + ++num);
		System.out.println("num2 : " + ++num2);
		
		PrintWriter out = response.getWriter();
		out.print("<h1>Hello, Servlet !!</h1>");
	}
}
