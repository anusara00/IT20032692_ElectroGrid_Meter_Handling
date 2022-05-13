<%@page import="com.Meter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/meter.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<h1>Items Management V10.1</h1>
				<form id="formMeter" name="formMeter" method="post" action="meters.jsp">
						Account Number: 
						<input id="AccountNo" name="AccountNo" type="text"
						class="form-control form-control-sm"> <br> 
						Customer name:
						<input id="Cus_name" name="Cus_name" type="text"
						class="form-control form-control-sm"> <br> 
						Units: 
						<input id="Units" name="Units" type="text"
						class="form-control form-control-sm"> <br> 
						Total amount: 
						<input id="Total_amount" name="Total_amount" type="text"
						class="form-control form-control-sm"> <br>	
											 
						<input id="btnSave" name="btnSave" type="button" value="Save"
						class="btn btn-primary"> <input type="hidden"
						id="hidMeterIDSave" name="hidMeterIDSave" value="">
				</form>
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>
				<div id="divMeterGrid">
					
				</div>
			</div>
		</div>
	</div>

</body>
</html>