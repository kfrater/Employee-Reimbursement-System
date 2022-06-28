package com.entity;

public class Reimbursement {
	private int id;
	private int userId;
	private String fullName;
	private String amount;
	private String requestDate;
	private String description;
	private String status;
	private int adminId;
	public Reimbursement() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reimbursement(int userId, String fullName, String amount, String requestDate, int adminId, String description, 
			String status) {
		super();
		this.userId = userId;
		this.fullName = fullName;
		this.amount = amount;
		this.requestDate = requestDate;
		this.description = description;
		this.status = status;
		this.adminId = adminId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) { 
		this.fullName = fullName;
}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	
		
	}
	

	
	

