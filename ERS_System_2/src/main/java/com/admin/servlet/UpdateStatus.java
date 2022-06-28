package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ReimbursementDAO;
import com.db.DBConnect;

@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			int aid=Integer.parseInt(req.getParameter("aid"));
			String comm=req.getParameter("comm");
			
			ReimbursementDAO dao=new ReimbursementDAO(DBConnect.getConn());
			
			HttpSession session=req.getSession();
			
			if(dao.updateCommentStatus(id,  aid, comm))
			{
				session.setAttribute("succMsg", "File Updated");
				resp.sendRedirect("admin/index.jsp");
			}else {
				session.setAttribute("errorMsg", "Something Went Wrong");
				resp.sendRedirect("comment.jsp");
			}
			
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

}
