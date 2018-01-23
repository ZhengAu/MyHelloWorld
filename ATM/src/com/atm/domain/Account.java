package com.atm.domain;

public class Account {
	private String userid;
	private String username;
	private String password;
	private String type;
	private double balance;
	
	public Account(String userid, String username, String password, String type, double balance) {
		super();
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.type = type;
		this.balance = balance;
	}
	public Account() {
		super();
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}

}
