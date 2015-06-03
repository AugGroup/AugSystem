<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Applicant</title>
</head>
<body>

	<form role="form" id="application">
						<div class="container">
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab"
									href="#informations">Informations</a></li>
								<li><a data-toggle="tab" href="#address">Address</a></li>
								<li><a data-toggle="tab" href="#educations">Educations</a></li>
								<li><a data-toggle="tab" href="#experiences">Experiences</a></li>
							</ul>
							<div class="tab-content">
								<div id="informations" class="tab-pane fade in active">
									<div class="container">
										<h3>Informations</h3>
										<div class="form-group">
											<label for="position"><span
												class="glyphicon glyphicon-user"></span>Position applied for
											</label> <input type="text" class="form-control" id="positionId"
												name="positionName" placeholder="Enter position">
										</div>
										<div class="form-group">
											<label for="salary"><span
												class="glyphicon glyphicon-user"></span>Salary expected </label> <input
												type="text" class="form-control" id="salaryId"
												name="salaryName" placeholder="Enter salary">
										</div>
										<div class="form-group">
											<label for="nameTh"><span
												class="glyphicon glyphicon-user"></span>Name (TH) </label> <input
												type="text" class="form-control" id="nameThId"
												name="nameThName" placeholder="Enter name(TH)">
										</div>
										<div class="form-group">
											<label for="lastnameTh"><span
												class="glyphicon glyphicon-user"></span>Lastname (TH) </label> <input
												type="text" class="form-control" id="lastnameId"
												name="lastnameName" placeholder="Enter lastname(TH)">
										</div>
										<div class="form-group">
											<label for="nameEng"><span
												class="glyphicon glyphicon-user"></span>Name (ENG) </label> <input
												type="text" class="form-control" id="nameEngId"
												name="nameEngName" placeholder="Enter name(ENG)">
										</div>
										<div class="form-group">
											<label for="lastnameEng"><span
												class="glyphicon glyphicon-user"></span>Lastname (ENG) </label> <input
												type="text" class="form-control" id="lastnameEngId"
												name="lastnameEngName" placeholder="Enter lastname(ENG)">
										</div>
										<div class="form-group">

											<label for="birthday"><span
												class="glyphicon glyphicon-calendar"></span> Birthday</label>
											<div class="input-group date">
												<input type="text" id="birthdayId" name="birthdayName"
													class="form-control"><span
													class="input-group-addon"><i
													class="glyphicon glyphicon-th"></i></span>
											</div>

										</div>
										<div class="form-group">
											<label for="pBirth"><span
												class="glyphicon glyphicon-user"></span>Place of birth </label> <input
												type="text" class="form-control" id="pBirthId"
												name="pBirthName" placeholder="Enter place of birth">
										</div>
										<div class="form-group">
											<label for="age"><span
												class="glyphicon glyphicon-user"></span>Age </label> <input
												type="text" class="form-control" id="ageId" name="ageName"
												placeholder="Enter age">
										</div>
										<div class="form-group">
											<label for="religion"><span
												class="glyphicon glyphicon-user"></span>Religion </label> <input
												type="text" class="form-control" id="religionId"
												name="religionName" placeholder="Enter religion">
										</div>
										<div class="form-group">
											<label for="pBirth"><span
												class="glyphicon glyphicon-user"></span>Place of birth </label> <input
												type="text" class="form-control" id="pBirthId"
												name="pBirthName" placeholder="Enter place of birth">
										</div>
										<div class="form-group">
											<label for="pBirth"><span
												class="glyphicon glyphicon-user"></span>Place of birth </label> <input
												type="text" class="form-control" id="pBirthId"
												name="pBirthName" placeholder="Enter place of birth">
										</div>

									</div>


								</div>
								<div id="address" class="tab-pane fade">
									<div class="container">
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
												class="glyphicon glyphicon-user"></span>In case of emergency
												, notify , ( Name , Address and Telephone ) </label> <input
												type="text" class="form-control" id="emergencyId"
												name="emergencyName"
												placeholder="Enter ( Name , Address and Telephone )">
										</div>

										<div class="form-group">
											<label for="photograph"><span
												class="glyphicon glyphicon-user"></span>PHOTOGRAPH </label> <input
												type="text" class="form-control" id="photographId"
												name="photographName" placeholder="Enter photograph">
										</div>

									</div>

								</div>


								<div id="educations" class="tab-pane fade">
									<h3>Educations</h3>

								</div>
								<div id="experiences" class="tab-pane fade">
									<h3>Experiences</h3>

								</div>
							</div>
						</div>
					</form>

</body>
</html>