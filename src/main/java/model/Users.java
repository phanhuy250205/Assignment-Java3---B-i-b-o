package model;

import java.util.Date;

public class Users {
	private String Id;
	private String Email;
	private String password ;
	private boolean Role;
	private String fullName;
	private Date Birthday;
	private boolean Gender;
	private String  Mobile;
	
	private String Hinh;
	public Users() {
		
	}
	public Users(String id, String email, String password, boolean role, String fullName, Date birthday, boolean gender,
			String mobile, String hinh) {
		super();
		Id = id;
		Email = email;
		this.password = password;
		Role = role;
		this.fullName = fullName;
		Birthday = birthday;
		Gender = gender;
		Mobile = mobile;
		Hinh = hinh;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isRole() {
		return Role;
	}
	public void setRole(boolean role) {
		Role = role;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
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
	public String getHinh() {
		return Hinh;
	}
	public void setHinh(String hinh) {
		Hinh = hinh;
	}
	@Override
	public String toString() {
		return "Users [Id=" + Id + ", Email=" + Email + ", password=" + password + ", Role=" + Role + ", fullName="
				+ fullName + ", Birthday=" + Birthday + ", Gender=" + Gender + ", Mobile=" + Mobile + ", Hinh=" + Hinh
				+ "]";
	}
	

	
}
