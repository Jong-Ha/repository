package jw04;

public class UserVO {
	
	private String id;
	private String pwd;
	private boolean active;

	public UserVO() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
	@Override
	public String toString() {
		return "UserVO [id=" +id+ ",pwd= " + pwd + ",active=" + active+ "]";
	}
		
}