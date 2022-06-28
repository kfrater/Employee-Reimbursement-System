<%@page import="com.entity.Reimbursement"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.ReimbursementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Approve/Deny</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}


</style>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<c:if test="${empty adminObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>


	<%@include file="navbar.jsp"%>
	
	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">

			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Approve/Deny</p>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						ReimbursementDAO dao = new ReimbursementDAO(DBConnect.getConn());

						Reimbursement ap = dao.getReimbursementById(id);
						%>
						<form class="row" action="../updateStatus" method="post">
							<div class="col-md-6">
								<label>Employee Name</label> <input type="text" readonly
									value="<%=ap.getFullName()%>" class="form-control">
							</div>

							<div class="col-md-6">
								<label>Amount</label> <input type="text" value="<%=ap.getAmount()%>"
									readonly class="form-control">
							</div>


							<div class="col-md-6">
								<br> <label>Request Date</label> <input type="text" readonly
									value="<%=ap.getRequestDate()%>" class="form-control">
							</div>

							<div class="col-md-6">
								<br> <label>Description</label> <input type="text" readonly
									value="<%=ap.getDescription()%>" class="form-control">
							</div>

							<div class="col-md-12">
								<br> <label>Comment</label>
								<textarea required name="comm" class="form-control" row="3"
									cols=""></textarea>
							</div>

							<input type="hidden" name="id" value="<%=ap.getId()%>"> <input
								type="hidden" name="aid" value="<%=ap.getAdminId()%>">

							<button class=" mt-3 btn btn-success col-md-6 offset-md-3">Submit</button>
							

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>