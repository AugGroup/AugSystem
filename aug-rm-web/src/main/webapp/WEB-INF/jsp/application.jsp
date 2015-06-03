<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	$(document).ready(function() {

		/* $('.input-group.date').datepicker({
		    startView: 2,
		    todayBtn: "linked",
		    format:"dd/mm/yyyy"
		    
		}); */

	});
</script>


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
							<li class="active"><a data-toggle="tab" href="#informations"><span
									class="glyphicon glyphicon-user"></span> Informations</a></li>
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
							<div class="form-group">
								<label for="department">Department </label> <select
									id="departmentId" class="form-control">
									<c:forEach var="departmentList" items="${departments}">
										<option value="${departmentList.id}">${departmentList.departmentName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label for="position">Position </label> <select id="positionId"
									class="form-control">
									<c:forEach var="positionList" items="${positions}">
										<option value="${positionList.id}">${positionList.positionName}</option>
									</c:forEach>
								</select>
							</div>

							<div class="form-group">
								<label for="salary">Salary expected </label> <input type="text"
									class="form-control" id="salaryId" name="salaryName"
									placeholder="Enter salary">
							</div>

							<div class="form-group">
								<label for="photograph">PHOTOGRAPH</label> <input type="file"
									id="photographId" name="photographName">
								<p class="help-block">Example block-level help text here.</p>
							</div>

							<div class="form-group">
								<label for="nameTh">Name (TH) </label> <input type="text"
									class="form-control" id="nameThId" name="nameThName"
									placeholder="Enter name(TH)">
							</div>
							<div class="form-group">
								<label for="lastnameTh">Lastname (TH) </label> <input
									type="text" class="form-control" id="lastnameId"
									name="lastnameName" placeholder="Enter lastname(TH)">
							</div>
							<div class="form-group">
								<label for="nameEng">Name (ENG) </label> <input type="text"
									class="form-control" id="nameEngId" name="nameEngName"
									placeholder="Enter name(ENG)">
							</div>
							<div class="form-group">
								<label for="lastnameEng">Lastname (ENG) </label> <input
									type="text" class="form-control" id="lastnameEngId"
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
								<label for="pBirth">Place of birth </label> <input type="text"
									class="form-control" id="pBirthId" name="pBirthName"
									placeholder="Enter place of birth">
							</div>
							<div class="form-group">
								<label for="age">Age </label> <input type="text"
									class="form-control" id="ageId" name="ageName"
									placeholder="Enter age">
							</div>
							<div class="form-group">
								<label for="religion">Religion </label> <input type="text"
									class="form-control" id="religionId" name="religionName"
									placeholder="Enter religion">
							</div>
							<div class="form-group">
								<label for="idCard">ID. Card no. </label> <input type="text"
									class="form-control" id="idCardId" name="idCardName"
									placeholder="Enter ID. Card no.">
							</div>
							<div class="form-group">
								<label for="issuedCard">Issued office </label> <input
									type="text" class="form-control" id="issuedCardId"
									name="issuedCardName" placeholder="Enter issued office">
							</div>
							<div class="form-group">
								<label for="expiry">Expiry date </label> <input type="text"
									class="form-control" id="expiryId" name="expiryName"
									placeholder="Enter expiry date">
							</div>
							<div class="form-group">
								<label for="height">Height (cms) </label> <input type="text"
									class="form-control" id="heightId" name="heightName"
									placeholder="Enter height (cms)">
							</div>
							<div class="form-group">
								<label for="weight">Weight (kgs) </label> <input type="text"
									class="form-control" id="weightId" name="weightName"
									placeholder="Enter weight (kgs)">
							</div>
							<div class="form-group">
								<label for="sex">Sex </label>
								<div class="radio">
									<label><input type="radio" name="femaleName"
										id="femaleId">Female</label>
								</div>
								<div class="radio">
									<label><input type="radio" name="maleName" id="maleId">Male</label>
								</div>
							</div>

							<div class="form-group">
								<label for="sex">Marital status </label>
								<div class="radio">
									<label><input type="radio" name="singleName"
										id="singleId">Single</label>
								</div>
								<div class="radio">
									<label><input type="radio" name="marriedName"
										id="marriedId">Married</label>
								</div>
								<div class="radio">
									<label><input type="radio" name="divorcedName"
										id="divorcedId">Divorced</label>
								</div>

							</div>
							<div class="form-group">
								<label for="children">Number of children </label> <input
									type="text" class="form-control" id="childrenId"
									name="childrenName" placeholder="Enter number of children">
							</div>
							<div class="form-group">
								<label for="spouse">Spouse: Name </label> <input type="text"
									class="form-control" id="spouseId" name="spouseName"
									placeholder="Enter spouse: name">
							</div>
							<div class="form-group">
								<label for="marriageCer">Marriage certificate No </label> <input
									type="text" class="form-control" id="marriageCerId"
									name="marriageCerName"
									placeholder="Enter marriage certificate No.">
							</div>
							<div class="form-group">
								<label for="issuedMarriage">Issued office: </label> <input
									type="text" class="form-control" id="issuedMarriageId"
									name="issuedMarriageName" placeholder="Enter Issued office">
							</div>
							<div class="form-group">
								<label for="address">Address: </label> <input type="text"
									class="form-control" id="addressId" name="addressName"
									placeholder="Enter address">
							</div>
							<div class="form-group">
								<label for="occupation">Occupation: </label> <input type="text"
									class="form-control" id="occupationId" name="occupationName"
									placeholder="Enter occupation">
							</div>
							<div class="form-group">
								<label for="know">How do you know Augmentis?</label>
								<label class="checkbox-inline"><input type="checkbox" id="newspaperId" name="newspaperName" value="newspaper">Newspaper </label>
								<label class="checkbox-inline"><input type="checkbox" id="magazineId" name="magazineName" value="magazine">Magazine </label> 
								<label class="checkbox-inline"><input type="checkbox" id="websiteId" name="websiteName" value="website">Website </label>
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
