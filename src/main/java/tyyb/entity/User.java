
package tyyb.entity;


public class User {
	
	private int id;
	private String name;
	private String password;
	private String nickname;
	private String e_mail;
	private String usercontent;
	private String sex;
	private String xueli;
	public String getXueli() {
		return xueli;
	}
	public void setXueli(String xueli) {
		this.xueli = xueli;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	private String head_portrait;
	
	public String getHead_portrait() {
                return head_portrait;
        }
        public void setHead_portrait(String head_portrait) {
                this.head_portrait = head_portrait;
        }
        public String getUsercontent() {
		return usercontent;
	}
	public void setUsercontent(String usercontent) {
		this.usercontent = usercontent;
	}
	public String getE_mail() {
		return e_mail;
	}
	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
        public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}