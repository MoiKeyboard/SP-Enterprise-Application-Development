package Model;

public class SearchSchedule {
	public SearchSchedule(int fId, String aircraft_flight_name,
			String date_of_flight,
			String departure_time, String origin_airport,
			String destination_airport, String via) {
		super();
		this.fId = fId;
		this.aircraft_flight_name = aircraft_flight_name;
		this.date_of_flight = date_of_flight;
		this.departure_time = departure_time;
		this.origin_airport = origin_airport;
		this.destination_airport = destination_airport;
		this.via = via;
	}
	private int fId;
	private String aircraft_flight_name;
	private String date_of_flight;
	private String date_of_return;
	private String departure_time;
	private String origin_airport;
	private String destination_airport;
	private String via;
	public int getfId() {
		return fId;
	}
	public void setfId(int fId) {
		this.fId = fId;
	}
	public String getAircraft_flight_name() {
		return aircraft_flight_name;
	}
	public void setAircraft_flight_name(String aircraft_flight_name) {
		this.aircraft_flight_name = aircraft_flight_name;
	}
	public String getDate_of_flight() {
		return date_of_flight;
	}
	public void setDate_of_flight(String date_of_flight) {
		this.date_of_flight = date_of_flight;
	}
	public String getDeparture_time() {
		return departure_time;
	}
	public void setDeparture_time(String departure_time) {
		this.departure_time = departure_time;
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
	public String getVia() {
		return via;
	}
	public void setVia(String via) {
		this.via = via;
	}
}
