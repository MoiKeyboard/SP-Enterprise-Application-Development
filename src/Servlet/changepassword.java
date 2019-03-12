package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.changenameDB;
import Model.username;

/**
 * Servlet implementation class changepassword
 */
@WebServlet("/changepassword")
public class changepassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changepassword() {
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
		String oldname = request.getParameter("loginStatus");
		String password = request.getParameter("password");
		username a = changenameDB.editpassword(oldname, password);
		if (a.getRowsAffected() == 0) {
			System.out.println("Database not affected!");
		} else {
			System.out.println("Database affected!"+a.getRowsAffected()+" row(s) affected.");
		}
		response.sendRedirect("index.jsp");
	}

}
