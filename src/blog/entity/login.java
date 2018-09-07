package blog.entity;

public class login {
	private int id;
	private String name;
	private String tel;
	private String nickname;
	private String pwd;
	private String interest;
	private String blogbirth;
	public String getBlogbirth() {
		return blogbirth;
	}
	public void setBlogbirth(String blogbirth) {
		this.blogbirth = blogbirth;
	}
	public login() {
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	};
}	
