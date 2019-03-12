package Model;

public class forgotpassword {
	private String password;
	private String recipient;
	public forgotpassword(String password, String recipient) {
		super();
		this.password = password;
		this.recipient = recipient;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}	
}
