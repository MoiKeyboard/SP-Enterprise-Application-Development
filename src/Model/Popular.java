package Model;

public class Popular {
	public Popular(int count, String country) {
		super();
		this.count = count;
		this.country = country;
	}
	private int count;
	private String country;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
}
