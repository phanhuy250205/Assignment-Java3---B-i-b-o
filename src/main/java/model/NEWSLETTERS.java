package model;

public class NEWSLETTERS {
	private String email;

	public NEWSLETTERS() {
		
	}

	public NEWSLETTERS(String email) {
		super();
		this.email = email;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "NEWSLETTERS [email=" + email + "]";
	}
	
	
}
