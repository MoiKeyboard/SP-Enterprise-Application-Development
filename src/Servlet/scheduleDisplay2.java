package Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ScheduleDisplayDB;
import Model.SearchSchedule;

/**
 * Servlet implementation class scheduleDisplay2
 */
@WebServlet("/scheduleDisplay2")
public class scheduleDisplay2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public scheduleDisplay2() {
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
			int adults = Integer.parseInt(request.getParameter("adults"));
			int children = Integer.parseInt(request.getParameter("children"));
			int total = adults + children;
			String flight_class= request.getParameter("flight_class");
			String flightType=request.getParameter("flightType");
			String from=request.getParameter("origin_airport");
			String to=request.getParameter("destination_airport");
			String depart=request.getParameter("date_of_flight");
			String dreturn=request.getParameter("date_of_return");
			if(total>0){
			ArrayList<SearchSchedule> al = ScheduleDisplayDB.search(adults,children,total,flight_class,flightType,from,to,depart,dreturn);
			ArrayList<SearchSchedule> al2 = ScheduleDisplayDB.searchReturn(adults,children,total,flight_class,flightType,from,to,depart,dreturn);
			request.setAttribute("searchTo", al);
			request.setAttribute("searchReturn", al2);
			RequestDispatcher rd = request.getRequestDispatcher("scheduleDisplay2.jsp");
			rd.forward(request, response);
			}else{
				response.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
