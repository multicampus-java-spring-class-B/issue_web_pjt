package biz.user.vo;

public class UserVO {
	String userid;
	String pw;
	String name;
	String phone;
	String sex;
	
	public UserVO() {
		super();
	}
	
	public UserVO(String userid, String name, String pw, String phone, String sex) {
		super();
		this.userid = userid;
		this.name = name;
		this.pw = pw;
		this.phone = phone;
		this.sex = sex;
	}
	
	@Override
	public String toString() {
		return "UserVO [userid=" + userid + ", name=" + name + ", pw=" + pw + ", phone=" + phone + ", sex=" + sex + "]";
	}

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
}
