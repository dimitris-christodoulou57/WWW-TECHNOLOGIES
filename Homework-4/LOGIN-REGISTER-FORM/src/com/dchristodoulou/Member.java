package com.dchristodoulou;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name = "member_db")
@Access(value=AccessType.FIELD)
public class Member implements Serializable {

	@Id
	@Column(name = "member_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer memberID;
	
	@Column(name = "member_email")
	private String email;
	
	@Column(name = "member_password")
	private String password;
	
	public Integer getMemberID() {
		return memberID;
	}
	
	public void setMemberID(Integer memberID) {
		this.memberID = memberID;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
