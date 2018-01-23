package com.atm.domain;

import java.util.Date;

public class History {
	private String id;
	private Account account;
	private Date datetime;
	private double expense;
	private double income;
	private String sourceid;
	private String remarks;

	public History() {
		super();
	}
	public History(String id, Account account, Date datetime, double expense, double income, String sourceid,
			String remarks) {
		super();
		this.id = id;
		this.account = account;
		this.datetime = datetime;
		this.expense = expense;
		this.income = income;
		this.sourceid = sourceid;
		this.remarks = remarks;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	public Date getDatetime() {
		return datetime;
	}
	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}
	public double getExpense() {
		return expense;
	}
	public void setExpense(double expense) {
		this.expense = expense;
	}
	public double getIncome() {
		return income;
	}
	public void setIncome(double income) {
		this.income = income;
	}
	public String getSourceid() {
		return sourceid;
	}
	public void setSourceid(String sourceid) {
		this.sourceid = sourceid;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
}
