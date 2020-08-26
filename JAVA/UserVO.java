package biz.user.vo;

public class UserVO {
	String user_id;
	String pw;
	String name;
	String hp;
	String sex;
	
	public UserVO() {
		super();
	}
	
	public UserVO(String user_id, String name, String pw, String hp, String sex) {
		super();
		this.user_id = user_id;
		this.name = name;
		this.pw = pw;
		this.hp = hp;
		this.sex = sex;
	}
	
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", name=" + name + ", pw=" + pw + ", hp=" + hp + ", sex=" + sex + "]";
	}

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public String getHp() {
		return hp;
	}
	public void setPHp(String hp) {
		this.hp = hp;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
}
