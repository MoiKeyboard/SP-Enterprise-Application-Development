package Model;

public class seatremaining {
	private int total;
	private int flight_schedule_id;
	private int rowsAffected;
	private String flight_class;
	public seatremaining(String flight_class, int total, int flight_schedule_id, int rowsAffected) {
		super();
		this.total = total;
		this.flight_schedule_id = flight_schedule_id;
		this.rowsAffected = rowsAffected;
		this.flight_class = flight_class;
	}
	public int getTotal() {
		return total;
	}
	public String getFlight_class() {
		return flight_class;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getFlight_schedule_id() {
		return flight_schedule_id;
	}
	public void setFlight_schedule_id(int flight_schedule_id) {
		this.flight_schedule_id = flight_schedule_id;
	}
	public int getRowsAffected() {
		return rowsAffected;
	}
	public void setRowsAffected(int rowsAffected) {
		this.rowsAffected = rowsAffected;
	}
	public void setFlight_Class(String flight_class) {
		this.flight_class = flight_class;
	}
}
