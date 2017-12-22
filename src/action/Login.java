package action;

import db.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");//获取用户填写的密码
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		DBAccess db = new DBAccess();
		db.Open();
		ResultSet rs = db.ExecuteQuery(String.format("select rid from users where uname='%s' and upass='%s'", uname, upass));
		try {
			if(rs.next()) {
				
				int rid = rs.getInt(1);
				Cookie c = new Cookie("rid", rid+"");
				response.addCookie(c);
				Cookie c1 = new Cookie("uname", uname);
				response.addCookie(c1);
				if(rid==1) {
					out.print("登录成功，欢迎你管理员");
					response.addHeader("refresh", "1;url=admin.html");
				} else if(rid==2) {
					out.print("登录成功，欢迎你用户");
					response.addHeader("refresh", "1;url=index.html");
				}
			} else {
				out.print("<script>alert(\"用户名密码错误！\");</script>");
				response.addHeader("refresh", "1;url=login.html");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		db.Close();
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
