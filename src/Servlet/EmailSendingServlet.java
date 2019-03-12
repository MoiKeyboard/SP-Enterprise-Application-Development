package Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletContext;
import Model.*;
/**
 * A servlet that takes message details from user and send it as a new e-mail
 * through an SMTP server.
 * 
 * @author www.codejava.net
 * 
 */
@WebServlet("/EmailSendingServlet")
public class EmailSendingServlet extends HttpServlet {
	private String host;
	private String port;
	private String user;
	private String pass;

	public void init() {
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host = context.getInitParameter("host");
		port = context.getInitParameter("port");
		user = context.getInitParameter("user");
		pass = context.getInitParameter("pass");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// reads form fields
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		

		String resultMessage = "";

		try {
			forgotpassword b = forgotpassworddb.createforgotpassword(name, email);
			if(b.getPassword() == null){
				 response.sendRedirect("index.jsp");
			}
			EmailUtility.sendEmail(host, port, user, pass, b.getPassword(), b.getRecipient());
			resultMessage = "The e-mail was sent successfully";
		} catch (Exception ex) {
			ex.printStackTrace();
			resultMessage = "Incorrect username or email";
		} finally {
			request.setAttribute("Message", resultMessage);
			getServletContext().getRequestDispatcher("/result.jsp").forward(
					request, response);
		}
	}
}