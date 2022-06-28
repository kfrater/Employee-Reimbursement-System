<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AdminDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.Admin"%>
<%@page import="java.util.List"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Reimbursement</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}


</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container p-3">
	<div class="row">
	<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">

			<div class="col-md-12">
						<p class="text-center fs-3">User Reimbursement</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class=" fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<form class="row g-3" action="reimbursementSubmit" method="post">

							<input type="hidden" name="userid" value="${userObj.id }">

							<div class="col-md-12">
								<label for="inputEmail4" class="form-label">Full Name</label> <input
									required type="text" class="form-control" name="fullname">
							</div>
							
							<div class="col-md-12">
								<label for="inputEmail4" class="form-label">Amount</label> <input
									required type="number" class="form-control" name="amount">
							</div>
							
							<div class="col-md-12">
								<label for="inputEmail4" class="form-label">Request Date</label> <input type="date" class="form-control" required
									name="requestdate">
							

							<div class="col-md-12">
								<label for="inputPassword4" class="form-label">Submit To</label> <select
									required class="form-control" name="admin">
									<option value="">select</option>
										<%
									AdminDao dao = new AdminDao(DBConnect.getConn());
									List<Admin> list = dao.getAllAdmin();
									for (Admin a : list) {
									%>
									<option value="<%=a.getId()%>"><%=a.getFullName()%>
									</option>
									<%
									}
									%>  

								</select>
							</div>

							<div class="col-md-12">
								<label>Description</label>
								<textarea required name="description" class="form-control" rows="3"
									cols=""></textarea>
							</div>
							<br>
							<br>

							<c:if test="${empty userObj }">
								<a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
							</c:if>

							<c:if test="${not empty userObj }">
								<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	


</body>
</html>
