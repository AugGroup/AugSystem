<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.error {
	color: #ff0000;
}
</style>
<script>
	$(document).ready(function() {
		
		var dtApplicant	
		
		$('.input-group.date').datepicker({
			startView : 2,
			todayBtn : "linked",
			format : "dd/mm/yyyy"

		});

	 	/* $('#previousEmployers').validate({
			rules : {
				previousEmployersName : {
					required : true
				},
				giveReasonName : {
					required : true,
				}
			},
			messages : {
				previousEmployersName : {
					required : "Please choose is required!"
				},
				giveReasonName : {
					required : "Please give the reason is required!"
				}
			}
		});
	 	
	 	$('#experiencesForm').validate({
			rules : {
				workBackgroundName : {
					required : true,
				},
				fromWorkYearName : {
					required : true,
				},
				toWorkYearName : {
					required : true,
				},
				empName : {
					required : true,
				},
				addressBackgroundName : {
					required : true,
				},
				businessName : {
					required : true,
				},
				positionBackgroundName : {
					required : true,
				},
				supervisorBackgroundName : {
					required : true,
				},
				salaryBackgroundName : {
					required : true,
				},
				descriptionBackgroundName : {
					required : true,
				},
				reasonLeavingName : {
					required : true,
				}
			},
			messages : {
				workBackgroundName : {
					required : "Present or last position is required!"
				},
				fromWorkYearName : {
					required : "From (month, year) is required!"
				},
				toWorkYearName : {
					required : "To (month, year) is required!"
				},
				empName : {
					required : "Employer Name is required!"
				},
				addressBackgroundName : {
					required : "Address is required!"
				},
				businessName : {
					required : "Type of business is required!"
				},
				positionBackgroundName : {
					required : "Position is required!"
				},
				supervisorBackgroundName : {
					required : "Supervisor is required!"
				},
				salaryBackgroundName : {
					required : "Salary ,Wages is required!"
				},
				descriptionBackgroundName : {
					required : "Description of duties and responsibilities is required!"
				},
				reasonLeavingName : {
					required : "Reason for leaving is required!"
				}
			}
		});
	 	 */
		
// =======
		
// 		if(dtApplicant){
// 			dtApplicant.ajax.reload();
// 		}else{
// 			var id = '${id}';
// 		$('#referenceTable').DataTable({
// 			ajax : {
// 				url : '${pageContext.request.contextPath}/findByIdReference/' + id,
// 				type : 'POST'
// 			},
// 			columns : [ {data : "fullName"},
// 			            {data : "tel"},
// 						{data : "occupation"},
// 						{data : "completeAddress"}],
// 			searching : false

// 		});
// 		}
		
// 		$('#referenceSave').on("click", function() {

// 			if ($('#referenceForm').valid()) { 
// 			var table = $('#referenceTable').DataTable();

// 			table.row.add({
// 				fullName : $('#fullNameId').val(),
// 				tel : $('#telNoId').val(),
// 				occupation : $('#occupationRefId').val(),
// 				completeAddress : $('#completeAddressId').val()
// 			}).draw();
// 			$('#referenceModal').modal('hide');
// 			};
// 		})

// 		if(dtApplicant){
// 			dtApplicant.ajax.reload();
// 		}else{
// 			var id = '${id}';
// >>>>>>> Edit AddressRepository.java, AddressRepositoryImpl.java, ExperienceRepository.java, /ExperienceRepositoryImpl.java, ReferenceRepository.java, ReferenceRepositoryImpl.java, ReferenceService.java, ReferenceServiceImpl.java, ApplicationController.java, address.jsp, applicationMenu.jsp, applications.jsp, experiences.jsp
		$('#experiencesTable').DataTable({
			ajax : {
				url : '${pageContext.request.contextPath}/findByIdExperience/' + id,
				type : 'POST'
			},
// <<<<<<< HEAD
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
			},{ data : function(data) {
				 return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#myModal" class="btn btn-warning btn-mini">' + 'Edit' + '</button>';
			}
			},{ data : function(data) {
				 return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#modalDelete" class="btn btn-danger btn-mini">' + 'Delete' + '</button>';
			}
		} ],
// =======
// 			columns : [ {data : "position"},
// 						{data : "fromDate"},
// 						{data : "toDate"},
// 						{data : "employerName"},
// 						{data : "address"},
// 						{data : "typeOfBusiness"},
// 						{data : "positionOfEmployer"},
// 						{data : "supervisor"},
// 						{data : "salary"},
// 						{data : "description"},
// 						{data : "reason"}],
// >>>>>>> Edit AddressRepository.java, AddressRepositoryImpl.java, ExperienceRepository.java, /ExperienceRepositoryImpl.java, ReferenceRepository.java, ReferenceRepositoryImpl.java, ReferenceService.java, ReferenceServiceImpl.java, ApplicationController.java, address.jsp, applicationMenu.jsp, applications.jsp, experiences.jsp
			searching : false

		});
		$('#experiencesSave').on("click", function() {
// 			if ($('#experiencesForm').valid()) { 
			var table = $('#experiencesTable').DataTable();

			table.row.add({
				position : $('#workBackground').val(),
				fromDate : $('#fromWorkYear').val(),
				toDate : $('#toWorkYear').val(),
				employerName : $('#emp').val(),
				address : $('#addressBackground').val(),
				typeOfBusiness : $('#business').val(),
				positionOfEmployer : $('#positionBackground').val(),
				supervisor : $('#supervisorBackground').val(),
				salary : $('#salaryBackground').val(),
				description : $('#descriptionBackground').val(),
				reason : $('#reasonLeaving').val()
			}).draw();
			$('#experiencesModal').modal('hide');
// 			};
		}) 
// <<<<<<< HEAD
		$('#experiencesSave').on("click", function() {
// =======
// 		$('#buttonSave').on("click", function() {
// 		 	if ($('#previousEmployers').valid()) { 

// >>>>>>> Edit AddressRepository.java, AddressRepositoryImpl.java, ExperienceRepository.java, /ExperienceRepositoryImpl.java, ReferenceRepository.java, ReferenceRepositoryImpl.java, ReferenceService.java, ReferenceServiceImpl.java, ApplicationController.java, address.jsp, applicationMenu.jsp, applications.jsp, experiences.jsp
		var insertData = "{";
			
			insertData+="experiences : [ ";
			var experiencesTable = $("#experiencesTable").DataTable();
			
			experiencesTable.rows().iterator( 'row', function ( context, index ) {
			insertData+="{";
			insertData+="applicant : {id :"+$('#applicant').val()+"},";
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
				insertData+="]}";
			
			$.ajax({
				contentType : "application/json",
				type : "POST",
				url : '${pageContext.request.contextPath}/saveExperiences',
				data : JSON.stringify(eval("(" + insertData + ")")),
				success : function(data) {
					alert(JSON.stringify(data));

					new PNotify({
				        title: 'Success',
				        text: 'Successful Add Experience!!!',
				        type: 'success',
				        nonblock: {
				            nonblock: true,
				            nonblock_opacity: .2
				        }
				    });
				}
			});
		})
		
		//Find by Id
		function findById(id){
			$.ajax({
				url : "${pageContext.request.contextPath}/findAddressId/" + id,
				type : "POST",
				success : function(data){
					showFillData(data);
				}
			});
		}
		
		//Show data on inputField
		function showFillData(data){
// 			$('#inputAddress').val(data.addressType);
			$("#houseNoId").val(data.houseNo);
			$("#roadId").val(data.road);
			$("#districtId").val(data.district);
			$("#subDistrictId").val(data.subDistrict);
			$("#zipcodeId").val(data.zipcode);
			console.log(data.houseNo);
			
			$("#provinceId").val(data.province);
		}

	});
</script>
<jsp:include page = "applicationMenu.jsp"/>
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
								<input type="hidden" id="applicant" name="applicant"
									value="${id}">
							</div>

							<div class="form-group">
								<label for="workBackground">Present or last position </label> <input
									type="text" class="form-control" id="workBackground"
									name="workBackground"
									placeholder="Enter present or last position ">
							</div>

							<div class="form-group">
								<label for="fromWorkYear"><span
									class="glyphicon glyphicon-calendar"></span>From (month, year)
								</label>
								<div class="input-group date">
									<input type="text" id="fromWorkYear" name="fromWorkYear"
										class="form-control"><span class="input-group-addon"><i
										class="glyphicon glyphicon-th"></i></span>
								</div>

							</div>

							<div class="form-group">
								<label for="toWorkYear"><span
									class="glyphicon glyphicon-calendar"></span>To (month, year) </label>
								<div class="input-group date">
									<input type="text" id="toWorkYear" name="toWorkYear"
										class="form-control"><span class="input-group-addon"><i
										class="glyphicon glyphicon-th"></i></span>
								</div>


							</div>
							<div class="form-group">
								<label for="emp">Employer Name </label> <input type="text"
									class="form-control" id="emp" name="emp"
									placeholder="Enter employer name ">
							</div>

							<div class="form-group">
								<label for="addressBackground">Address </label>
								<textarea class="form-control" rows="5" id="addressBackground"
									name="addressBackground" placeholder="Enter address"></textarea>

							</div>

							<div class="form-group">
								<label for="business">Type of business </label> <input
									type="text" class="form-control" id="business"
									name="business" placeholder="Enter type of business ">
							</div>

							<div class="form-group">
								<label for="positionBackground">Position </label> <input
									type="text" class="form-control" id="positionBackground"
									name="positionBackground" placeholder="Enter position ">
							</div>

							<div class="form-group">
								<label for="supervisorBackground">Supervisor </label> <input
									type="text" class="form-control" id="supervisorBackground"
									name="supervisorBackground" placeholder="Enter supervisor">
							</div>

							<div class="form-group">
								<label for="salaryBackground">Salary ,Wages </label> <input
									type="text" class="form-control" id="salaryBackground"
									name="salaryBackground" placeholder="Enter salary ,wages ">
							</div>

							<div class="form-group">
								<label for="descriptionBackground">Description of duties
									and responsibilities </label>
								<textarea class="form-control" rows="5"
									id="descriptionBackground" name="descriptionBackground"
									placeholder="Enter description of duties and responsibilities"></textarea>
							</div>

							<div class="form-group">
								<label for="reasonLeaving">Reason for leaving </label>
								<textarea class="form-control" rows="5" id="reasonLeaving"
									name="reasonLeaving" placeholder="Enter reason for leaving"></textarea>

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
					<th>Edit</th>
                	<th>Delete</th>
				</tr>
			</thead>


			<tbody></tbody>
		</table>
	</div>
