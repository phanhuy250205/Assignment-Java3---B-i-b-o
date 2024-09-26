package model;

import java.util.Date;

public class Users {
	private String Id;
	private String password;
	private String Fullname;
	private Date Birthday;
	private boolean Gender;
	private String  Mobile;
	private String Email;
	private boolean Role;
	public Users() {
		
	}
	public Users(String id, String password, String fullname, Date birthday, boolean gender, String mobile,
			String email, boolean role) {
		
		Id = id;
		this.password = password;
		Fullname = fullname;
		Birthday = birthday;
		Gender = gender;
		Mobile = mobile;
		Email = email;
		Role = role;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullname() {
		return Fullname;
	}
	public void setFullname(String fullname) {
		Fullname = fullname;
	}
	public Date getBirthday() {
		return Birthday;
	}
	public void setBirthday(Date birthday) {
		Birthday = birthday;
	}
	public boolean isGender() {
		return Gender;
	}
	public void setGender(boolean gender) {
		Gender = gender;
	}
	public String getMobile() {
		return Mobile;
	}
	public void setMobile(String mobile) {
		Mobile = mobile;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public boolean isRole() {
		return Role;
	}
	public void setRole(boolean role) {
		Role = role;
	}
	@Override
	public String toString() {
		return "Users [Id=" + Id + ", password=" + password + ", Fullname=" + Fullname + ", Birthday=" + Birthday
				+ ", Gender=" + Gender + ", Mobile=" + Mobile + ", Email=" + Email + ", Role=" + Role + "]";
	}
	
	
	
	
}
