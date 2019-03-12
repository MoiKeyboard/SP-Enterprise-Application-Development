package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import Model.*;

/**
 * Servlet implementation class userregister
 */
@WebServlet("/userregister")
public class userregister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userregister() {
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
		try {
		PrintWriter out = response.getWriter();
		String username = request.getParameter("name");
		String gender = request.getParameter("gender");
		String dateofbirth = request.getParameter("dateofbrith");
		String email = request.getParameter("email");
		String password1 = request.getParameter("password");
		String password = new String(Base64.encode(password1.getBytes()));
		//create crypt to store into db
		registeruser b = registerDB.registeruserDB(username, gender, dateofbirth, email, password);
		if (b.getRowsAffected() == 0) {
			System.out.println("Database not affected!");
			
		} else {
			System.out.println("Database affected!"+b.getRowsAffected()+" row(s) affected.");
		}
		response.sendRedirect("index.jsp");
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
