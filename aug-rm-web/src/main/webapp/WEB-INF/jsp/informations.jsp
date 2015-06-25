<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
 	$(document).ready(function() {
			$('.input-group.date').datepicker({startView : 2,
 							todayBtn : "linked",
 							format : "dd/mm/yyyy"

 						});
			
			 $('#infoForm').validate({
				rules : {imageMultipartFile : { required : true },
					firstNameTH : { required : true },
					lastNameTH : { required : true },
					nickNameTH : {
						required : true
					},
					firstNameEN : {
						required : true
					},
					lastNameEN : {
						required : true
					},
					nickNameEN : {
						required : true
					},
					tel : {
						required : true
					},
					email : {
						required : true
					},
					birthDate : {
						required : true
					},
					placeBirth : {
						required : true
					},
					age : {
						required : true
					},
					religion : {
						required : true
					},
					nationality : {
						required : true
					},
					cardId : {
						required : true
					},
					cardIssuedOffice : {
						required : true
					},
					cardExpiryDate : {
						required : true
					},
					height : {
						required : true
					},
					weight : {
						required : true
					},
					sex : {
						required : true
					},
					applicantStatus : {
						required : true
					},
					numberOfChildren : {
						required : true
					},
					spouseName : {
						required : true
					},
					marriageCertificateNo : {
						required : true
					},
					issueOficeMarriage : {
						required : true
					},
					marriageAddress : {
						required : true
					},
					occupationMarriage : {
						required : true
					},
					militaryStatus : {
						required : true
					},
					militaryFromYear : {
						required : true
					},
					militarytoYear : {
						required : true
					},
					branchService : {
						required : true
					},
					militaryPlace : {
						required : true
					},
					militaryServiceNo : {
						required : true
					},
					militaryReason : {
						required : true
					},
					dateToBeDrafted : {
						required : true
					},
					previousEmployers : {
 						required : true
 					},
 					giveReasonName : {
 						required : true
 					},emergencyName : {
 						required : true
 					},
 					emergencyTelName : {
 						required : true
 					},
 					emergencyAddressName : {
 						required : true
 					},
 					applyDateName : {
 						required : true
 					},
 					departmentName : {
 						required : true
 					},
 					positionFirstName : {
 						required : true
 					},
 					positionSecondName : {
 						required : true
 					},
 					positionThirdName : {
 						required : true
 					},
 					salaryName : {
 						required : true
 					},
 					knowEmployedName : {
 						required : true
 					},
 					nameRelationName : {
 						required : true
 					},
 					positionRelationName : {
 						required : true
 					},
 					employedRelationName : {
 						required : true
 					}
				},
				messages : {
					imageMultipartFile : {
						required : "Photograph is required!"
					},
					firstNameTH : {
						required : "Firstname Thai is required!"
					},
					lastNameTH : {
						required : "Lastname Thai is required"
					},
					nickNameTH : {
						required : "Nickname Thai is required!"
					},
					firstNameEN : {
						required : "Firstname English is required!"
					},
					lastNameEN : {
						required : "Lastname English is required!"
					},
					nickNameEN : {
						required : "Nickname English is required!"
					},
					tel : {
						required : "Tel. is required!"
					},
					email : {
						required : "E-Mail is required!"
					},
					birthDate : {
						required : "Birthday is required!"
					},
					placeBirth : {
						required : "Place of birth is required!"
					},
					age : {
						required : "Age is required!"
					},
					religion : {
						required : "Religion is required!"
					},
					nationality : {
						required : "Nationality is required!"
					},
					cardId : {
						required : "ID. Card no. is required!"
					},
					cardIssuedOffice : {
						required : "Issued office is required!"
					},
					cardExpiryDate : {
						required : "Expiry date is required!"
					},
					height : {
						required : "Height is required!"
					},
					weight : {
						required : "Weight is required!"
					},
					sex : {
						required : "Sex is required!"
					},
					applicantStatus : {
						required : "Marital status is required!"
					},
					numberOfChildren : {
						required : "Number of children is required!"
					},spouseName : {
						required : "Spouse: Name is required!"
					},
					marriageCertificateNo : {
						required : "Marriage certificate No. is required!"
					},
					issueOficeMarriage : {
						required : "Issued office is required!"
					},
					marriageAddress : {
						required : "Address is required!"
					},
					occupationMarriage : {
						required : "Occupation is required!"
					},
					militaryStatus : {
						required : "Military service is required!"
					},
					militaryFromYear : {
						required : "From year is required!"
					},
					militarytoYear : {
						required : "To year is required!"
					},
					branchService : {
						required : "Branch of service is required!"
					},
					militaryPlace : {
						required : "Military place is required!"
					},
					militaryServiceNo : {
						required : "Service No. is required!"
					},
					militaryReason : {
						required : "Reasons is required!"
					},
					dateToBeDrafted : {
						required : "Date to be drafted is required!"
					},emergencyName : {
						required : "Emergency Name is required!"
					},
					emergencyTelName : {
						required : "Emergency Telephone is required!"
					},
					emergencyAddressName : {
						required : "Emergency Address is required!"
					},applyDateName : {
						required : "Apply date is required!"
					},
					departmentName : {
						required : "Department is required!"
					},
					positionFirstName : {
						required : "Position 1 is required!"
					},
					positionSecondName : {
						required : "Position 2 is required!"
					},
					positionThirdName : {
						required : "Position 3 is required!"
					},
					salaryName : {
						required : "Salary expected is required!"
					},
					knowEmployedName : {
						required : "Do you know anyone now being employed by this company? is required!"
					},
					nameRelationName : {
						required : "Name is required!"
					},
					positionRelationName : {
						required : "Position is required!"
					},
					employedRelationName : {
						required : "Relation is required!"
					}
					
				}
			});

		//Find by Id
		function findById(id){
			$.ajax({
				url : "${pageContext.request.contextPath}/findByIdApplication/" + id,
				type : "POST",
				success : function(data){
					showFillData(data);
				}
			});
		}
		
		//Show data on inputField
		function showFillData(data){
			$("#firstNameThId").val(data.firstNameTH);
			$("#firstNameEngId").val(data.firstNameEN);
			$("#lastnameThId").val(data.lastNameTH);
			$("#lastnameEngId").val(data.lastNameEN);
			$("#nickNameThId").val(data.nickNameTH);
			
			$("#nickNameEngId").val(data.nickNameEN);
			$("#birthdayId").val(data.birthDate);
			$("#pBirthId").val(data.placeBirth);
			$("#ageId").val(data.age);
			$("#heightId").val(data.height);
			
			$("#weightId").val(data.weight);
			$("#sex").val(data.sex);
			$("#religionId").val(data.religion);
			$("#nationalityId").val(data.nationality);
			$("#telId").val(data.tel);
			
			$("#eMailId").val(data.email);
			$("#applyDateId").val(data.applyDate);
			$("#emergencyNameId").val(data.emergencyName);
			$("#emergencyTelId").val(data.emergencyTel);
			$("#emergencyAddressId").val(data.emergencyAddress);
			
			$("#newspaperId").val(data.noticeNewspaper);
			$("#magazineId").val(data.noticeMagazine);
			$("#friendId").val(data.noticeFriend);
			$("#websiteId").val(data.noticeWebSite);
			$("#otherId").val(data.noticeOther);
			
			$("#certificateId").val(data.certificate);
			$("#salaryId").val(data.expectedSalary);
			$("#idCardId").val(data.cardId);
			$("#issuedCardId").val(data.cardIssuedOffice);
			$("#expiryId").val(data.cardExpiryDate);
			
			$("#fromYearId").val(data.militaryFromYear);
			$("#toYearId").val(data.militarytoYear);
			$("#placeId").val(data.militaryPlace);
			$("#serviceNoId").val(data.militaryServiceNo);
			$("#reasonsId").val(data.militaryReason);
			
			$("#militaryId").val(data.militaryStatus);
			$("#maritalId").val(data.marritalStatusName);
			$("#childrenId").val(data.numberOfChildren);
			$("#spouseId").val(data.spouseName);
			$("#marriageCerId").val(data.marriageCertificateNo);
			
			$("#issuedMarriageId").val(data.issueOficeMarriage);
			$("#addressId").val(data.marriageAddress);
			$("#occupationId").val(data.occupationMarriage);
			$("#branchId").val(data.branchService);
			$("#draftedId").val(data.dateToBeDrafted);
		}
		
		//Update function
		function updateUser(){
// 			var id = $(button).data("id");
			var id = '${id}';
			var firstNameTh = $("#firstNameThId").val();
			var firstNameEn = $('#firstNameEngId').val();
			var lastNameTh = $("#lastnameThId").val();
			var lastNameEn = $("#lastnameEngId").val();
			var nickNameTh = $("#nickNameThId").val();
			
			var nickNameEn = $("#nickNameEngId").val();
			var birthday = $('#birthdayId').val();
			var pBirthday = $("#pBirthId").val();
			var age = $("#ageId").val();
			var height = $("#heightId").val();
			
			var weight = $("#weightId").val();
			var sex = $('input[name="sex"]:checked').val();
			var religion = $("#religionId").val();
			var nationality = $("#nationalityId").val();
			var tel = $("#telId").val();
			
			var eMail = $("#eMailId").val();
			var applyDate = $('#applyDateId').val();
			var emergencyName = $("#emergencyNameId").val();
			var emergencyTel = $("#emergencyTelId").val();
			var emergencyAddress = $("#emergencyAddressId").val();
			
			var newspaper = $("#newspaperId").val();
			var magazine = $('#magazineId').val();
			var friend = $("#friendId").val();
			var website = $("#websiteId").val();
			var other = $("#otherId").val();
			
			var certificate = $("#certificateId").val();
			var salary = $('#salaryId').val();
			var idCard = $("#idCardId").val();
			var issuedCard = $("#issuedCardId").val();
			var expiry = $("#expiryId").val();
			
			var militaryFromYear = $("#fromYearId").val();
			var militaryToYear = $('#toYearId').val();
			var place = $("#placeId").val();
			var serviceNo = $("#serviceNoId").val();
			var reason = $("#reasonsId").val();
			
			var military = $("#militaryId").val();
			var marital = $('#maritalId').val();
			var children = $("#childrenId").val();
			var spouse = $("#spouseId").val();
			var marriageCer = $("#marriageCerId").val();
			
			var issuedMarriage = $("#issuedMarriageId").val();
			var address = $('#addressId').val();
			var occupation = $("#occupationId").val();
			var branch = $("#branchId").val();
			var drafted = $('#draftedId').val();

			var json = {
					"id" : id,
					"firstNameTH" : firstNameTh,
					"firstNameEN" : firstNameEn,
					"lastNameTH" : lastNameTh,
					"lastNameEN" : lastNameEn,
					"nickNameTH" : nickNameTh,
					
					"nickNameEN" : nickNameEn,
					"birthDate" : birthday,
					"placeBirth" : pBirthday,
					"age" : age,
					"height" : height,
					
					"weight" : weight,
					"sex" : sex,
					"religion" : religion,
					"nationality" : nationality,
					"tel" : tel,
					
					"email" : eMail,
					"applyDate" : applyDate,
					"emergencyName" : emergencyName,
					"emergencyTel" : emergencyTel,
					"emergencyAddress" : emergencyAddress,
					
					"noticeNewspaper" : newspaper,
					"noticeMagazine" : magazine,
					"noticeFriend" : friend,
					"noticeWebSite" : website,
					"noticeOther" : other,
					
					"certificate" : certificate,
					"expectedSalary" : salary,
					"cardId" : idCard,
					"cardIssuedOffice" : issuedCard,
					"cardExpiryDate" : expiry,
					
					"militaryFromYear" : militaryFromYear,
					"militarytoYear" : militaryToYear,
					"militaryPlace" : place,
					"militaryServiceNo" : serviceNo,
					"militaryReason" : reason,
					
					"militaryStatus" : military,
					"marritalStatusName" : marital,
					"numberOfChildren" : children,
					"spouseName" : spouse,
					"marriageCertificateNo" : marriageCer,
					
					"issueOficeMarriage" : issuedMarriage,
					"marriageAddress" : address,
					"occupationMarriage" : occupation,
					"branchService" : branch,
					"dateToBeDrafted" : drafted
					};
			
			$.ajax({
				url : "${pageContext.request.contextPath}/informations/"+id,
				type : "POST",
				contentType :"application/json; charset=utf-8",
				data : JSON.stringify(json),
				success : function(data){
						new PNotify({
						    title: 'Edit Success',
						    text: 'You can edit data',
						    type: 'success',
						    nonblock: {
						        nonblock: true,
						        nonblock_opacity: .2
						    }
						});
				 }
			});
		}
		
		var applicantId = '${id}';
		if(applicantId != null){
			findById('${id}');
			$('#buttonSave').off('click').on('click', function(id){
				updateUser();
			});
			
		}else{
			$('#informationForm')[0].reset();
			$('#buttonSave').off('click').on('click', function(){
				saveUser();
			});
		}
});

</script>
<jsp:include page="applicationMenu.jsp" />
<!-- tab informations -->
<f:form id="informationApplicant" name="informationApplicant" action="${pageContext.request.contextPath}/saveInformations"
		modelAttribute="applicant" method="post" enctype="multipart/form-data" class="form-inline" >
	<div class="row">
			<div class="col-md-6">
	<%-- <div class="form-group">
				<input type="hidden" id="applicant" name="applicant"
					value="${id}">
	</div> --%>
		  <div class="form-group">
				PHOTOGRAPH 
				<div id="imagePreview "></div>
				<input type="file" name="imageMultipartFile" id="imageMultipartFile"><br><br>
		</div> 
		<br>
		<br>
			<div class="form-group">
				<label for="firstNameTh">Firstname (TH) </label> <input type="text"
					class="form-control" id="firstNameTH" name="firstNameTH"
					placeholder="Enter Firstname(TH)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="lastnameTh">Lastname (TH) </label> <input type="text"
					class="form-control" id="lastNameTH" name="lastNameTH"
					placeholder="Enter lastname(TH)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="nickNameTh">Nickname (TH) </label> <input type="text"
					class="form-control" id="nickNameTH" name="nickNameTH"
					placeholder="Enter nickname(TH)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="firstNameEng">Firstname (ENG) </label> <input
					type="text" class="form-control" id="firstNameEN"
					name="firstNameEN" placeholder="Enter Firstname(ENG)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="lastnameEng">Lastname (ENG) </label> <input type="text"
					class="form-control" id="lastNameEN" name="lastNameEN"
					placeholder="Enter lastname(ENG)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="nickNameEng">Nickname (Eng) </label> <input type="text"
					class="form-control" id="nickNameEN" name="nickNameEN"
					placeholder="Enter nickname(Eng)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="tel">TELEPHONE NO. </label> <input type="text"
					class="form-control" id="tel" name="tel"
					placeholder="Enter tel">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="eMail">E-Mail </label> <input type="e"
					class="form-control" id="email" name="email"
					placeholder="Enter E-Mail">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="birthday"><span
					class="glyphicon glyphicon-calendar"></span> Birthday</label>
				<div class="input-group date">
					<input type="text" id="birthDate" name="birthDate"
						class="form-control"><span class="input-group-addon"><i
						class="glyphicon glyphicon-th"></i></span>
				</div>

			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="pBirth">Place of birth </label> <input type="text"
					class="form-control" id="placeBirth" name="placeBirth"
					placeholder="Enter place of birth">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="age">Age </label> <input type="text"
					class="form-control" id="age" name="age"
					placeholder="Enter age">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="religion">Religion </label> <input type="text"
					class="form-control" id="religion" name="religion"
					placeholder="Enter religion">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="nationality">Nationality </label> <input type="text"
					class="form-control" id="nationality" name="nationality"
					placeholder="Enter nationality">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="cardId">ID. Card no. </label> <input type="text"
					class="form-control" id="cardId" name="cardId"
					placeholder="Enter ID. Card no.">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="cardIssuedOffice">Issued office </label> <input type="text"
					class="form-control" id="cardIssuedOffice" name="cardIssuedOffice"
					placeholder="Enter issued office">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="cardExpiryDate"><span
					class="glyphicon glyphicon-calendar"></span>Expiry date </label>
				<div class="input-group date">
					<input type="text" id="cardExpiryDate" name="cardExpiryDate"
						class="form-control"><span class="input-group-addon"><i
						class="glyphicon glyphicon-th"></i></span>
				</div>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="height">Height (cms) </label> <input type="text"
					class="form-control" id="height" name="height"
					placeholder="Enter height (cms)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="weight">Weight (kgs) </label> <input type="text"
					class="form-control" id="weight" name="weight"
					placeholder="Enter weight (kgs)">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="sex">Sex </label>
				<div class="radio">
					<label><input type="radio" name="sex" value="Female"
						id="sex">Female</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="sex" value="Male"
						id="sex">Male</label>
				</div>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="applicantStatus">Marital status </label>
				<div class="radio">
					<label><input type="radio" name="applicantStatus"
						id="applicantStatus" value="Single">Single</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="applicantStatus"
						id="applicantStatus" value="Married">Married</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="applicantStatus"
						id="applicantStatus">Divorced</label>
				</div>

			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="children">Number of children </label> <input type="text"
					class="form-control" id="numberOfChildren" name="numberOfChildren"
					placeholder="Enter number of children">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="spouseName">Spouse: Name </label> <input type="text"
					class="form-control" id="spouseName" name="spouseName"
					placeholder="Enter spouse: name">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="marriageCertificateNo">Marriage certificate No </label> <input
					type="text" class="form-control" id="marriageCertificateNo"
					name="marriageCertificateNo" placeholder="Enter marriage certificate No.">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="issueOficeMarriage">Issued office </label> <input
					type="text" class="form-control" id="issueOficeMarriage"
					name="issueOficeMarriage" placeholder="Enter Issued office">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="marriageAddress">Address </label> <input type="text"
					class="form-control" rows="5" id="marriageAddress" name="marriageAddress"
					placeholder="Enter address">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="occupationMarriage">Occupation </label> <input type="text"
					class="form-control" id="occupationMarriage" name="occupationMarriage"
					placeholder="Enter occupation">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="military">Have you ever served in the military
					service? </label>
				<div class="radio">
					<label><input type="radio" name="militaryStatus"
						id="militaryStatus">Yes</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="militaryStatus"
						id="militaryStatus">No</label>
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="militaryComplete">If yes, please complete the
						blanks below </label> <label for="militaryFromYear">From year </label> <input
						type="text" class="form-control" id="militaryFromYear"
						name="militaryFromYear" placeholder="Enter from year">
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="militarytoYear">To year </label> <input type="text"
						class="form-control" id="militarytoYear" name="militarytoYear"
						placeholder="Enter to year">
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="branchService">Branch of service </label> <input type="text"
						class="form-control" id="branchService" name="branchService"
						placeholder="Enter branch of service">
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="militaryPlace">Military place </label> <input type="text"
						class="form-control" id="militaryPlace" name="militaryPlace"
						placeholder="Enter military place">
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="serviceNo">Service no </label> <input type="text"
						class="form-control" id="militaryServiceNo" name="militaryServiceNo"
						placeholder="Enter Service no">
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="reasons">If not, please state the reasons </label> <input
						type="text" class="form-control" id="militaryReason" name="militaryReason"
						placeholder="Enter If not, please state the reasons">
				</div>
			<br>
			<br>
				<div class="form-group">
					<label for="dateToBeDrafted"><span
						class="glyphicon glyphicon-calendar"></span>Date to be drafted</label>
					<div class="input-group date">
						<input type="text" id="dateToBeDrafted" name="dateToBeDrafted"
							class="form-control"><span class="input-group-addon"><i
							class="glyphicon glyphicon-th"></i></span>
					</div>
				</div>
			</div>
		</div>
	</div>
			<br>
			<br>
	<div class="row">
		<div class="col-md-6">
			<label for="applyDate"><span class="glyphicon glyphicon-calendar"></span>Apply date</label>
			<div class="input-group date">
				<input type="text" id="applyDate" name="applyDate"
					class="form-control"><span class="input-group-addon"><i
					class="glyphicon glyphicon-th"></i></span>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="department">Department </label> 
				<select id="departmentId" class="form-control" name="departmentName">
					<option value="-1" label="please select data"/>
					<c:forEach var="departmentList" items="${departments}" >
						<option value="${departmentList.id}">${departmentList.departmentName}</option>
					</c:forEach>
				</select>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="position1">Position 1 </label>
				  <select id="position1" name="position1" class="form-control">
					<option value="-1" label="please select data"/>
					
					<c:forEach var="positionList" items="${positions}">
						<option value="${positionList.id}">${positionList.positionName}</option>
					</c:forEach>
				</select> 
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="position2">Position 2 </label> <select
					id="position2" name="position2" class="form-control">
					<option value="-1" label="please select data"/>
					<c:forEach var="positionList" items="${positions}">
						<option value="${positionList.id}">${positionList.positionName}</option>
					</c:forEach>
				</select>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="position3">Position 3 </label> <select
					id="position3" name="position3" class="form-control">
					<option value="-1" label="please select data"/>
					<c:forEach var="positionList" items="${positions}">
						<option value="${positionList.id}">${positionList.positionName}</option>
					</c:forEach>
				</select>
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="salary">Salary expected </label> <input type="text"
					class="form-control" id="expectedSalary" name="expectedSalary"
					placeholder="Enter salary">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="knowAugmentis">How do you know Augmentis?</label> <br>
				 <div class="checkbox">
			  		<label><input type="checkbox" 
					id="noticeNewspaper" name="noticeNewspaper" value="Newspaper" >Newspaper</label>
					<input type="text" class="form-control" id="noticeNewspaper"
						name="noticeNewspaper" placeholder="Enter newspaper">
				</div>
				<br>
				<br>
				<div class="checkbox">
			 		 <label><input type="checkbox" id="noticeMagazine" name="noticeMagazine" value="Magazine">Magazine</label>
					<input type="text" class="form-control" id="noticeMagazine"
						name="noticeMagazine" placeholder="Enter magazine">
				</div>
				<br>
				<br>
				<div class="checkbox">
			  		<label><input type="checkbox" id="noticeWebSite" name="noticeWebSite" value="Website">Website</label>
			  		<input type="text" class="form-control" id="noticeWebSite"
						name="noticeWebSite" placeholder="Enter website">
				</div>
				<br>
				<br>
				<div class="checkbox">
			  		<label><input type="checkbox" id="noticeFriend" name="noticeFriend" value="Friend">Friend</label>
			  		<input type="text" class="form-control" id="noticeFriend"
						name="noticeFriend" placeholder="Enter friend">
				</div>
				<br>
				<br>
				<div class="checkbox">
			  		<label><input type="checkbox" id="noticeOther" name="noticeOther" value="Other">Other (please specify) </label>
			  		<input type="text" class="form-control" id="noticeOther"
						name="noticeOther" placeholder="Enter other">
				</div> 
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="nowEmployed">Do you know anyone now being employed
					by this company? </label><br><br>
				<div class="radio">
					<label><input type="radio" name="nowEmployed"
						id="nowEmployed" value="Yes">Yes</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="nowEmployed"
						id="nowEmployed" value="No">No</label>
				</div>
				<br>
				<br>
				<div class="form-group">
					<label for="nameRelation">If yes, please write name, position
						and relation </label><br><br>
					<lable for="employedName">Name </lable>
					<input type="text" class="form-control" id="employedName"
						name="employedName" placeholder="Enter name">
						<br>
						<br>
					<lable for="employedPosition">Position </lable>
					<input type="text" class="form-control" id="employedPosition"
						name="employedPosition" placeholder="Enter position">
						<br>
						<br>
					<lable for="employedRelation">Relation </lable>
					<input type="text" class="form-control" id="employedRelation"
						name="employedRelation" placeholder="Enter relation">
				</div>
			</div>
				<br>
				<br>
			<label for="emergency">In case of emergency , notify , ( Name , Address and Telephone ) </label>
				<br>
				<br>
			<div class="form-group">
				<label for="emergencyOfName">Emergency Name </label> <input
					type="text" class="form-control" id="emergencyName"
					name="emergencyName" placeholder="Enter emergency name">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="emergencyTel">Emergency Telephone </label> <input
					type="text" class="form-control" id="emergencyTel"
					name="emergencyTel" placeholder="Enter emergency tel">
			</div>
			<br>
			<br>
			<div class="form-group">
				<label for="emergencyAddress">Emergency Address </label>
					<textarea class="form-control" rows="5" id="emergencyAddress"
					name="emergencyAddress" placeholder="Enter emergency address"></textarea>
					
			</div>
		<br>
		<br>			
		<div class="form-group">
		<label for="previousEmployers">May inquiry be made of your
			previous employers regarding your character, qualification record of
			employment? </label>
			<br>
			<br>
		<div class="radio">
			<label><input type="radio" name="previousEmployers"
				id="previousEmployers" value="Yes">Yes</label>
		</div>
		<div class="radio">
			<label><input type="radio" name="previousEmployers"
				id="previousEmployers" value="No">No</label>
		</div>
		<br>
		<br>
		<div class="form-group">
			<label for="previousEmployersReason">If not, please give the reason </label> <input
				type="text" class="form-control" id="previousEmployersReason"
				name="previousEmployersReason"
				placeholder="Enter If not, please give the reason">
		</div>
	</div>
		<br>
		<br>
		  <div class="form-group">
			<label for="file">Resume</label> <input type="file" id="resumeMultipartFile" name="resumeMultipartFile">
				<p class="help-block">Block-level help text here.</p>
			<label for="file">Transcript</label> <input type="file" id="transcriptMultipartFile" name="transcriptMultipartFile">
				<p class="help-block">Block-level help text here.</p>
		</div>
			<br>
			<br>
		<button type="submit"  id="buttonSave" class="btn btn-success"><span class="glyphicon glyphicon-off"></span> Save</button>
			
 	</div>
 </div>
</f:form>
