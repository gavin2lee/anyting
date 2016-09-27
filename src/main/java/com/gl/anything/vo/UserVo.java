package com.gl.anything.vo;

import java.util.Date;

public class UserVo extends BaseVo {
	private String username;
	private String password;
	private String email;
	private String name;
	private Date birth;
	private RoleVo role;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public RoleVo getRole() {
		return role;
	}

	public void setRole(RoleVo role) {
		this.role = role;
	}	
}
