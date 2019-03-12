package Model;

public class details {
	private int booking_id;
	private String title;
	private String id;
	private String dateofbirth;
	private String pass;
	private String email;
	private String handphone;
	private String cardtype;
	private String cardnumber;
	private String cardexpiry;
	private String cardCV2;
	private int rowsAffected;

	
	public details(){
		
	}


	public details(int booking_id, String title, String id, String dateofbirth,
			String pass, String email, String handphone, String cardtype,
			String cardnumber, String cardexpiry, String cardCV2,
			int rowsAffected) {
		super();
		this.booking_id = booking_id;
		this.title = title;
		this.id = id;
		this.dateofbirth = dateofbirth;
		this.pass = pass;
		this.email = email;
		this.handphone = handphone;
		this.cardtype = cardtype;
		this.cardnumber = cardnumber;
		this.cardexpiry = cardexpiry;
		this.cardCV2 = cardCV2;
		this.rowsAffected = rowsAffected;
	}


	public int getBooking_id() {
		return booking_id;
	}


	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getDateofbirth() {
		return dateofbirth;
	}


	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}


	public String getPass() {
		return pass;
	}


	public void setPass(String pass) {
		this.pass = pass;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getHandphone() {
		return handphone;
	}


	public void setHandphone(String handphone) {
		this.handphone = handphone;
	}


	public String getCardtype() {
		return cardtype;
	}


	public void setCardtype(String cardtype) {
		this.cardtype = cardtype;
	}


	public String getCardnumber() {
		return cardnumber;
	}


	public void setCardnumber(String cardnumber) {
		this.cardnumber = cardnumber;
	}


	public String getCardexpiry() {
		return cardexpiry;
	}


	public void setCardexpiry(String cardexpiry) {
		this.cardexpiry = cardexpiry;
	}


	public String getCardCV2() {
		return cardCV2;
	}


	public void setCardCV2(String cardCV2) {
		this.cardCV2 = cardCV2;
	}


	public int getRowsAffected() {
		return rowsAffected;
	}


	public void setRowsAffected(int rowsAffected) {
		this.rowsAffected = rowsAffected;
	}




}