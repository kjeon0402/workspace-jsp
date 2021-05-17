package day25;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/life", "/iu" })
public class LifeCycleServlet extends HttpServlet {

	@Override
	public void init(ServletConfig config) throws ServletException {
		// 서블릿 컨테이너(=톰캣)에 서블릿 객체가 생성되어 있으면 실행하지 않고 바로 service()로 이동
		// 서블릿 컨테이너에 객체가 생성되어 있지 않다면, 서블릿을 생성하고, 초기작업을 수행한다
		System.out.println("init!!");
		super.init(config);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		// JSP에서 스크립틀릿이 수행하는 코드
		// request의 메서드에 상관없이 모든 코드를 수행한다
		// 필요에 따라 request 메서드를 구분하여 doGet 또는 doPost 등의 메서드를 호출할 수 있다
		System.out.println("service!!");
		super.service(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		// request의 메서드가 GET이면 service()에 의해서 호출되는 메서드
		System.out.println("doGet!!");
		
		// 서블릿에서 데이터를 만들거나, DB에서 받아와서, JSP에게 넘겨줄 수 있다
		req.setAttribute("now", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		myFunction(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		// request의 메서드가 POST이면 service()에 의해 호출되는 메서드
		System.out.println("doPost!!");
		myFunction(req, resp);
	}
	
	private void myFunction(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		System.out.println("내가 만든 메서드");
		req.getRequestDispatcher("/WEB-INF/views/ex03.jsp").forward(req, resp);
	}
	
	@Override
	public void destroy() {
		// 서블릿 객체가 소면하기 전에 마무리 작업을 수행하는 메서드
		System.out.println("destroy!!");
		super.destroy();
	}
}
