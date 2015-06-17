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
		/* 	$('#infoForm').validate({
				rules : {
					photographName : {
						required : true
					},
					firstNameThName : {
						required : true
					},
					lastnameThName : {
						required : true
					},
					nickNameThName : {
						required : true
					},
					firstNameEngId : {
						required : true
					},
					lastnameEngName : {
						required : true
					},
					nickNameEngName : {
						required : true
					},
					telName : {
						required : true
					},
					eMailName : {
						required : true
					},
					birthdayName : {
						required : true
					},
					pBirthName : {
						required : true
					},
					ageName : {
						required : true
					},
					religionName : {
						required : true
					},
					nationalityName : {
						required : true
					},
					idCardName : {
						required : true
					},
					issuedCardName : {
						required : true
					},
					expiryName : {
						required : true
					},
					heightName : {
						required : true
					},
					weightName : {
						required : true
					},
					sexName : {
						required : true
					},
					maritalName : {
						required : true
					},
					childrenName : {
						required : true
					}
				},
				messages : {
					photographName : {
						required : "Photograph is required!"
					},
					firstNameThName : {
						required : "Firstname Thai is required!"
					},
					lastnameThName : {
						required : "lastname Thai is required"
					},
					nickNameThName : {
						required : "Firstname is required!"
					},
					firstNameEngId : {
						required : "Firstname English is required!"
					},
					lastnameEngName : {
						required : "Birthday is required!"
					},
					nickNameEngName : {
						required : "Birthday is required!"
					},
					telName : {
						required : "Birthday is required!"
					},
					eMailName : {
						required : "Birthday is required!"
					},
					birthdayName : {
						required : "Birthday is required!"
					},
					pBirthName : {
						required : "Birthday is required!"
					},
					ageName : {
						required : "Birthday is required!"
					},
					religionName : {
						required : "Birthday is required!"
					},
					nationalityName : {
						required : "Birthday is required!"
					},
					idCardName : {
						required : "Birthday is required!"
					},
					issuedCardName : {
						required : "Birthday is required!"
					},
					expiryName : {
						required : "Birthday is required!"
					},
					heightName : {
						required : "Birthday is required!"
					},
					weightName : {
						required : "Birthday is required!"
					},
					sexName : {
						required : "Birthday is required!"
					},
					maritalName : {
						required : "Birthday is required!"
					},
					childrenName : {
						required : "Birthday is required!"
					}
					
				}
			});
 */
			

						$('#familyTable').DataTable({
											ajax : {
												url : '${pageContext.request.contextPath}/informations',
												type : 'GET'
											},
											columns : [ {
												data : "name"
											}, {
												data : "relation"
											}, {
												data : "occupation"
											}, {
												data : "address"
											}, {
												data : "positionFamily"
											}],
											searching : false

										});

						$('#familySave').on("click", function() {

							var table = $('#familyTable').DataTable();

							table.row.add({
								name : $('#nameFamilyId').val(),
								relation : $('#relationFamilyId').val(),
								occupation : $('#occupationFamilyId').val(),
								address : $('#addressFamilyId').val(),
								positionFamily : $('#positionFamilyId').val()}).draw();
							
							$('#familyModal').modal('hide');

						})

						$('#buttonSave').on("click",function() {
											 var insertData = "{";
											insertData += "firstNameTH : '"+ $('#firstNameThId').val()+ "',";
											insertData += "firstNameEN : '"+ $('#firstNameEngId').val() + "',";
											insertData += "lastNameTH : '"+ $('#lastnameThId').val()+ "',";
											insertData += "lastNameEN : '"+ $('#lastnameEngId').val()+ "',";
											insertData += "nickNameTH : '"+ $('#nickNameThId').val()+ "',";
											insertData += "nickNameEN : '"+ $('#nickNameEngId').val()+ "',";
											insertData += "birthDate : '"+ $('#birthdayId').val()+ "',";
											insertData += "placeBirth : '"+ $('#pBirthId').val()+ "',";
											insertData += "age : "+ $('#ageId').val() + ",";
											insertData += "height : "+ $('#heightId').val()+ ",";
											insertData += "weight : "+ $('#weightId').val()+ ",";
											insertData += "sex : '"+ $('input[name=sexName]:checked').val() + "',";
											insertData += "religion : '"+ $('#religionId').val()+ "',";
											insertData += "nationality : '"+ $('#nationalityId').val()+ "',";
											insertData += "tel : '"+ $('#telId').val() + "',";
											insertData += "eMail : '"+ $('#eMailId').val()+ "',";
											insertData += "applicantStatus : '"+ $('input[name=maritalName]:checked').val() + "',";
											insertData += "emergencyName : '"+ $('#emergencyNameId').val() + "',";
											insertData += "emergencyTel : '"+ $('#emergencyTelId').val() + "',";
											insertData += "emergencyAddress : '"+ $('#emergencyAddressId').val() + "',";
											insertData += "certificate : '"+ $('#certificateId').val()+ "',";
											insertData += "cardId : '"+ $('#idCardId').val()+ "',";
											insertData += "cardIssuedOffice : '"+ $('#issuedCardId').val()+ "',";
											insertData += "cardExpiryDate : '"+ $('#expiryId').val()+ "',";
											insertData += "militaryFromYear : '"+ $('#fromYearId').val()+ "',";
											insertData += "militarytoYear : '"+ $('#toYearId').val()+ "',";
											insertData += "militaryPlace : '"+ $('#placeId').val()+ "',";
											insertData += "militaryServiceNo : '"+ $('#serviceNoId').val()+ "',";
											insertData += "militaryReason : '"+ $('#reasonsId').val()+ "',";
											insertData += "militaryStatus : '"+ $('input[name=militaryName]:checked').val() + "',";
											insertData += "marritalStatusName : '"+ $('#maritalId').val()+ "',";
											insertData += "numberOfChildren : '"+ $('#childrenId').val()+ "',";
											insertData += "spouseName : '"+ $('#spouseId').val()+ "',";
											insertData += "marriageCertificateNo : '"+ $('#maritalId').val()+ "',";
											insertData += "issueOficeMarriage : '"+ $('#issuedMarriageId').val() + "',";
											insertData += "dateToBeDrafted : '"+ $('#draftedId').val() + "',";
											insertData += "marriageAddress : '"+ $('#addressId').val()+ "',";
											insertData += "issueOficeMarriage : '"+ $('#issuedMarriageId').val() + "',";
											insertData += "occupationMarriage : '"+ $('#occupationId').val()+ "',";
											insertData += "branchService : '"+ $('#branchId').val()+ "',";
											insertData+="families : [ ";
											
											var familyTable = $("#familyTable").DataTable();
											familyTable.rows().iterator( 'row', function ( context, index ) {
											  
												insertData+="{";
												//insertData+="applicant : {id :'"+$('#applicantId').val()+"'},";
												insertData+="name : '"+familyTable.cell( index,0 ).data()+"',";
												insertData+="relation : '"+familyTable.cell( index,1 ).data()+"',";
												insertData+="occupation : '"+familyTable.cell( index,2 ).data()+"',";
												insertData+="address : '"+familyTable.cell( index,3 ).data()+"',";
												insertData+="positionFamily : '"+familyTable.cell( index,4 ).data()+"'},";
											});
											
											insertData=insertData.substring(0,insertData.length-1);
											insertData+="]";
											insertData+="}";
											$.ajax({
														contentType : "application/json",
														type : "POST",
														url : '${pageContext.request.contextPath}/saveInformations',
														data : JSON.stringify(eval("(" + insertData + ")")),
														success : function(data) {
															alert(JSON.stringify(data));

															new PNotify({
														        title: 'Success',
														        text: 'Successful Add Information!!!',
														        type: 'success',
														        nonblock: {
														            nonblock: true,
														            nonblock_opacity: .2
														        }
														    });
														}
											});

										})

});
</script>
<jsp:include page="applicationMenu.jsp" />
<!-- tab informations -->
<div id="informations">
	<div class="row">
		<div class="col-md-6">
			<form role="form" id="infoForm">
				<div class="form-group">
					<div class="row">
						<div class="col-md-6">
						<!-- <img src="..." class="img-thumbnail" width="304" height="236"> -->
					</div>
				</div>
			</div>
			<div class="form-group">
				<input type="hidden" id="applicantId" name="applicantName"
					value="${id}">
			</div>

			<div class="form-group">
				<label for="photograph">PHOTOGRAPH</label> <input type="file"
					id="photographId" name="photographName">
				<p class="help-block">Block-level help text here.</p>
			</div>

			<div class="form-group">
				<label for="firstNameTh">Firstname (TH) </label> <input type="text"
					class="form-control" id="firstNameThId" name="firstNameThName"
					placeholder="Enter Firstname(TH)">
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
				<label for="lastnameEng">Lastname (ENG) </label> <input type="text"
					class="form-control" id="lastnameEngId" name="lastnameEngName"
					placeholder="Enter lastname(ENG)">
			</div>
			<div class="form-group">
				<label for="nickNameEng">Nickname (Eng) </label> <input type="text"
					class="form-control" id="nickNameEngId" name="nickNameEngName"
					placeholder="Enter nickname(Eng)">
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
				<label for="expiry"><span
					class="glyphicon glyphicon-calendar"></span>Expiry date </label>
				<div class="input-group date">
					<input type="text" id="expiryId" name="expiryName"
						class="form-control"><span class="input-group-addon"><i
						class="glyphicon glyphicon-th"></i></span>
				</div>
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
					<label><input type="radio" name="sexName" value="Female"
						id="sexId">Female</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="sexName" value="Male"
						id="sexId">Male</label>
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
				<label for="children">Number of children </label> <input type="text"
					class="form-control" id="childrenId" name="childrenName"
					placeholder="Enter number of children">
			</div>
		</form>
	</div>
	<div class="col-md-6">
		<form role="form" id="informationForm">
			<div class="form-group">
				<label for="spouse">Spouse: Name </label> <input type="text"
					class="form-control" id="spouseId" name="spouseName"
					placeholder="Enter spouse: name">
			</div>

			<div class="form-group">
				<label for="marriageCer">Marriage certificate No </label> <input
					type="text" class="form-control" id="marriageCerId"
					name="marriageCerName" placeholder="Enter marriage certificate No.">
			</div>
			<div class="form-group">
				<label for="issuedMarriage">Issued office </label> <input
					type="text" class="form-control" id="issuedMarriageId"
					name="issuedMarriageName" placeholder="Enter Issued office">
			</div>
			<div class="form-group">
				<label for="address">Address </label> <input type="text"
					class="form-control" rows="5" id="addressId" name="addressName"
					placeholder="Enter address">
			</div>
			<div class="form-group">
				<label for="occupation">Occupation </label> <input type="text"
					class="form-control" id="occupationId" name="occupationName"
					placeholder="Enter occupation">
			</div>

			<div class="form-group">
				<label for="military">Have you ever served in the military
					service? </label>
				<div class="radio">
					<label><input type="radio" name="militaryName"
						id="militaryId">Yes</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="militaryName"
						id="militaryId">No</label>
				</div>

				<div class="form-group">
					<label for="militaryComplete">If yes, please complete the
						blanks below </label> <label for="fromYear">From year </label> <input
						type="text" class="form-control" id="fromYearId"
						name="fromYearName" placeholder="Enter from year">
				</div>
				<div class="form-group">
					<label for="toYear">To year </label> <input type="text"
						class="form-control" id="toYearId" name="toYearName"
						placeholder="Enter to year">
				</div>

				<div class="form-group">
					<label for="branch">Branch of service </label> <input type="text"
						class="form-control" id="branchId" name="branchName"
						placeholder="Enter branch of service">
				</div>
				<div class="form-group">
					<label for="place">Military place </label> <input type="text"
						class="form-control" id="placeId" name="placeName"
						placeholder="Enter military place">
				</div>
				<div class="form-group">
					<label for="serviceNo">Service no </label> <input type="text"
						class="form-control" id="serviceNoId" name="serviceNoName"
						placeholder="Enter Service no">
				</div>

				<div class="form-group">
					<label for="reasons">If not, please state the reasons </label> <input
						type="text" class="form-control" id="reasonsId" name="reasonsName"
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
				</div>
			</form>
				
		 <div class="form-group">
					<label for="informationFamily">Information regarding family
						(Including Parents Brothers and Sisters) </label>
				</div>
				<br>
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<h1>Family</h1>
							<button class="btn btn-primary" id="familyAdd"
								data-toggle="modal" data-target="#familyModal">
								<span class="glyphicon glyphicon-plus"></span> Family
							</button>
						</div>
					</div>
				</div>
				<div class="modal fade" id="familyModal" role="dialog">
					<div class="modal-dialog">

						<div class="modal-content">
							<div class="modal-header" style="padding: 35px 50px;">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4>
									<span class="glyphicon glyphicon-lock"></span> Family
								</h4>
							</div>
							<div class="modal-body" style="padding: 40px 50px;">
								<form role="form" id="familyForm">
									<div class="form-group">
										<label for="nameFamily">Name </label> <input type="text"
											class="form-control" id="nameFamilyId" name="nameFamilyName"
											placeholder="Enter name">
									</div>

									<div class="form-group">
										<label for="relationFamily">Relation </label> <input
											type="text" class="form-control" id="relationFamilyId"
											name="relationFamilyName" placeholder="Enter relation">
									</div>
									<div class="form-group">
										<label for="occupationFamily">Occupation </label> <input
											type="text" class="form-control" id="occupationFamilyId"
											name="occupationFamilyName" placeholder="Enter occupation ">
									</div>

									<div class="form-group">
										<label for="addressFamily">Address </label> <input
											type="textarea" class="form-control"
											id="addressFamilyId" name="addressFamilyName"
											placeholder="Enter address ">
									</div>

									<div class="form-group">
										<label for="positionFamily">Position </label> <input
											type="text" class="form-control" id="positionFamilyId"
											name="positionFamilyName" placeholder="Enter position">
									</div>
									<br> <br>
									<button type="button" class="btn btn-success"
										id="familySave">
										<span class="glyphicon glyphicon-off"></span> Save
									</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
								</form>
							</div>
							<div class="modal-footer">
								<p>Please fill your information</p>
							</div>
						</div>

					</div>
				</div>
				<br> <br>
				<div>
					<table id="familyTable" class="display" cellspacing="0"
						width="100%">
						<thead>
							<tr>
								<th>NAME</th>
								<th>RELATION</th>
								<th>OCCUPATION</th>
								<th>ADDRESS</th>
								<th>POSITION_FAMILY</th>

							</tr>
						</thead>


						<tbody></tbody>
					</table>

				</div>


			</div>

 		</div>
		</div>

			
			<button type="button" class="btn btn-success" id="buttonSave">
				<span class="glyphicon glyphicon-off"></span> Save
			</button>