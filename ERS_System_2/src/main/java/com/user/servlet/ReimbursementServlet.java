package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ReimbursementDAO;
import com.db.DBConnect;
import com.entity.Reimbursement;

@WebServlet("/reimbursementSubmit")
public class ReimbursementServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
			int userId = Integer.parseInt(req.getParameter("userid"));
		String fullname = req.getParameter("fullname");
		String amount = req.getParameter("amount");
		String request_date = req.getParameter("requestdate");
		int adminId = Integer.parseInt(req.getParameter("admin"));
		String description = req.getParameter("description");
		
		
		Reimbursement rb = new Reimbursement(userId, fullname, amount, request_date, adminId, description, "Pending");

		ReimbursementDAO dao = new ReimbursementDAO(DBConnect.getConn());
		HttpSession session=req.getSession();
		
		if(dao.addReimbursement(rb))
		{
			session.setAttribute("succMsg", "Reimbursement Submitted");
			resp.sendRedirect("view_reimbursement.jsp");
		}else {
			session.setAttribute("errorMsg", "Server Error");
			resp.sendRedirect("user_reimbursement.jsp");
			
		}}
	

}
	
