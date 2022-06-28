<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.entity.Reimbursement"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.ReimbursementDAO"%>
<%@page import="com.entity.Admin"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<%@include file= "connect.jsp"%>
<head>
<title>Admin Dashboard</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<c:if test="${empty adminObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>


	<%@include file="navbar.jsp"%>
	<br>
	<br>
	
	<div class="container p-3">
	<div class="row">
	<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
	 	<form action="" method="get">
	 		<input type="text" class="form-control" name="q" placeholder="Search here.."/>
	 	
	 	
	 	
	 	</form>
	 	
</div>
</div>
</div>
</div>
</div>
<div class="container p-3">
		<div class="row">

			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Searched Reimbursements</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Amount</th>
									<th scope="col">Request Date</th>
									<th scope="col">Description</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
							<%
							Statement stat = null;
							ResultSet res = null;
							stat = conn.createStatement();
							String query = request.getParameter("q");
							String data;
							if(query!=null) {
							data = "select * from reimbursement where fullname like '%"+query+"%' or request_date like '%"+query+"%' or description like '%"+query+"%' or status like '%"+query+"%'"; 
							} else{
								data = "select * from reimbursement";
							}
							res = stat.executeQuery(data);
							while(res.next()) {
								%>
								<tr>
									<td><%=res.getString("fullname")%></td>
									<td><%=res.getString("amount")%></td>
									<td><%=res.getString("request_date")%></td>
									<td><%=res.getString("description")%></td>
									<td><%=res.getString("Status")%></td>
									<td>
									<a href="comment.jsp?id=<%=res.getString("id")%>" class="btn btn-success btn-sm">Comment</a>
									</td>
										</tr>
								
								<%
							}
							
								%>
									
							


							</tbody>
						</table>

					</div>
				</div>
			</div>

		</div>
	</div>
								
									
							
	<div class="container p-3">
		<div class="row">

			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">All Reimbursements</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class=" fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Amount</th>
									<th scope="col">Request Date</th>
									<th scope="col">Description</th>
									<th scope="col">Status</th>
									
								</tr>
							</thead>
							<tbody>
								
							
							<%Admin a=(Admin)session.getAttribute("adminObj"); 
							ReimbursementDAO dao = new ReimbursementDAO(DBConnect.getConn());
							List<Reimbursement> list = dao.getAllReimbursementByAdminLogin(a.getId());
							for (Reimbursement ap : list) {
							%>
								<tr>
									<th><%=ap.getFullName()%></th>
									<td><%=ap.getAmount()%></td>
									<td><%=ap.getRequestDate()%></td>
									<td><%=ap.getDescription()%></td>
									<td><%=ap.getStatus() %></td>
									
						
									
								</tr>
								
								<%
							}
							
								%>
									
							


							</tbody>
						</table>

					</div>
				</div>
			</div>

		</div>
	</div>



</body>
</html>