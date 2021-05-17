package day25;

// <%@ page import="java.text.SimpleDateFormat" %>
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// 1) HttpServlet 클래스를 상속 받는다
// 2) 오버라이딩 할 메서드를 작성한다 (doGet, doPost)
// 3) 자바코드를 작성하고 화면에 보낼 응답을 HTML 태크 형식의 문자열로 response에 넣어준다

public class NowServlet extends HttpServlet {

	// declaration	<%! %>
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초");

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// http method에 상관없이 수행되는 코드
		// scriptlet <% %>
		
		Date date = new Date();
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=\"UTF-8\""); 
		
		PrintWriter out = response.getWriter();
		String now = sdf.format(date);
		
		String html = "<!DOCTYPE html>\n"
				+ "<html lang=\"ko\">\n"
				+ "<head>\n"
				+ "<meta charset=\"UTF-8\">\n"
				+ "<title>NowServlet</title>\n"
				+ "</head>\n"
				+ "<body>\n"
				+ "<h1>ex02 - NowServlet</h1>\n"
				+ "<hr>\n"
				+ "<h2>" + now + "</h2>\n"
				+ "</body>\n"
				+ "</html>\n";
		out.print(html);
		
		// 다른 내장 객체
		HttpSession session = request.getSession();
		ServletContext applicaiton = request.getServletContext();
	}
}
