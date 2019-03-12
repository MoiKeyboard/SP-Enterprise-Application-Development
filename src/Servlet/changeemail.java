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
 * Servlet implementation class changeemail
 */
@WebServlet("/changeemail")
public class changeemail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changeemail() {
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
		String email = request.getParameter("email");
		System.out.println(oldname);
		System.out.println(email);
		username c = changenameDB.editemail(oldname, email);
		if (c.getRowsAffected() == 0) {
			System.out.println("Database not affected!");
		} else {
			System.out.println("Database affected!"+c.getRowsAffected()+" row(s) affected.");
		}
		response.sendRedirect("index.jsp");
	}

}
