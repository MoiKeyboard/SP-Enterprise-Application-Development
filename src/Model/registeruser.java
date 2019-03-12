package Model;

public class registeruser {
	private String username;
	private String gender;
	private String dateofbirth;
	private String email;
	private String password;
	private int rowsAffected;
	public registeruser(String username, String gender, String dateofbirth,
			String email, String password, int rowsAffected) {
		super();
		this.username = username;
		this.gender = gender;
		this.dateofbirth = dateofbirth;
		this.email = email;
		this.password = password;
		this.rowsAffected = rowsAffected;
	}
	public int getRowsAffected() {
		return rowsAffected;
	}
	public void setRowsAffected(int rowsAffected) {
		this.rowsAffected = rowsAffected;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDateofbirth() {
		return dateofbirth;
	}
	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
