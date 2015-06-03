<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script>

$(document).ready(function() {
	
	
	/* $('.input-group.date').datepicker({
	    startView: 2,
	    todayBtn: "linked",
	    format:"dd/mm/yyyy"
	    
	}); */
	
});






</script>











</head>
<body>
	<div class="container">
		<div class="row">
			<!-- <div class="col-md-6"> -->
			<h1>Application</h1>
			<button class="btn btn-primary" id="buttonAdd" data-toggle="modal"
				data-target="#myModal">
				<span class="glyphicon glyphicon-plus"></span> Application
			</button>
			<!-- </div> -->
		</div>
	</div>

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-folder-open"></span> Application
					</h4>
				</div>
				<div class="modal-body">
					<form role="form" id="application">

						<div class="form-group">
							<ul class="nav nav-tabs" role="navigation">
								<li class="active"><a data-toggle="tab"
									href="#informations"><span class="glyphicon glyphicon-user"></span>
										Informations</a></li>
								<li><a data-toggle="tab" href="#address"><span
										class="glyphicon glyphicon-home"></span> Address</a></li>
								<li><a data-toggle="tab" href="#educations"><span
										class="glyphicon glyphicon-education"></span> Educations</a></li>
								<li><a data-toggle="tab" href="#experiences"><span
										class="glyphicon glyphicon-file"></span> Experiences</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<div id="informations" class="tab-pane fade in active">

								<!-- 	<h3>Informations</h3> -->
								<div class="form-group">
											<label for="department"><!-- <span
												class="glyphicon glyphicon-folder-open"></span> -->Department </label> <select
												id="departmentId" class="form-control">
												<c:forEach var="departmentList" items="${departments}">
													<option value="${departmentList.id}">${departmentList.departmentName}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label for="position"><!-- <span
												class="glyphicon glyphicon-folder-open"></span> -->Position </label> <select
												id="positionId" class="form-control">
												<c:forEach var="positionList" items="${positions}">
													<option value="${positionList.id}">${positionList.positionName}</option>
												</c:forEach>
											</select>
										</div> 

								<div class="form-group">
									<label for="salary">
										<!-- <span
										class="glyphicon glyphicon-user"></span> -->Salary expected
									</label> <input type="text" class="form-control" id="salaryId"
										name="salaryName" placeholder="Enter salary">
								</div>
								<div class="form-group">
									<label for="photograph">
										<!-- <span
										class="glyphicon glyphicon-user"></span> -->PHOTOGRAPH
									</label> <input type="text" class="form-control" id="photographId"
										name="photographName" placeholder="Enter photograph">
								</div>
								<div class="form-group">
									<label for="nameTh">
										<!-- <span
										class="glyphicon glyphicon-user"></span> -->Name (TH)
									</label> <input type="text" class="form-control" id="nameThId"
										name="nameThName" placeholder="Enter name(TH)">
								</div>
								<div class="form-group">
									<label for="lastnameTh">
										<!-- <span
										class="glyphicon glyphicon-user"></span> -->Lastname (TH)
									</label> <input type="text" class="form-control" id="lastnameId"
										name="lastnameName" placeholder="Enter lastname(TH)">
								</div>
								<div class="form-group">
									<label for="nameEng">
										<!-- <span
										class="glyphicon glyphicon-user"></span> -->Name (ENG)
									</label> <input type="text" class="form-control" id="nameEngId"
										name="nameEngName" placeholder="Enter name(ENG)">
								</div>
								<div class="form-group">
									<label for="lastnameEng">
										<!-- <span
										class="glyphicon glyphicon-user"></span> -->Lastname (ENG)
									</label> <input type="text" class="form-control" id="lastnameEngId"
										name="lastnameEngName" placeholder="Enter lastname(ENG)">
								</div>
								<div class="form-group">

									<label for="birthday"><span
										class="glyphicon glyphicon-calendar"></span> Birthday</label>
									<div class="input-group date">
										<input type="text" id="birthdayId" name="birthdayName"
											class="form-control"><span class="input-group-addon"><i
											class="glyphicon glyphicon-th"></i></span>
									</div>

								</div>
								<div class="form-group">
									<label for="pBirth">
										<!-- <span
										class="glyphicon glyphicon-user"></span> -->Place of birth
									</label> <input type="text" class="form-control" id="pBirthId"
										name="pBirthName" placeholder="Enter place of birth">
								</div>
								<div class="form-group">
									<label for="age">
										<!-- <span class="glyphicon glyphicon-user"></span> -->Age
									</label> <input type="text" class="form-control" id="ageId"
										name="ageName" placeholder="Enter age">
								</div>
								<div class="form-group">
									<label for="religion">
										<!-- <span
										class="glyphicon glyphicon-user"></span> -->Religion
									</label> <input type="text" class="form-control" id="religionId"
										name="religionName" placeholder="Enter religion">
								</div>
								<div class="form-group">
									<label for="idCard">
										<!-- <span
										class="glyphicon glyphicon-user"></span> -->ID. Card no.
									</label> <input type="text" class="form-control" id="idCardId"
										name="idCardName" placeholder="Enter ID. Card no.">
								</div>
								<div class="form-group">
									<label for="issued">
										<!-- <span
										class="glyphicon glyphicon-user"></span> -->Issued office
									</label> <input type="text" class="form-control" id="issuedId"
										name="issuedName" placeholder="Enter issued office">
								</div>
								<div class="form-group">
									<label for="expiry">
										<!-- <span
										class="glyphicon glyphicon-user"></span> -->Expiry date
									</label> <input type="text" class="form-control" id="expiryId"
										name="expiryName" placeholder="Enter expiry date">
								</div>
								<div class="form-group">
									<label for="height">
										<!-- <span
										class="glyphicon glyphicon-user"></span> -->Height (cms)
									</label> <input type="text" class="form-control" id="heightId"
										name="heightName" placeholder="Enter height (cms)">
								</div>
								<div class="form-group">
									<label for="weight">
										<!-- <span
										class="glyphicon glyphicon-user"></span> -->Weight (kgs)
									</label> <input type="text" class="form-control" id="weightId"
										name="weightName" placeholder="Enter weight (kgs)">
								</div>







							</div>
							<div id="address" class="tab-pane fade">

								<h3>Address</h3>
								<div class="form-group">
									<label for="presentAddress"><span
										class="glyphicon glyphicon-user"></span>Present
										address/Telephone </label> <input type="text" class="form-control"
										id="presentAddressId" name="presentAddressName"
										placeholder="Enter present address">
								</div>

								<div class="form-group">
									<label for="permanentAddress"><span
										class="glyphicon glyphicon-user"></span>Permanent
										address/Telephone </label> <input type="text" class="form-control"
										id="presentAddressId" name="presentAddressName"
										placeholder="Enter present address">
								</div>
								<div class="form-group">
									<label for="emergency"><span
										class="glyphicon glyphicon-user"></span>In case of emergency ,
										notify , ( Name , Address and Telephone ) </label> <input type="text"
										class="form-control" id="emergencyId" name="emergencyName"
										placeholder="Enter ( Name , Address and Telephone )">
								</div>



							</div>


							<div id="educations" class="tab-pane fade">
								<h3>Educations</h3>

							</div>
							<div id="experiences" class="tab-pane fade">
								<h3>Experiences</h3>

							</div>
						</div>
						<br> <br>
						<button type="button" class="btn btn-success" id="buttonSave">
							<span class="glyphicon glyphicon-off"></span> Save
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

					</form>
				</div>
				<div class="modal-footer">
					<p>Please fill your information</p>
				</div>
			</div>

		</div>
	</div>
</body>
</html>