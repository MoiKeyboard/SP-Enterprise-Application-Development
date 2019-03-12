package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import java.sql.*;

import Connection.*;

/**
 * Servlet implementation class Authenticate
 */
@WebServlet("/Authenticate")
public class Authenticate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Authenticate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		try {
			String id = request.getParameter("username");
			String pwd1 = request.getParameter("password");
			String pwd = new String(Base64.encode(pwd1.getBytes()));
			//create crypt to match db hash
			if (ValidateLogin.validate(id,pwd)) {
				session.setAttribute("User", id);
				response.sendRedirect("admin.jsp");
			}else if(ValidateLogin.uservalidate(id,pwd)){	
				session.setAttribute("User1", id);
				response.sendRedirect("index.jsp");
			} else {
				response.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			out.println(e);
		}
	}


}
