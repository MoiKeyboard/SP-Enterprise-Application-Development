package Servlet;

import java.io.IOException;
import java.sql.*;

import Connection.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Booking;
import Model.BookingDB;

/**
 * Servlet implementation class processUpdateBooking
 */
@WebServlet("/processUpdateBooking")
public class processUpdateBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public processUpdateBooking() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			int bId=Integer.parseInt(request.getParameter("bId"));
			int no_of_adult=Integer.parseInt(request.getParameter("no_of_adult"));
			int no_of_children=Integer.parseInt(request.getParameter("no_of_children"));
			int total = no_of_children + no_of_adult;
			int fId = Integer.parseInt(request.getParameter("flight_schedule_id"));
			BookingDB.commitBooking(bId,no_of_adult,no_of_children,total,fId);
			response.sendRedirect("booking?query=");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
