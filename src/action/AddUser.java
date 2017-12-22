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
 * Servlet implementation class AddUser
 */
@WebServlet("/adduser")
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUser() {
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
			out.println("<script>alert('添加成功'); window.location='vip.jsp';</script>");
		} else {
			out.println("<script>alert('添加失败'); window.location='vip.jsp'; </script>");
		}

		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
