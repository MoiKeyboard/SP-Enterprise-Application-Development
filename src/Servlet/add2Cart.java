package Servlet;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Booking;
import Model.BookingDB;
import Model.FullBooking;
import Model.add2CartDB;

/**
 * Servlet implementation class add2Cart
 */
@WebServlet("/add2Cart")
public class add2Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public add2Cart() {
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
		HttpSession session=request.getSession();
		try {
			ArrayList<String> bk = new ArrayList<String>();
			ArrayList <FullBooking> al = new ArrayList<FullBooking>();
			String bookingdepart = request.getParameter("bookingdepart");
			String bookingreturn = request.getParameter("bookingreturn");
			bk.add(bookingdepart);
			if(bookingreturn != null){
			bk.add(bookingreturn);
			}
			for (String fIdStr : bk) {
				int fId=Integer.parseInt(fIdStr);
				String flight_class= request.getParameter("flight_class");
				int adults = Integer.parseInt(request.getParameter("adults"));
				int children = Integer.parseInt(request.getParameter("children"));
				int total = adults + children;
				FullBooking b = add2CartDB.addBooking(fId, flight_class, adults, children, total);
				al.add(b);
			}
			
			session.setAttribute("cart", al);
		} catch (Exception e) {
			System.out.println(e);
		}
		//	ArrayList <FullBooking> al;
			//if (session.getAttribute("cart") == null) {
				//al = new ArrayList<FullBooking>();
			//}else {
				//al = (ArrayList<FullBooking>) session.getAttribute("cart");
			//}
		//	al.add(b);
			//session.setAttribute("cart", al);
			response.sendRedirect("index.jsp");
		
		
		
	//	al.add(b);
		//ArrayList <FullBooking> al = new ArrayList<FullBooking>();
		//al.add(b);
		//session.setAttribute("cart", al);
		//response.sendRedirect("index.jsp");

	}

}
