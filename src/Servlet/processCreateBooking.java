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

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import Model.*;

/**
 * Servlet implementation class processCreateBooking
 */
@WebServlet("/processCreateBooking")
public class processCreateBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public processCreateBooking() {
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
//			HttpSession session=request.getSession();
//			PrintWriter out=response.getWriter();
//			ArrayList<FullBooking> al=(ArrayList<FullBooking>)session.getAttribute("cart");
//			FullBooking b=al.get(1);
//			String [] fIdS = request.getParameterValues("fId");
//			int [] fId = new int [fIdS.length];
//			for (int i=0; i< fIdS.length; i++) {
//				out.println("fId data contains: " + fIdS[i]);
//				fId[i] = Integer.parseInt(fIdS[i]);
//			}
//			String [] adulttitle=request.getParameterValues("adulttitle");
//			String [] adultid=request.getParameterValues("adultid");
//			String [] adultdateofbirth=request.getParameterValues("adultdateofbirth");
//			String [] adultpass=request.getParameterValues("adultpass");
//			String [] childtitle=request.getParameterValues("childtitle");
//			String [] childid=request.getParameterValues("childid");
//			String [] childdateofbirth=request.getParameterValues("childdateofbirth");
//			String [] childpass=request.getParameterValues("childpass");
//			String email=request.getParameter("email");
//			String handphone=request.getParameter("handphone");
//			String cardtype=request.getParameter("cardtype");
//			String cardnumber=request.getParameter("cardnumber");
//			String cardexpiry=request.getParameter("cardexpiry");
//			String cardCV2=request.getParameter("cardCV2");
//			
//				if(b.getAdults() != 0){
//					for(int i=0;i<adultid.length;i++){
//						out.println(adulttitle[i]+" "+adultid[i]+" "+adultdateofbirth[i]+" "+adultpass[i]);
//					}
//				}
//				if(b.getChildren() != 0){
//					for(int a=0;a<childid.length;a++){
//						out.println(childtitle[a]+" "+childid[a]+" "+childdateofbirth[a]+" "+childpass[a]);
//					}
//				}
//				
//					out.println(email+" "+handphone+" "+cardtype+" "+cardnumber+" "+cardexpiry+" "+cardCV2);
//				
		try{
			HttpSession session=request.getSession();
			PrintWriter out=response.getWriter();
			String oldname = request.getParameter("loginStatus");
			ArrayList<FullBooking> al=(ArrayList<FullBooking>)session.getAttribute("cart");
			for(FullBooking b:al){
				//out.println(b.getFlight_schedule_id()+" "+b.getDate_of_flight()+" "+b.getAircraft_flight_number()+" "+b.getAdults()+" "+b.getChildren()+" "+b.getTotal());
				rowsBooking z = CreateBookingDb.createBooking(b.getFlight_schedule_id(), b.getDate_of_flight(), b.getAircraft_flight_number(), b.getAdults(), b.getChildren(), b.getTotal(), b.getTotalcost(), oldname);
				if (z.getRowsAffected() == 0) {
					System.out.println("Database not affected!");
					
				} else {
					System.out.println("Database affected!"+z.getRowsAffected()+" row(s) affected.");
				}
			}
			FullBooking b=al.get(0);
			String [] adulttitle=request.getParameterValues("adulttitle");
			String [] adultid=request.getParameterValues("adultid");
			String [] adultdateofbirth=request.getParameterValues("adultdateofbirth");
			String [] adultpass=request.getParameterValues("adultpass");
			String [] childtitle=request.getParameterValues("childtitle");
			String [] childid=request.getParameterValues("childid");
			String [] childdateofbirth=request.getParameterValues("childdateofbirth");
			String [] childpass=request.getParameterValues("childpass");
			String email=request.getParameter("email");
			String handphone=request.getParameter("handphone");
			String cardtype=request.getParameter("cardtype");
			String cardnumber1=request.getParameter("cardnumber");
			String cardexpiry1=request.getParameter("cardexpiry");
			String cardCV21=request.getParameter("cardCV2");
			String cardnumber = new String(Base64.encode(cardnumber1.getBytes()));
			String cardexpiry = new String(Base64.encode(cardexpiry1.getBytes()));
			String cardCV2 = new String(Base64.encode(cardCV21.getBytes()));
			
			 int Arraysize=al.size();
			 ArrayList <retrievebooking_id> c = CreateCustomerDB.createCustomer(Arraysize);
			 for(retrievebooking_id z:c){
				 if(b.getAdults() != 0){
						for(int i=0;i<adultid.length;i++){
//							out.println(z.getBooking_id());
//							out.println(adulttitle[i]+" "+adultid[i]+" "+adultdateofbirth[i]+" "+adultpass[i]);
//							out.println(email+" "+handphone+" "+cardtype+" "+cardnumber+" "+cardexpiry+" "+cardCV2);
							details v = CreateCustomerDB.createCustomerDetails(z.getBooking_id(), adulttitle[i], adultid[i], adultdateofbirth[i], adultpass[i], email, handphone, cardtype, cardnumber, cardexpiry, cardCV2);
							if (v.getRowsAffected() == 0) {
								System.out.println("Database not affected!");
								
							} else {
								System.out.println("Database affected!"+v.getRowsAffected()+" row(s) affected.");
								
							}
						}
					}
					if(b.getChildren() != 0){
						for(int a=0;a<childid.length;a++){
//							out.println(z.getBooking_id());
//							out.println(childtitle[a]+" "+childid[a]+" "+childdateofbirth[a]+" "+childpass[a]);
//							out.println(email+" "+handphone+" "+cardtype+" "+cardnumber+" "+cardexpiry+" "+cardCV2);
							details v = CreateCustomerDB.createCustomerDetails(z.getBooking_id(), childtitle[a], childid[a], childdateofbirth[a], childpass[a], email, handphone, cardtype, cardnumber, cardexpiry, cardCV2);
							if (v.getRowsAffected() == 0) {
								System.out.println("Database not affected!");
							
							} else {
								System.out.println("Database affected!"+v.getRowsAffected()+" row(s) affected.");
								
							}
						}
					}
					
			 }
			 for(FullBooking q:al){
				 seatremaining s = seatremainingDB.minusseats(q.getFlight_class(),q.getTotal(), q.getFlight_schedule_id());
				 if (s.getRowsAffected() == 0) {
					 System.out.println("Database not affected!");
				 } else {
					 System.out.println("Database affected!"+s.getRowsAffected()+" row(s) affected.");
				 }
			 }
			 session.removeAttribute("cart");
			 response.sendRedirect("index.jsp");
				
		} catch (Exception e) {
				System.out.println(e);
		}
		
		
		
		
		
		
	}

}
