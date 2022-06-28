package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Admin;


public class AdminDao {

	
	private Connection conn;

	public AdminDao(Connection conn) {
		super();
		this.conn = conn;
}
	
	public Admin login(String em, String psw)
	{
		Admin a = null;
		
		try {
			String sql="select * from admin_dtls where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);
			
			ResultSet rs=ps.executeQuery();
			
			while (rs.next()) 
		
		{
			a = new Admin();
			a.setId(rs.getInt(1));
			a.setFullName(rs.getString(2));
			a.setEmail(rs.getString(3));
			a.setPassword(rs.getString(4));
			
		}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
			
			return a;
	}
	
	public List<Admin> getAllAdmin() {
		List<Admin> list = new ArrayList<Admin>();
		Admin a = null;
		try {

String sql = "select * from admin_dtls order by id desc";
PreparedStatement ps = conn.prepareStatement(sql);

ResultSet rs = ps.executeQuery();
while (rs.next()) {
	a = new Admin();
	a.setId(rs.getInt(1));
	a.setFullName(rs.getString(2));
	a.setEmail(rs.getString(3));
	a.setPassword(rs.getString(4));
	list.add(a);
}

} catch (Exception e) {
e.printStackTrace();
}
return list;
}

public Admin getAdminById(int id) {

Admin a = null;
try {

String sql = "select * from admin_dtls where id=?";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setInt(1, id);
ResultSet rs = ps.executeQuery();

while (rs.next()) {
	a = new Admin();
	a.setId(rs.getInt(1));
	a.setFullName(rs.getString(2));
	a.setEmail(rs.getString(3));
	a.setPassword(rs.getString(4));

}

} catch (Exception e) {
e.printStackTrace();
}
return a;
}

}
