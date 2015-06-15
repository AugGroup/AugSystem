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

		

		$('#referenceTable').DataTable({
			ajax : {
				url : '${pageContext.request.contextPath}/experiences',
				type : 'GET'
			},
			columns : [ {
				data : "fullName"
			}, {
				data : "tel"
			}, {
				data : "occupation"
			}, {
				data : "completeAddress"
			} ],
			searching : false

		});
		$('#referenceSave').on("click", function() {
			var table = $('#referenceTable').DataTable();

			table.row.add({
				fullName : $('#fullNameId').val(),
				tel : $('#telNoId').val(),
				occupation : $('#occupationRefId').val(),
				completeAddress : $('#completeAddressId').val()
			}).draw();
			$('#referenceModal').modal('hide');

		})

		$('#experiencesTable').DataTable({
			ajax : {
				url : '${pageContext.request.contextPath}/experiences',
				type : 'GET'
			},
			columns : [ {
				data : "position"
			}, {
				data : "fromDate"
			}, {
				data : "toDate"
			}, {
				data : "employerName"
			}, {
				data : "address"
			}, {
				data : "typeOfBusiness"
			}, {
				data : "positionOfEmployer"
			}, {
				data : "supervisor"
			}, {
				data : "salary"
			}, {
				data : "description"
			}, {
				data : "reason"
			} ],
			searching : false

		});
		$('#experiencesSave').on("click", function() {
			var table = $('#experiencesTable').DataTable();

			table.row.add({
				position : $('#workBackgroundId').val(),
				fromDate : $('#fromWorkYearId').val(),
				toDate : $('#toWorkYearId').val(),
				employerName : $('#empId').val(),
				address : $('#addressBackgroundId').val(),
				typeOfBusiness : $('#businessId').val(),
				positionOfEmployer : $('#positionBackgroundId').val(),
				supervisor : $('#supervisorBackgroundId').val(),
				salary : $('#salaryBackgroundId').val(),
				description : $('#descriptionBackgroundId').val(),
				reason : $('#reasonLeavingId').val()
			}).draw();
			$('#experiencesModal').modal('hide');

		}) 
		$('#buttonSave').on("click", function() {

			var inputData = {
				
				experiences : [ {
					applicant : {
						id : $('#applicantId').val()
					},
					position : $('#workBackgroundId').val(),
					fromDate : $('#fromWorkYearId').val(),
					toDate : $('#toWorkYearId').val(),
					employerName : $('#empId').val(),
					address : $('#addressBackgroundId').val(),
					typeOfBusiness : $('#businessId').val(),
					positionOfEmployer : $('#positionBackgroundId').val(),
					reason : $('#reasonLeavingId').val(),
					supervisor : $('#supervisorBackgroundId').val(),
					salary : $('#salaryBackgroundId').val(),
					description : $('#descriptionBackgroundId').val()
				} ],
				references : [ {
					applicant : {
						id : $('#applicantId').val()
					},
					fullName : $('#fullNameId').val(),
					tel : $('#telNoId').val(),
					occupation : $('#occupationRefId').val(),
					completeAddress : $('#completeAddressId').val()
				} ],
			previousEmployers : $('#previousEmployersId').val,
			previousEmployersReason : $('#giveReasonId').val
			}
		var insertData = "{";
			
			insertData+="experiences : [ ";
			var experiencesTable = $("#experiencesTable").DataTable();
			
			experiencesTable.rows().iterator( 'row', function ( context, index ) {
			insertData+="{";
			insertData+="applicant : {id :"+$('#applicantId').val()+"},";
			insertData+="position : '"+experiencesTable.cell( index,0 ).data()+"',";
			insertData+="fromDate : '"+experiencesTable.cell( index,1 ).data()+"',";
			insertData+="toDate : '"+experiencesTable.cell( index,2 ).data()+"',";
			insertData+="employerName : '"+experiencesTable.cell( index,3 ).data()+"',";
			insertData+="address : '"+experiencesTable.cell( index,4 ).data()+"',";
			insertData+="typeOfBusiness : '"+experiencesTable.cell( index,5 ).data()+"',";
			insertData+="positionOfEmployer : '"+experiencesTable.cell( index,6 ).data()+"',";
			insertData+="supervisor : '"+experiencesTable.cell( index,7 ).data()+"',";
			insertData+="salary : "+experiencesTable.cell( index,8 ).data()+",";
			insertData+="description : '"+experiencesTable.cell( index,9 ).data()+"',";
			insertData+="reason : '"+experiencesTable.cell( index,10 ).data()+"'},";
			});
				insertData=insertData.substring(0,insertData.length-1);
				insertData+="],";
			
			insertData+="references : [ ";
			
			var referenceTable = $("#referenceTable").DataTable();
			referenceTable.rows().iterator( 'row', function ( context, index ) {
			  
				insertData+="{";
				insertData+="applicant : {id :"+$('#applicantId').val()+"},";
				insertData+="fullName : '"+referenceTable.cell( index,0 ).data()+"',";
				insertData+="tel : '"+referenceTable.cell( index,1 ).data()+"',";
				insertData+="occupation : '"+referenceTable.cell( index,2 ).data()+"',";
				insertData+="completeAddress : '"+referenceTable.cell( index,3 ).data()+"'},";
			});

			insertData=insertData.substring(0,insertData.length-1);
			
			insertData+="],";
			
			insertData+="previousEmployers : '"+$('#previousEmployersId').val()+"',";
			insertData+="previousEmployersReason : '"+$('#giveReasonId').val()+"'}";
			
			$.ajax({
				contentType : "application/json",
				type : "POST",
				url : '${pageContext.request.contextPath}/saveExperiences',
				data : JSON.stringify(eval("(" + insertData + ")")),
				success : function(data) {
					alert(JSON.stringify(data));
				}
			});

		})

	});
</script>
<jsp:include page = "applicationMenu.jsp"/>
<div id="experiences">
	<div class="form-group">
		<label for="previousEmployers">May inquiry be made of your
			previous employers regarding your character, qualification record of
			employment? </label>
		<div class="form-group">
			<input type="hidden" id="applicantId" name="applicantName"
				value="${id}">
		</div>
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
			THAN YOUR RELATIVE OR FORMER EMPLOYER who have definite knowledge of
			your qualifications and your conducts. </label>
	</div>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h1>REFERENCE</h1>
				<button class="btn btn-primary" id="referenceAdd"
					data-toggle="modal" data-target="#referenceModal">
					<span class="glyphicon glyphicon-plus"></span> REFERENCE
				</button>
			</div>
		</div>
		<div class="modal fade" id="referenceModal" role="dialog">
			<div class="modal-dialog">

				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> REFERENCE
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" id="referenceForm">
							<div class="form-group">
								<input type="hidden" id="applicantId" name="applicantName"
									value="${id}">
							</div>
							<div class="form-group">
								<label for="fullNameRef">FULL NAME </label> <input type="text"
									class="form-control" id="fullNameId" name="fullName"
									placeholder="Enter FULL NAME">
							</div>
							<div class="form-group">
								<label for="completeAddress">COMPLETE ADDRESS. </label> <input
									type="text" class="form-control" id="completeAddressId"
									name="completeAddressName"
									placeholder="Enter COMPLETE ADDRESS.">
							</div>
							<div class="form-group">
								<label for="telNo">TELEPHONE NO. </label> <input type="text"
									class="form-control" id="telNoId" name="telNoName"
									placeholder="Enter TELEPHONE NO.">
							</div>
							<div class="form-group">
								<label for="occupationRef">OCCUPATION </label> <input
									type="text" class="form-control" id="occupationRefId"
									name="occupationRefName" placeholder="Enter occupation">
							</div>
							<br> <br>
							<button type="button" class="btn btn-success" id="referenceSave">
								<span class="glyphicon glyphicon-off"></span> Save
							</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<p>Please fill your information</p>
				</div>
			</div>

		</div>
	</div>
	<br> <br>
	<div>
		<table id="referenceTable" class="display" cellspacing="0"
			width="100%">
			<thead>
				<tr>
					<th>FULLNAME</th>
					<th>TEL</th>
					<th>OCCUPATION</th>
					<th>COMPLETE_ADDRESS</th>
				</tr>
			</thead>


			<tbody></tbody>
		</table>

	</div>

	<div class="form-group">
		<label for="experiences">Experiences (start with your present
			or last position of work background) </label>
	</div>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h1>Experiences</h1>
				<button class="btn btn-primary" id="experiencesAdd"
					data-toggle="modal" data-target="#experiencesModal">
					<span class="glyphicon glyphicon-plus"></span> Experiences
				</button>
			</div>
		</div>
		<div class="modal fade" id="experiencesModal" role="dialog">
			<div class="modal-dialog">

				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> Experiences
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" id="experiencesForm">
							<div class="form-group">
								<input type="hidden" id="applicantId" name="applicantName"
									value="${id}">
							</div>

							<div class="form-group">
								<label for="workBackground">Present or last position </label> <input
									type="text" class="form-control" id="workBackgroundId"
									name="workBackgroundName"
									placeholder="Enter present or last position ">
							</div>

							<div class="form-group">
								<label for="fromWorkYear"><span
									class="glyphicon glyphicon-calendar"></span>From (month, year)
								</label>
								<div class="input-group date">
									<input type="text" id="fromWorkYearId" name="fromWorkYearName"
										class="form-control"><span class="input-group-addon"><i
										class="glyphicon glyphicon-th"></i></span>
								</div>

							</div>

							<div class="form-group">
								<label for="toWorkYear"><span
									class="glyphicon glyphicon-calendar"></span>To (month, year) </label>
								<div class="input-group date">
									<input type="text" id="toWorkYearId" name="toWorkYearName"
										class="form-control"><span class="input-group-addon"><i
										class="glyphicon glyphicon-th"></i></span>
								</div>


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
								<label for="business">Type of business </label> <input
									type="text" class="form-control" id="businessId"
									name="businessName" placeholder="Enter type of business ">
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
							<br> <br>
							<button type="button" class="btn btn-success"
								id="experiencesSave">
								<span class="glyphicon glyphicon-off"></span> Save
							</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<p>Please fill your information</p>
				</div>
			</div>

		</div>
	</div>
	<br> <br>
	<div>
		<table id="experiencesTable" class="display" cellspacing="0"
			width="100%">
			<thead>
				<tr>
					<th>POSITION</th>
					<th>FROM_DATE</th>
					<th>TO_DATE</th>
					<th>EMPLOYER_NAME</th>
					<th>ADDRESS</th>
					<th>TYPE_OF_BUSSINESS</th>
					<th>POSITION_OF_EMPLOYER</th>
					<th>SUPERVISOR</th>
					<th>SALARY</th>
					<th>DESCRIPTION</th>
					<th>REASON</th>
				</tr>
			</thead>


			<tbody></tbody>
		</table>

	</div>

	<button type="button" class="btn btn-success" id="buttonSave">
		<span class="glyphicon glyphicon-off"></span> Save
	</button>
</div>