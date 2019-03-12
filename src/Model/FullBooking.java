package Model;

public class FullBooking {
	public FullBooking(String origin_airport, String destination_airport,
			String aircraft_flight_number, String departure_time,
			String arrival_time, String date_of_flight, String flight_time,
			double economy_cost, double business_class_cost,
			double first_class_cost, double child_economy_cost,
			double child_business_class_cost, double child_first_class_cost,
			int adults, int children, int total, String flight_class,
			double totalcost, int flight_schedule_id) {
		super();
		this.origin_airport = origin_airport;
		this.destination_airport = destination_airport;
		this.aircraft_flight_number = aircraft_flight_number;
		this.departure_time = departure_time;
		this.arrival_time = arrival_time;
		this.date_of_flight = date_of_flight;
		this.flight_time = flight_time;
		this.economy_cost = economy_cost;
		this.business_class_cost = business_class_cost;
		this.first_class_cost = first_class_cost;
		this.child_economy_cost = child_economy_cost;
		this.child_business_class_cost = child_business_class_cost;
		this.child_first_class_cost = child_first_class_cost;
		this.adults = adults;
		this.children = children;
		this.total = total;
		this.flight_class = flight_class;
		this.totalcost = totalcost;
		this.flight_schedule_id = flight_schedule_id;
	}

	private String origin_airport;
	private String destination_airport;
	private String aircraft_flight_number;
	private String departure_time;
	private String arrival_time;
	private String date_of_flight;
	private String flight_time;
	private double economy_cost;
	private double business_class_cost;
	private double first_class_cost;
	private double child_economy_cost;
	private double child_business_class_cost;
	private double child_first_class_cost;
	private int adults;
	private int children;
	private int total;
	private String flight_class;
	private double totalcost;
	private int flight_schedule_id;
	public FullBooking(){
		
	}

	public String getOrigin_airport() {
		return origin_airport;
	}
	public void setOrigin_airport(String origin_airport) {
		this.origin_airport = origin_airport;
	}
	public String getDestination_airport() {
		return destination_airport;
	}
	public void setDestination_airport(String destination_airport) {
		this.destination_airport = destination_airport;
	}
	public String getAircraft_flight_number() {
		return aircraft_flight_number;
	}
	public void setAircraft_flight_number(String aircraft_flight_number) {
		this.aircraft_flight_number = aircraft_flight_number;
	}
	public String getDeparture_time() {
		return departure_time;
	}
	public void setDeparture_time(String departure_time) {
		this.departure_time = departure_time;
	}
	public String getArrival_time() {
		return arrival_time;
	}
	public void setArrival_time(String arrival_time) {
		this.arrival_time = arrival_time;
	}
	public String getDate_of_flight() {
		return date_of_flight;
	}
	public void setDate_of_flight(String date_of_flight) {
		this.date_of_flight = date_of_flight;
	}
	public String getFlight_time() {
		return flight_time;
	}
	public void setFlight_time(String flight_time) {
		this.flight_time = flight_time;
	}
	public double geteconomy_cost() {
		return economy_cost;
	}
	public void seteconomy_cost(double economy_cost) {
		this.economy_cost = economy_cost;
	}
	public double getbusiness_class_cost() {
		return business_class_cost;
	}
	public void setbusiness_class_cost(double business_class_cost) {
		this.business_class_cost = business_class_cost;
	}
	public double getfirst_class_cost() {
		return first_class_cost;
	}
	public void setfirst_class_cost(double first_class_cost) {
		this.first_class_cost = first_class_cost;
	}
	public double getchild_economy_cost() {
		return child_economy_cost;
	}
	public void setchild_economy_cost(double child_economy_cost) {
		this.child_economy_cost = child_economy_cost;
	}
	public double getchild_business_class_cost() {
		return child_business_class_cost;
	}
	public void setchild_business_class_cost(double child_business_class_cost) {
		this.child_business_class_cost = child_business_class_cost;
	}
	public double getchild_first_class_cost() {
		return child_first_class_cost;
	}
	public void setchild_first_class_cost(double child_first_class_cost) {
		this.child_first_class_cost = child_first_class_cost;
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
	public String getFlight_class() {
		return flight_class;
	}
	public void setFlight_class(String flight_class) {
		this.flight_class = flight_class;
	}
	public double getTotalcost() {
		return totalcost;
	}

	public void setTotalcost(double totalcost) {
		this.totalcost = totalcost;
	}

	public int getFlight_schedule_id() {
		return flight_schedule_id;
	}

	public void setFlight_schedule_id(int flight_schedule_id) {
		this.flight_schedule_id = flight_schedule_id;
	}
}
