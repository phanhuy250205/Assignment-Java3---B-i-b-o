package model;

import java.util.Date;

public class Users {
    // Các thuộc tính của người dùng
    private String id;
    private String email;
    private String password;
    private boolean role;
    private String fullname;
    private Date birthday;
    private boolean gender;
    private String mobile;
    private String image;

    // Constructor không tham số
    public Users() {
    }

    // Constructor đầy đủ tham số
    public Users(String id, String email, String password, boolean role, String fullname, Date birthday, boolean gender, String mobile, String image) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.role = role;
        this.fullname = fullname;
        this.birthday = birthday;
        this.gender = gender;
        this.mobile = mobile;
        this.image = image;
    }

    // Getter và Setter cho các thuộc tính
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getemail() {
        return email;
    }

    public void setemail(String email) {
        this.email = email;
    }

    public String getpassword() {
        return password;
    }

    public void setpassword(String password) {
        this.password = password;
    }

    public boolean isRole() {
        return role;
    }

    public void setrole(boolean role) {
        this.role = role;
    }

    public String getfullname() {
        return fullname;
    }

    public void setfullname(String fullname) {
        this.fullname = fullname;
    }

    public Date getbirthday() {
        return birthday;
    }

    public void setbirthday(Date birthday) {
        this.birthday = birthday;
    }

    public boolean isgender() {
        return gender;
    }

    public void setgender(boolean gender) {
        this.gender = gender;
    }

    public String getmobile() {
        return mobile;
    }

    public void setmobile(String mobile) {
        this.mobile = mobile;
    }

    public String getimage() {
        return image;
    }

    public void setimage(String image) {
        this.image = image;
    }

    // Phương thức toString để hiển thị thông tin người dùng
    @Override
    public String toString() {
        return "Users{" +
                "id='" + id + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", role=" + role +
                ", fullname='" + fullname + '\'' +
                ", birthday=" + birthday +
                ", gender=" + gender +
                ", mobile='" + mobile + '\'' +
                ", hinh='" + image + '\'' +
                '}';
    }
}
