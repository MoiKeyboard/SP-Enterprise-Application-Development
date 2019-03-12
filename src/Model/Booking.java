package Model;

public class Booking {
	public Booking(int booking_id, int flight_schedule_id,
			String date_of_flight, String aircraft_flight_number, int adults,
			int children, int total, double totalcost, String name) {
		super();
		this.booking_id = booking_id;
		this.flight_schedule_id = flight_schedule_id;
		this.date_of_flight = date_of_flight;
		this.aircraft_flight_number = aircraft_flight_number;
		this.adults = adults;
		this.children = children;
		this.total = total;
		this.totalcost = totalcost;
		this.name = name;
	}
	private int booking_id;
	private int flight_schedule_id;
	private String date_of_flight;
	private String aircraft_flight_number;
	private int adults;
	private int children;
	private int total;
	private double totalcost;
	private String name;
	public int getBooking_id() {
		return booking_id;
	}
	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}
	public int getFlight_schedule_id() {
		return flight_schedule_id;
	}
	public void setFlight_schedule_id(int flight_schedule_id) {
		this.flight_schedule_id = flight_schedule_id;
	}
	public String getDate_of_flight() {
		return date_of_flight;
	}
	public void setDate_of_flight(String date_of_flight) {
		this.date_of_flight = date_of_flight;
	}
	public String getAircraft_flight_number() {
		return aircraft_flight_number;
	}
	public void setAircraft_flight_number(String aircraft_flight_number) {
		this.aircraft_flight_number = aircraft_flight_number;
	}
	public int getAdults() {
		return adults;
	}
	public void setAdults(int adults) {
		this.adults = adults;
	}
	public int getChildren() {
		return children;
	}
	public void setChildren(int children) {
		this.children = children;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public void setTotalcost(double totalcost) {
		this.totalcost = totalcost;
	}
	public double getTotalcost() {
		return totalcost;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
