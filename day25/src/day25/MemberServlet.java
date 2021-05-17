package day25;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberDAO;
import model.MemberDTO;

@WebServlet("/member")
public class MemberServlet extends HttpServlet{
	
	private MemberDAO dao = MemberDAO.getInstance();
	private final String prefix = "/WEB-INF/views/";
	private final String suffix = ".jsp";
	// request.getRequestDispatcher(prefix + "memberList" + suffix);
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// member 테이블에서 모든 멤버의 목록을 받아와서 memberList.jsp에게 데이터를 넘겨주고 forward
		// memberList.jsp는 id와 pw를 입력할 수 있는 간단한 폼을 제공(method="POST")
		
		List<MemberDTO> list = dao.selectList();
		request.setAttribute("list", list);	// request 안에 list를 담아둔다
		
		String viewName = "memberList";
		viewName = prefix + viewName + suffix;
		request.getRequestDispatcher(viewName).forward(request, response);
		// redirect : 클라이언트가 지정한 주소로 이동하게 만드는 응답(301, 302)
		// forward : request를 유지한 상태로, 서버가 보유하고 있는 다른 JSP의 응답을 만들어서 클라이언트에게 전송
		// request에 넣어둔 list도 JSP에서 그대로 참조할 수 있다
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// 전달 받은 파라미터를 이용하여 DB에서 일치하는 데이터를 찾고 
		// 로그인 성공/실패 여부를 memberLogin.jsp에게 전달하여
		// javascript를 이용하여 팝업으로 성공/실패 여부를 화면에 출력
		// memberLoign.jsp에서는 /member 주소로 새로운 요청을 발생시킨다(location.href='';)

		// <jsp:useBean><jsp:setProperty>로 쉽게 파라미터를 객체 형식으로 받지만
		// 여기서는 직접 개체를 생성해서 파라미터를 세팅하고 DAO에게 전달해야 한다
		// Spring Framework에서는 useBean을 사용하지 않아도 파라미터를 객체나 컬렉션으로 받을 수 있다
		
		request.setCharacterEncoding("UTF-8");			// EncodingFilter
		
		MemberDTO input = new MemberDTO();				// Command Object
		input.setId(request.getParameter("id"));
		input.setPw(request.getParameter("pw"));
		
		MemberDTO login = dao.login(input);
		HttpSession session = request.getSession();		// Parameter HttpSession
		session.setAttribute("login", login);
		
		String viewName = "memberLogin";				
		viewName = prefix + viewName + suffix;			// viewResolver
		request.getRequestDispatcher(viewName).forward(request, response);	// return
	}
}
