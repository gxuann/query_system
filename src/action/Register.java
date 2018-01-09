package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.UserManager;
import model.Users;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out  = response.getWriter();
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");
		int rid = 2;
		Users u = new Users();
		u.setUname(uname);
		u.setUpass(upass);
		u.setRid(rid);
		UserManager um = new UserManager();
		int i = um.AddUser(u);
		if(i>0) {
			out.println("<script>alert('¹§Ï²Äã£¬×¢²á³É¹¦£¡Çë·µ»ØµÇÂ¼£¡'); window.location='login.jsp';</script>");
		} else {
			out.println("<script>alert('±§Ç¸£¬Óöµ½Î´Öª´íÎó£¬ÇëÖØÐÂ×¢²á£¡'); window.location='register.jsp'; </script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
