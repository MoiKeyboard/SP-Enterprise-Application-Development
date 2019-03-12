package Model;

public class rowsBooking {
	private int Flight_schedule_id;
	private String Date_of_flight;
	private String Aircraft_flight_number;
	private int Adults;
	private int Children;
	private int Total;
	private double Totalcost;
	private int rowsAffected;
	public rowsBooking(int flight_schedule_id, String date_of_flight,
			String aircraft_flight_number, int adults, int children, int total,
			double totalcost, int rowsAffected) {
		super();
		Flight_schedule_id = flight_schedule_id;
		Date_of_flight = date_of_flight;
		Aircraft_flight_number = aircraft_flight_number;
		Adults = adults;
		Children = children;
		Total = total;
		Totalcost = totalcost;
		this.rowsAffected = rowsAffected;
	}
	public double getTotalcost() {
		return Totalcost;
	}
	public void setTotalcost(double totalcost) {
		Totalcost = totalcost;
	}
	public int getFlight_schedule_id() {
		return Flight_schedule_id;
	}
	public void setFlight_schedule_id(int flight_schedule_id) {
		Flight_schedule_id = flight_schedule_id;
	}
	public String getDate_of_flight() {
		return Date_of_flight;
	}
	public void setDate_of_flight(String date_of_flight) {
		Date_of_flight = date_of_flight;
	}
	public String getAircraft_flight_number() {
		return Aircraft_flight_number;
	}
	public void setAircraft_flight_number(String aircraft_flight_number) {
		Aircraft_flight_number = aircraft_flight_number;
	}
	public int getAdults() {
		return Adults;
	}
	public void setAdults(int adults) {
		Adults = adults;
	}
	public int getChildren() {
		return Children;
	}
	public void setChildren(int children) {
		Children = children;
	}
	public int getTotal() {
		return Total;
	}
	public void setTotal(int total) {
		Total = total;
	}
	public int getRowsAffected() {
		return rowsAffected;
	}
	public void setRowsAffected(int rowsAffected) {
		this.rowsAffected = rowsAffected;
	}
	
}
