package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Reimbursement;

public class ReimbursementDAO {
	
	private Connection conn;
	
	public ReimbursementDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addReimbursement(Reimbursement rb)
	{
		boolean f=false;
		
		try {
			String sql="insert into reimbursement(user_id,fullname,amount,request_date,admin_id,description,status) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, rb.getUserId());
			ps.setString(2, rb.getFullName());
			ps.setString(3, rb.getAmount());
			ps.setString(4, rb.getRequestDate());
			ps.setInt(5, rb.getAdminId());
			ps.setString(6, rb.getDescription());
			ps.setString(7, rb.getStatus());
	
			
			int i=ps.executeUpdate();
			if (i == 1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	
	return f;

}



public List<Reimbursement> getAllReimbursementByLoginUser(int userId)
{
	List<Reimbursement> list = new ArrayList<Reimbursement>();
	Reimbursement ap = null;

	try {

		String sql = "select * from reimbursement where user_id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, userId);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			ap = new Reimbursement();
			ap.setId(rs.getInt(1));
			ap.setUserId(rs.getInt(2));
			ap.setFullName(rs.getString(3));
			ap.setAmount(rs.getString(4));
			ap.setRequestDate(rs.getString(5));	
			ap.setAdminId(rs.getInt(6));
			ap.setDescription(rs.getString(7));
			ap.setStatus(rs.getString(8));
			list.add(ap);
		}

	} catch (Exception e) {
		e.printStackTrace();
	}

	return list;
}



public List<Reimbursement> getAllReimbursementByAdminLogin(int adminId) {
	List<Reimbursement> list = new ArrayList<Reimbursement>();
	Reimbursement ap = null;

	try {

		String sql = "select * from reimbursement where admin_id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, adminId);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			ap = new Reimbursement();
			ap.setId(rs.getInt(1));
			ap.setUserId(rs.getInt(2));
			ap.setFullName(rs.getString(3));
			ap.setAmount(rs.getString(4));
			ap.setRequestDate(rs.getString(5));
			ap.setAdminId(rs.getInt(6));
			ap.setDescription(rs.getString(7));
			ap.setStatus(rs.getString(8));
			list.add(ap);
		}

	} catch (Exception e) {
		e.printStackTrace();
	}

	return list;
}



public Reimbursement getReimbursementById(int id) {
	
	Reimbursement ap = null;

	try {

		String sql = "select * from reimbursement where id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			ap = new Reimbursement();
			ap.setId(rs.getInt(1));
			ap.setUserId(rs.getInt(2));
			ap.setFullName(rs.getString(3));
			ap.setAmount(rs.getString(4));
			ap.setRequestDate(rs.getString(5));
			ap.setAdminId(rs.getInt(6));
			ap.setDescription(rs.getString(7));
			ap.setStatus(rs.getString(8));
			
		}

	} catch (Exception e) {
		e.printStackTrace();
	}

	return ap;
}



public boolean updateCommentStatus(int id,int adminId,String comm)
{
	boolean f=false;
	try {
		String sql="update reimbursement set status=? where id=? and admin_id=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, comm);
		ps.setInt(2, id);
		ps.setInt(3, adminId);
		
		int i = ps.executeUpdate();
		if (i ==1) {
			f = true;
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return f;
}


		}
	

