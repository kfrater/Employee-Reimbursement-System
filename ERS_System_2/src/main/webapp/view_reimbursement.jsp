<%@page import="com.entity.User"%>
<%@page import="com.entity.Admin"%>
<%@page import="com.dao.AdminDao"%>
<%@page import="com.entity.Reimbursement"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.ReimbursementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>View Reimbursement</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/bluebackground.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<c:if test="${empty userObj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>
	<%@include file="component/navbar.jsp"%>

	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Reimbursement
							List</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Amount</th>
									<th scope="col">Request Date</th>
									<th scope="col">Submitted To</th>
									<th scope="col">Description</th>
									<th scope="col">Status</th>
									

								</tr>
							</thead>
							<tbody>
								<%
								User user = (User) session.getAttribute("userObj");
								ReimbursementDAO dao = new ReimbursementDAO(DBConnect.getConn());
								AdminDao dao2=new AdminDao(DBConnect.getConn());
								List<Reimbursement> list = dao.getAllReimbursementByLoginUser(user.getId());
								for (Reimbursement ap : list) {
								Admin a	=dao2.getAdminById(ap.getAdminId());
	
				
								%>
								<tr>
									<th><%=ap.getFullName()%></th>
									<td><%=ap.getAmount()%></td>
									<td><%=ap.getRequestDate()%></td>
									<td><%=a.getFullName()%></td>
									<td><%=ap.getDescription()%></td>
									<td>
										<%
										if ("Pending".equals(ap.getStatus())) {
											%> <a href="#" class="btn btn-sm btn-warning disabled">Pending</a> 
										 <%} else {%>
										 <%=ap.getStatus()%> <%
										 }
										 %>
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

			<div class="col-md-3 p-3">
				<img alt="" src="#">
			</div>
		</div>
	</div>


</body>
</html>