<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(document).ready(function() {

		$('.input-group.date').datepicker({
			startView : 2,
			todayBtn : "linked",
			format : "dd/mm/yyyy"

		});

		$('#buttonSave').on("click", function() {

			var inputData = {
					firstNameTH : $('#firstNameThId').val(),
					firstNameEN : $('#firstNameEngId').val(),
					lastNameTH : $('#lastnameThId').val(),
					lastNameEN : $('#lastnameEngId').val(),
					nickNameTH : $('#nickNameThId').val(),
					nickNameEN : $('#nickNameEngId').val(),
					birthDate : $('#birthdayId').val(),
					placeBirth : $('#pBirthId').val(),
					age : $('#ageId').val(),
					height : $('#heightId').val(),
					weight : $('#weightId').val(),
					sex :$('#sexId').val(),
					religion : $('#religionId').val(),
					nationality : $('#nationalityId').val(),
					tel : $('#telId').val(),
					eMail : $('#eMailId').val(),
					applyDate : $('#applyDateId').val(),
					emergencyName : $('#emergencyNameId').val(),
					emergencyTel : $('#emergencyTelId').val(),
					emergencyAddress : $('#emergencyAddressId').val(),
					noticeNewspaper : $('#newspaperId').val(),
					noticeMagazine : $('#magazineId').val(),
					noticeFriend : $('#friendId').val(),
					noticeWebSite : $('#websiteId').val(),
					noticeOther : $('#otherId').val(),
					/* position1 : $('#positionFirstId').val(),
					position2 : $('#positionSecondId').val(),
					position3 : $('#positionThirdId').val(), */
					certificate : $('#certificateId').val(),
					expectedSalary : $('#salaryId').val(),
					cardId : $('#idCardId').val(),
					cardIssuedOffice : $('#issuedCardId').val(),
					cardExpiryDate : $('#expiryId').val(),
					militaryFromYear : $('#fromYearId').val(),
					militarytoYear : $('#toYearId').val(),
					militaryPlace : $('#placeId').val(),
					militaryServiceNo : $('#serviceNoId').val(),
					militaryReason : $('#reasonsId').val(),
					militaryStatus : $('#militaryId').val(),
					marritalStatusName : $('#maritalId').val(),
					numberOfChildren : $('#childrenId').val(),
					spouseName : $('#spouseId').val(),
					marriageCertificateNo : $('#marriageCerId').val(),
					issueOficeMarriage : $('#issuedMarriageId').val(),
					marriageAddress : $('#addressId').val(),
					occupationMarriage : $('#occupationId').val(),
					branchService : $('#branchId').val()
					
			}
		var insertData = "{";
		insertData+="firstNameTH : '"+$('#firstNameThId').val()+"',";
		insertData+="firstNameEN : '"+$('#firstNameEngId').val()+"',";
		insertData+="lastNameTH : '"+$('#lastnameThId').val()+"',";
		insertData+="lastNameEN : '"+$('#lastnameEngId').val()+"',";
		insertData+="nickNameTH : '"+$('#nickNameThId').val()+"',";
		insertData+="nickNameEN : '"+$('#nickNameEngId').val()+"',";
		insertData+="birthDate : '"+$('#birthdayId').val()+"',";
		insertData+="placeBirth : '"+$('#pBirthId').val()+"',";
		insertData+="age : "+$('#ageId').val()+",";
		insertData+="height : "+$('#heightId').val()+",";
		insertData+="weight : "+$('#weightId').val()+",";
		insertData+="sex : '"+$('#sexId').val()+"',";
		insertData+="religion : '"+$('#religionId').val()+"',";
		insertData+="nationality : '"+$('#nationalityId').val()+"',";
		insertData+="tel : '"+$('#telId').val()+"',";
		insertData+="eMail : '"+$('#eMailId').val()+"',";
		insertData+="applyDate : '"+$('#applyDateId').val()+"',";
		insertData+="emergencyName : '"+$('#emergencyNameId').val()+"',";
		insertData+="emergencyTel : '"+$('#emergencyTelId').val()+"',";
		insertData+="emergencyAddress : '"+$('#emergencyAddressId').val()+"',";
		insertData+="noticeNewspaper : '"+$('#newspaperId').val()+"',";
		insertData+="noticeMagazine : '"+$('#magazineId').val()+"',";
		insertData+="noticeFriend : '"+$('#friendId').val()+"',";
		insertData+="noticeWebSite : '"+$('#websiteId').val()+"',";
		insertData+="noticeOther : '"+$('#otherId').val()+"',";
		insertData+="certificate : '"+$('#certificateId').val()+"',";
		insertData+="expectedSalary : '"+$('#salaryId').val()+"',";
		insertData+="cardId : '"+$('#idCardId').val()+"',";
		insertData+="cardIssuedOffice : '"+$('#issuedCardId').val()+"',";
		insertData+="cardExpiryDate : '"+$('#expiryId').val()+"',";
		insertData+="militaryFromYear : '"+$('#fromYearId').val()+"',";
		insertData+="militarytoYear : '"+$('#toYearId').val()+"',";
		insertData+="militaryPlace : '"+$('#placeId').val()+"',";
		insertData+="militaryServiceNo : '"+$('#serviceNoId').val()+"',";
		insertData+="militaryReason : '"+$('#reasonsId').val()+"',";
		insertData+="militaryStatus : '"+$('#militaryId').val()+"',";
		insertData+="marritalStatusName : '"+$('#maritalId').val()+"',";
		insertData+="numberOfChildren : '"+$('#childrenId').val()+"',";
		insertData+="spouseName : '"+$('#spouseId').val()+"',";
		insertData+="marriageCertificateNo : '"+$('#maritalId').val()+"',";
		insertData+="issueOficeMarriage : '"+$('#issuedMarriageId').val()+"',";
		insertData+="marriageAddress : '"+$('#addressId').val()+"',";
		insertData+="issueOficeMarriage : '"+$('#issuedMarriageId').val()+"',";
		insertData+="occupationMarriage : '"+$('#occupationId').val()+"',";
		insertData+="branchService : '"+$('#branchId').val()+"'}";
			
			$.ajax({
				contentType : "application/json",
				type : "POST",
				url : '${pageContext.request.contextPath}/save',
				data :  JSON.stringify(eval("(" + insertData + ")")),
				success : function(data) {
					alert(JSON.stringify(data));
				}
			});	
			
			
			

		})

	});
</script>

<div class="container">
	<form role="form" id="applicationForm">
		<div class="form-group">
			<ul class="nav nav-tabs" role="navigation">

				<li class="active"><a data-toggle="tab" href="#informations" ><span
						class="glyphicon glyphicon-user"></span> Informations</a></li>
				<li><a data-toggle="tab" href="#application"><span
						class="glyphicon glyphicon-home"></span> Application</a></li>
				<li><a data-toggle="tab" href="#address"><span
						class="glyphicon glyphicon-home"></span> Address</a></li>
				<li><a data-toggle="tab" href="#educations"><span
						class="glyphicon glyphicon-education"></span> Educations</a></li>
				<li><a data-toggle="tab" href="#experiences"><span
						class="glyphicon glyphicon-file"></span> Experiences</a></li>
			</ul>
		</div>

		<div class="tab-content">
			<!-- tab informations -->
			<div id="informations" class="tab-pane fade in active">
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<div class="row">
								<div class="col-md-6">
									<!-- <img src="..." class="img-thumbnail" width="304" height="236"> -->
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="photograph">PHOTOGRAPH</label> <input type="file"
								id="photographId" name="photographName">
							<p class="help-block">Block-level help text here.</p>
						</div>

						<div class="form-group">
							<label for="firstNameTh">Firstname (TH) </label> <input
								type="text" class="form-control" id="firstNameThId"
								name="firstNameThName" placeholder="Enter Firstname(TH)">
						</div>
						<div class="form-group">
							<label for="lastnameTh">Lastname (TH) </label> <input type="text"
								class="form-control" id="lastnameThId" name="lastnameThName"
								placeholder="Enter lastname(TH)">
						</div>
						<div class="form-group">
							<label for="nickNameTh">Nickname (TH) </label> <input type="text"
								class="form-control" id="nickNameThId" name="nickNameThName"
								placeholder="Enter nickname(TH)">
						</div>

						<div class="form-group">
							<label for="firstNameEng">Firstname (ENG) </label> <input
								type="text" class="form-control" id="firstNameEngId"
								name="firstNameEngName" placeholder="Enter Firstname(ENG)">
						</div>
						<div class="form-group">
							<label for="lastnameEng">Lastname (ENG) </label> <input
								type="text" class="form-control" id="lastnameEngId"
								name="lastnameEngName" placeholder="Enter lastname(ENG)">
						</div>
						<div class="form-group">
							<label for="nickNameEng">Nickname (Eng) </label> <input
								type="text" class="form-control" id="nickNameEngId"
								name="nickNameEngName" placeholder="Enter nickname(Eng)">
						</div>
						<div class="form-group">
							<label for="tel">TELEPHONE NO. </label> <input type="text"
								class="form-control" id="telId" name="telName"
								placeholder="Enter tel">
						</div>

						<div class="form-group">
							<label for="eMail">E-Mail </label> <input type="e"
								class="form-control" id="eMailId" name="eMailName"
								placeholder="Enter E-Mail">
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
							<label for="nationality">Nationality </label> <input type="text"
								class="form-control" id="nationalityId" name="nationalityName"
								placeholder="Enter nationality">
						</div>


						<div class="form-group">
							<label for="idCard">ID. Card no. </label> <input type="text"
								class="form-control" id="idCardId" name="idCardName"
								placeholder="Enter ID. Card no.">
						</div>
						<div class="form-group">
							<label for="issuedCard">Issued office </label> <input type="text"
								class="form-control" id="issuedCardId" name="issuedCardName"
								placeholder="Enter issued office">
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
								<label><input type="radio" name="sexName" value="Female" id="sexId">Female</label>
							</div>
							<div class="radio">
								<label><input type="radio" name="sexName" value="Male" id="sexId">Male</label>
							</div>
						</div>

						<div class="form-group">
							<label for="marital">Marital status </label>
							<div class="radio">
								<label><input type="radio" name="maritalName"
									id="maritalId" value="Single">Single</label>
							</div>
							<div class="radio">
								<label><input type="radio" name="maritalName"
									id="maritalId" value="Married">Married</label>
							</div>
							<div class="radio">
								<label><input type="radio" name="maritalName"
									id="maritalId">Divorced</label>
							</div>

						</div>

						<div class="form-group">
							<label for="children">Number of children </label> <input
								type="text" class="form-control" id="childrenId"
								name="childrenName" placeholder="Enter number of children">
						</div>
					</div>
					<div class="col-md-6">
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
								class="form-control" rows="5" id="addressId" name="addressName"
								placeholder="Enter address">
						</div>
						<div class="form-group">
							<label for="occupation">Occupation: </label> <input type="text"
								class="form-control" id="occupationId" name="occupationName"
								placeholder="Enter occupation">
						</div>

						<div class="form-group">
							<label for="military">Have you ever served in the
								military service? </label>
							<div class="radio">
								<label><input type="radio" name="militaryName"
									id="militaryId">Yes</label>
							</div>
							<div class="radio">
								<label><input type="radio" name="militaryName"
									id="militaryId">No</label>
							</div>

							<div class="form-group">
								<label for="militaryComplete">If yes, please complete
									the blanks below </label> <label for="fromYear">From year </label> <input
									type="text" class="form-control" id="fromYearId"
									name="fromYearName" placeholder="Enter from year">
							</div>
							<div class="form-group">
								<label for="toYear">To year </label> <input type="text"
									class="form-control" id="toYearId" name="toYearName"
									placeholder="Enter to year">
							</div>

							 <div class="form-group">
								<label for="branch">Branch of service </label> <input
									type="text" class="form-control" id="branchId"
									name="branchName" placeholder="Enter branch of service">
							</div>

							<div class="form-group">
								<label for="serviceNo">Service no </label> <input type="text"
									class="form-control" id="serviceNoId" name="serviceNoName"
									placeholder="Enter Service no">
							</div>

							<div class="form-group">
								<label for="reasons">If not, please state the reasons </label> <input
									type="text" class="form-control" id="reasonsId"
									name="reasonsName"
									placeholder="Enter If not, please state the reasons">
							</div>

							 <div class="form-group">
							<label for="drafted"><span
								class="glyphicon glyphicon-calendar"></span>Date to be drafted</label>
							<div class="input-group date">
								<input type="text" id="draftedId" name="draftedName"
									class="form-control"><span class="input-group-addon"><i
									class="glyphicon glyphicon-th"></i></span>
							</div>

						</div>

						<div class="form-group">
							<label for="informationFamily">Information regarding
								family (Including Parents Brothers and Sisters) </label>
							<div class="form-group">
								<label for="itemNoFirst">1) Item No. </label> <input type="text"
									class="form-control" id="itemNoFirstId" name="itemNoFirstName"
									placeholder="Enter Item No.">
							</div>

							<div class="form-group">
								<label for="nameFamilyFirst">Name </label> <input type="text"
									class="form-control" id="nameFamilyFirstId"
									name="nameFamilyFirstName" placeholder="Enter name">
							</div>

							<div class="form-group">
								<label for="relationFamilyFirst">Relation </label> <input
									type="text" class="form-control" id="relationFamilyFirstId"
									name="relationFamilyFirstName" placeholder="Enter relation">
							</div>
							<div class="form-group">
								<label for="occupationFamilyFirst">Occupation </label> <input
									type="text" class="form-control" id="occupationFamilyFirstId"
									name="occupationFamilyFirstName"
									placeholder="Enter occupation ">
							</div>

							<div class="form-group">
								<label for="addressFamilyFirst">Address </label> <input
									type="textarea" class="form-control" id="addressFamilyFirstId"
									name="addressFamilyFirstName" placeholder="Enter address ">
							</div>

							<div class="form-group">
								<label for="positionFamilyFirst">Position </label> <input
									type="text" class="form-control" id="positionFamilyFirstId"
									name="positionFamilyFirstName" placeholder="Enter position">
							</div>
							<div class="form-group">
								<label for="itemNoSecond">2) Item No. </label> <input
									type="text" class="form-control" id="itemNoSecondId"
									name="itemNoSecondName" placeholder="Enter Item No.">
							</div>

							<div class="form-group">
								<label for="nameFamilySecond">Name </label> <input type="text"
									class="form-control" id="nameFamilySecondId"
									name="nameFamilySecondName" placeholder="Enter name">
							</div>

							<div class="form-group">
								<label for="relationFamilySecond">Relation </label> <input
									type="text" class="form-control" id="relationFamilySecondId"
									name="relationFamilySecondName" placeholder="Enter relation">
							</div>
							<div class="form-group">
								<label for="occupationFamilySecond">Occupation </label> <input
									type="text" class="form-control" id="occupationFamilySecondId"
									name="occupationFamilySecondName"
									placeholder="Enter occupation ">
							</div>

							<div class="form-group">
								<label for="addressFamilySecond">Address </label> <input
									type="textarea" class="form-control" id="addressFamilySecondId"
									name="addressFamilySecondName" placeholder="Enter address ">
							</div>

							<div class="form-group">
								<label for="positionFamilySecond">Position </label> <input
									type="text" class="form-control" id="positionFamilySecondId"
									name="positionFamilySecondName" placeholder="Enter position">
							</div>
						</div>
					</div>
				</div>
			</div>


			<!-- tab application -->
			<div id="application" class="tab-pane fade">

				<label for="applyDate"><span
					class="glyphicon glyphicon-calendar"></span>Apply date</label>
				<div class="input-group date">
					<input type="text" id="applyDateId" name="applyDateName"
						class="form-control"><span class="input-group-addon"><i
						class="glyphicon glyphicon-th"></i></span>
				</div>


				<div class="form-group">
					<label for="department">Department </label> <select
						id="departmentId" class="form-control">
						<c:forEach var="departmentList" items="${departments}">
							<option value="${departmentList.id}">${departmentList.departmentName}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="positionFirst">Position 1 </label> <select
						id="positionFirstId" name="positionFirstName" class="form-control">
						<c:forEach var="positionList" items="${positions}">
							<option value="${positionList.id}">${positionList.positionName}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="positionSecond">Position 2 </label> <select
						id="positionSecondId" name="positionSecondName"
						class="form-control">
						<c:forEach var="positionList" items="${positions}">
							<option value="${positionList.id}">${positionList.positionName}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="positionThird">Position 3 </label> <select
						id="positionThirdId" name="positionThirdName" class="form-control">
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
					<label for="knowAugmentis">How do you know Augmentis?</label> <br>
					<label class="checkbox">
					<input type="checkbox" id="newspaperId" name="newspaperName" value="newspaper">Newspaper</label>
					<label class="checkbox"><input type="text" class="form-control" name="newspaper" placeholder="newspaper">
					<input type="checkbox" id="magazineId" name="magazineName" value="magazine">Magazine</label> <input type="text" class="form-control" name="magazine" placeholder="magazine">
					<label class="checkbox"><input type="checkbox" id="websiteId" name="websiteName" value="website">Website</label> <input type="text" class="form-control" name="website" placeholder="website">
					<label class="checkbox"><input type="checkbox" id="friendId" name="friendName" value="friend">Friend </label> <input type="text" class="form-control" name="friend" placeholder="friend">
					<label class="checkbox"><input type="checkbox" id="otherId" name="otherName" value="other">Other (please specify) </label>
					<input type="text" class="form-control" id="otherTextId" name="otherTextName" placeholder="Enter other (please specify)">
				</div>

				<div class="form-group">
					<label for="knowEmployed">Do you know anyone now being
						employed by this company? </label>
					<div class="radio">
						<label><input type="radio" name="knowEmployedName" id="knowEmployedId" value="Yes">Yes</label>
					</div>
					<div class="radio">
						<label><input type="radio" name="knowEmployedName" id="knowEmployedId" value="No">No</label>
					</div>
					<div class="form-group">
						<label for="nameRelation">If yes, please write name,
							position and relation </label><br>
							<lable for="nameRelation">Name </lable> <input type="text" class="form-control"
							id="nameRelationId" name="nameRelationName"
							placeholder="Enter name">
							<lable for="positionRelation">Position </lable> <input type="text" class="form-control"
							id="positionRelationId" name="positionRelationName"
							placeholder="Enter position">
							<lable for="employedRelation">Relation </lable> <input type="text" class="form-control"
							id="employedRelationId" name="employedRelationName"
							placeholder="Enter relation">
					</div>
				</div>

			</div>



			<!-- tab address -->
			<div id="address" class="tab-pane fade">

				<label for="presentAddress">Present address </label>
				<div class="form-group">
					<label for="presentHouseNo">House No </label> <input type="text"
						class="form-control" id="presentHouseNoId"
						name="presentHouseNoName" placeholder="Enter House No">
				</div>
				<div class="form-group">
					<label for="presentRoad">Road </label> <input type="text"
						class="form-control" id="presentRoadId" name="presentRoadName"
						placeholder="Enter road">
				</div>
				<div class="form-group">
					<label for="presentDistrict">District </label> <input type="text"
						class="form-control" id="presentDistrictId"
						name="presentDistrictName" placeholder="Enter district">
				</div>
				<div class="form-group">
					<label for="presentSubDistrict">Sub District </label> <input
						type="text" class="form-control" id="presentSubDistrictId"
						name="presentSubDistrictName" placeholder="Enter sub district">
				</div>
				<div class="form-group">
					<label for="presentZipcode">Zipcode </label> <input type="text"
						class="form-control" id="presentZipcodeId"
						name="presentZipcodeName" placeholder="Enter zipcode">
				</div>
				<div class="form-group">
					<label for="presentProvince">Province </label> <input type="text"
						class="form-control" id="presentProvinceId"
						name="presentProvinceName" placeholder="Enter province">
				</div>
				<label for="permanentAddress">Permanent address </label>
				<div class="form-group">
					<label for="permanentHouseNo">House No </label> <input type="text"
						class="form-control" id="permanentHouseNoId"
						name="permanentHouseNoName" placeholder="Enter House No">
				</div>
				<div class="form-group">
					<label for="permanentRoad">Road </label> <input type="text"
						class="form-control" id="permanentRoadId" name="permanentRoadName"
						placeholder="Enter road">
				</div>
				<div class="form-group">
					<label for="permanentDistrict">District </label> <input type="text"
						class="form-control" id="permanentDistrictId"
						name="permanentDistrictName" placeholder="Enter district">
				</div>
				<div class="form-group">
					<label for="permanentSubDistrict">Sub District </label> <input
						type="text" class="form-control" id="permanentSubDistrictId"
						name="permanentSubDistrictName" placeholder="Enter sub district">
				</div>
				<div class="form-group">
					<label for="permanentZipcode">Zipcode </label> <input type="text"
						class="form-control" id="permanentZipcodeId"
						name="permanentZipcodeName" placeholder="Enter zipcode">
				</div>
				<div class="form-group">
					<label for="permanentProvince">Province </label> <input type="text"
						class="form-control" id="permanentProvinceId"
						name="permanentProvinceName" placeholder="Enter province">
				</div>

				<label for="emergency">In case of emergency , notify , (
					Name , Address and Telephone ) </label>
				<div class="form-group">
					<label for="emergencyOfName">Emergency Name </label> <input
						type="text" class="form-control" id="emergencyNameId"
						name="emergencyName" placeholder="Enter emergency name">
				</div>
				<div class="form-group">
					<label for="emergencyAddress">Emergency Address </label> <input
						type="textarea" class="form-control" id="emergencyAddressId"
						name="emergencyAddressName" placeholder="Enter emergency address">
				</div>

				<div class="form-group">
					<label for="emergencyTel">Emergency Telephone </label> <input
						type="text" class="form-control" id="emergencyTelId"
						name="emergencyTelName" placeholder="Enter emergency tel">
				</div>



			</div>
			<!-- tab educations -->
			<div id="educations" class="tab-pane fade">
				<div class="form-group">
					<label for="university">University </label> <input type="text"
						class="form-control" id="universityId" name="universityName"
						placeholder="Enter university">
				</div>

				<div class="form-group">
					<label for="degree">Degree </label> <input type="text"
						class="form-control" id="degreeId" name="degreeName"
						placeholder="Enter degree">
				</div>

				<div class="form-group">
					<label for="faculty">Faculty </label> <input type="text"
						class="form-control" id="facultyId" name="facultyName"
						placeholder="Enter faculty">
				</div>
				<div class="form-group">
					<label for="major">Major </label> <input type="text"
						class="form-control" id="majorId" name="majorName"
						placeholder="Enter major">
				</div>
				<div class="form-group">
					<label for="gpa">GPA </label> <input type="text"
						class="form-control" id="gpaId" name="gpaName"
						placeholder="Enter GPA">
				</div>

				<div class="form-group">
					<label for="graduate">Years of graduate </label> <input type="text"
						class="form-control" id="graduateId" name="graduateName"
						placeholder="Enter years of graduate">
				</div>
				<div class="form-group">
					<label for="certificate">Certificate </label> <input type="text"
						class="form-control" id="certificateId" name="certificateName"
						placeholder="Enter certificate">
				</div>

				<div class="form-group">
					<label for="resume">Resume</label> <input type="file" id="resumeId"
						name="resumeName">
					<p class="help-block">Block-level help text here.</p>
				</div>

				<div class="form-group">
					<label for="transcript">Transcript</label> <input type="file"
						id="transcriptId" name="transcriptName">
					<p class="help-block">Block-level help text here.</p>
				</div>

				<div class="form-group">
					<label for="skill">Skill Detail </label> <input type="text"
						class="form-control" id="skillId" name="skillName"
						placeholder="Enter skill detail">
				</div>

			</div>


			<!-- tab experiences -->
			<div id="experiences" class="tab-pane fade">
				<div class="form-group">
					<label for="previousEmployers">May inquiry be made of your
						previous employers regarding your character, qualification record
						of employment? </label>
					<div class="radio">
						<label><input type="radio" name="previousEmployersName"
							id="previousEmployersId" value="Yes">Yes</label>
					</div>
					<div class="radio">
						<label><input type="radio" name="previousEmployersName"
							id="previousEmployersId" value="No">No</label>
					</div>
					<div class="form-group">
						<label for="giveReason">If not, please give the reason </label> <input
							type="text" class="form-control" id="giveReasonId"
							name="giveReasonName"
							placeholder="Enter If not, please give the reason">
					</div>
				</div>
				<div class="form-group">
					<label for="reference">REFERENCE: List three persons OTHER
						THAN YOUR RELATIVE OR FORMER EMPLOYER who have definite knowledge
						of your qualifications and your conducts. </label>
					<div class="form-group">
						<label for="fullNameFrist">1.FULL NAME </label> <input type="text"
							class="form-control" id="fullNameFristId"
							name="fullNameFristName" placeholder="Enter FULL NAME">
					</div>
					<div class="form-group">
						<label for="completeAddressFrist">COMPLETE ADDRESS. </label> <input
							type="text" class="form-control" id="completeAddressFristId"
							name="completeAddressFristName"
							placeholder="Enter COMPLETE ADDRESS.">
					</div>
					<div class="form-group">
						<label for="telNoFrist">TELEPHONE NO. </label> <input type="text"
							class="form-control" id="telNoFristId" name="telNoFristName"
							placeholder="Enter TELEPHONE NO.">
					</div>
					<div class="form-group">
						<label for="occupationRef">OCCUPATION </label> <input type="text"
							class="form-control" id="occupationRefFristId"
							name="occupationRefFristName" placeholder="Enter OCCUPATION ">
					</div>

					<div class="form-group">
						<label for="fullNameSecond">2.FULL NAME </label> <input
							type="text" class="form-control" id="fullNameSecondId"
							name="fullNameSecondName" placeholder="Enter FULL NAME">
					</div>
					<div class="form-group">
						<label for="completeAddressSecond">COMPLETE ADDRESS. </label> <input
							type="text" class="form-control" id="completeAddressSecondId"
							name="completeAddressSecondName"
							placeholder="Enter COMPLETE ADDRESS.">
					</div>
					<div class="form-group">
						<label for="telNoSecond">TELEPHONE NO. </label> <input type="text"
							class="form-control" id="telNoSecondId" name="telNoSecondName"
							placeholder="Enter TELEPHONE NO.">
					</div>
					<div class="form-group">
						<label for="occupationRefSecond">OCCUPATION </label> <input
							type="text" class="form-control" id="occupationRefSecondId"
							name="occupationRefSecondName" placeholder="Enter OCCUPATION ">
					</div>

				</div>

				<div class="form-group">
					<label for="experiences">Experiences (start with your
						present or last position of work background) </label>
					<div class="form-group">
						<label for="workBackground">1) Present or last position </label> <input
							type="text" class="form-control" id="workBackgroundId"
							name="workBackgroundName"
							placeholder="Enter present or last position ">
					</div>

					<div class="form-group">
						<label for="fromWorkYear">From (month, year) </label> <input
							type="text" class="form-control" id="fromWorkYearId"
							name="fromWorkYearName" placeholder="Enter from (month, year)">
					</div>

					<div class="form-group">
						<label for="toWorkYear">To (month, year) </label> <input
							type="text" class="form-control" id="toWorkYearId"
							name="toWorkYearName" placeholder="Enter to (month, year)">
					</div>
					<div class="form-group">
						<label for="emp">Employer Name </label> <input type="text"
							class="form-control" id="empId" name="empName"
							placeholder="Enter employer name ">
					</div>

					<div class="form-group">
						<label for="addressBackground">Address </label>
						<textarea class="form-control" rows="5" id="addressBackgroundId"
							name="addressBackgroundName" placeholder="Enter address"></textarea>

					</div>

					<div class="form-group">
						<label for="business">Type of business </label> <input type="text"
							class="form-control" id="businessId" name="businessName"
							placeholder="Enter type of business ">
					</div>

					<div class="form-group">
						<label for="positionBackground">Position </label> <input
							type="text" class="form-control" id="positionBackgroundId"
							name="positionBackgroundName" placeholder="Enter position ">
					</div>

					<div class="form-group">
						<label for="supervisorBackground">Supervisor </label> <input
							type="text" class="form-control" id="supervisorBackgroundId"
							name="supervisorBackgroundName" placeholder="Enter supervisor">
					</div>

					<div class="form-group">
						<label for="salaryBackground">Salary ,Wages </label> <input
							type="text" class="form-control" id="salaryBackgroundId"
							name="salaryBackgroundName" placeholder="Enter salary ,wages ">
					</div>

					<div class="form-group">
						<label for="descriptionBackground">Description of duties
							and responsibilities </label>
						<textarea class="form-control" rows="5"
							id="descriptionBackgroundId" name="descriptionBackgroundName"
							placeholder="Enter description of duties and responsibilities"></textarea>
					</div>

					<div class="form-group">
						<label for="reasonLeaving">Reason for leaving </label>
						<textarea class="form-control" rows="5" id="reasonLeavingId"
							name="reasonLeavingName" placeholder="Enter reason for leaving"></textarea>

					</div>

				</div>
				<button type="button" class="btn btn-success" id="buttonSave">
					<span class="glyphicon glyphicon-off"></span> Save
				</button>
					<button type="button" class="btn btn-default" id="buttonCancel"> Cancel
				</button>
			</div>
		</div>
	</form>
</div>
