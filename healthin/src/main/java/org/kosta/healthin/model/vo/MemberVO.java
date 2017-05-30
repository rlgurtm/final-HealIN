package org.kosta.healthin.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO implements VO {
	private String id;
	private String password;
	private String nickname;
	private String name;
	private String birthdate;
	private String gender;
	private String address;
	private String tel;
	private String email;
	private String istrainer;
	private String withdrawal;

	public MemberVO() {
		super();
	}
	
	public MemberVO(String id, String password, String nickname, String name, String birthdate, String gender,
			String address, String tel, String email, String istrainer, String withdrawal) {
		super();
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.name = name;
		this.birthdate = birthdate;
		this.gender = gender;
		this.address = address;
		this.tel = tel;
		this.email = email;
		this.istrainer = istrainer;
		this.withdrawal = withdrawal;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIstrainer() {
		return istrainer;
	}

	public void setIstrainer(String istrainer) {
		this.istrainer = istrainer;
	}

	public String getWithdrawal() {
		return withdrawal;
	}

	public void setWithdrawal(String withdrawal) {
		this.withdrawal = withdrawal;
	}
	


	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", nickname=" + nickname + ", name=" + name
				+ ", birthdate=" + birthdate + ", gender=" + gender + ", address=" + address + ", tel=" + tel
				+ ", email=" + email + ", istrainer=" + istrainer + ", withdrawal=" + withdrawal  + "]";
	}


	
}
