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
		
		var dtApplicant;
		
		$('.input-group.date').datepicker({
			startView : 2,
			todayBtn : "linked",
			format : "dd/mm/yyyy"

		});
		
	 	$('#experiencesForm').validate({
			rules : {
				workBackground : {
					required : true,
				},
				fromWorkYear : {
					required : true,
				},
				toWorkYear : {
					required : true,
				},
				emp : {
					required : true,
				},
				addressBackground : {
					required : true,
				},
				business : {
					required : true,
				},
				positionBackground : {
					required : true,
				},
				supervisorBackground : {
					required : true,
				},
				salaryBackground : {
					required : true,
				},
				descriptionBackground : {
					required : true,
				},
				reasonLeaving : {
					required : true,
				}
			},
			messages : {
				workBackground : {
					required : "Present or last position is required!"
				},
				fromWorkYear : {
					required : "From (month, year) is required!"
				},
				toWorkYear : {
					required : "To (month, year) is required!"
				},
				emp : {
					required : "Employer Name is required!"
				},
				addressBackground : {
					required : "Address is required!"
				},
				business : {
					required : "Type of business is required!"
				},
				positionBackground : {
					required : "Position is required!"
				},
				supervisorBackground : {
					required : "Supervisor is required!"
				},
				salaryBackground : {
					required : "Salary ,Wages is required!"
				},
				descriptionBackground : {
					required : "Description of duties and responsibilities is required!"
				},
				reasonLeaving : {
					required : "Reason for leaving is required!"
				}
			}
		});
		
			if(dtApplicant) {
		dtOrder.ajax.reload();
	}
	else {
	
	var id = '${id}';
		$('#experiencesTable').DataTable({
			ajax : {
				url : '${pageContext.request.contextPath}/findByIdExperience/' + id,
				type : 'POST'
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
			},{ data : function(data) {
				 return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#experiencesModal" class="btn btn-warning btn-mini">' + 'Edit' + '</button>';
			}
			},{ data : function(data) {
				 return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal" class="btn btn-danger btn-mini">' + 'Delete' + '</button>';
			}
		} ],
			searching : false

		});
	}
		$('#experiencesSave').on("click", function() {
 			if ($('#experiencesForm').valid()) { 
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
 			};
		}) 
		
		$('#experiencesSave').on("click", function() {
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
				url : "${pageContext.request.contextPath}/findExperienceId/" + id,
				type : "POST",
				success : function(data){
					showFillData(data);
				}
			});
		}
		
		//Show data on inputField
		function showFillData(data){
			$("#workBackground").val(data.position);
			$("#fromWorkYear").val(data.fromDate);
			$("#toWorkYear").val(data.toDate);
			$("#emp").val(data.employerName);
			$("#addressBackground").val(data.address);

			$("#business").val(data.typeOfBusiness);
			$("#positionBackground").val(data.positionOfEmployer);
			$("#reasonLeaving").val(data.reason);
			$("#supervisorBackground").val(data.supervisor);
			$("#salaryBackground").val(data.salary);
			
			$("#descriptionBackground").val(data.description);
		}
		
		//Update function
		function updated(button){
			var id = $(button).data("id");
			var position = $("#workBackground").val();
			var fromDate = $("#fromWorkYear").val();
			var toDate = $("#toWorkYear").val();
			var employerName = $("#emp").val();
			var address = $("#addressBackground").val();

			var typeOfBusiness = $("#business").val();
			var positionOfEmployer = $("#positionBackground").val();
			var reason = $("#reasonLeaving").val();
			var supervisor = $("#supervisorBackground").val();
			var salary = $("#salaryBackground").val();
			
			var description = $("#descriptionBackground").val();
			
			var json = {
					"id" : id,
					"position" : position,
					"fromDate" : fromDate,
					"toDate" : toDate,
					"employerName" : employerName,
					"address" : address,
					"fromDate" : fromDate,
					"typeOfBusiness" : typeOfBusiness,
					"positionOfEmployer" : positionOfEmployer,
					"reason" : reason,
					"supervisor" : supervisor,
					"salary" : salary,
					"description" : description
					};
			
			$.ajax({
				url : "${pageContext.request.contextPath}/updateExperience/"+id,
				type : "POST",
				contentType :"application/json; charset=utf-8",
				data : JSON.stringify(json),
				success : function(data){
					$('#experiencesModal').modal('hide');
					
					var table = $('#experiencesTable').DataTable();	
				 	var rowData = table.row(button.closest('tr')).index(); 
				 	var d = table.row(rowData).data();
				 	
					d.position = data.position,
					d.fromDate = data.fromDate,
					d.toDate = data.toDate,
					d.employerName = data.employerName,
					d.address = data.address,
					d.fromDate = data.fromDate,
					d.typeOfBusiness = data.typeOfBusiness,
					d.positionOfEmployer = data.positionOfEmployer,
					d.reason = data.reason,
					d.supervisor = data.supervisor,
					d.salary = data.salary,
					d.description = data.description
				 		
				 		table.row(rowData).data(d).draw();
				 		
						new PNotify({
						    title: 'Edit Reference Success!!',
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
		
		  //delete Modal
	    $('#deleteModal').on('shown.bs.modal', function (e) {
	        var button = e.relatedTarget;
	        var id = $(button).data("id");
	        if (id !== null) {
	            $('#btn_delete_submit').off('click').on('click', function () {
	                deleted(button);
	            });
	        }
	    });
		  
	    function deleted(button) {
	        var dtApplicant = $('#experiencesTable').DataTable();
	        var id = $(button).data("id");
	        var index = dtApplicant.row(button.closest("tr")).index();
	        $.ajax({
	            url: "${pageContext.request.contextPath}/deleteSkill/" + id,
	            type: "POST",
	            success: function () {
	            	dtApplicant.row(index).remove().draw();
					new PNotify({
					    title: 'Delete Success',
					    text: 'You can delete data',
					    type: 'success',
					    nonblock: {
					        nonblock: true,
					        nonblock_opacity: .2
					    }
					});
	            }
	        });
	    }

	    $('#experiencesModal').on('shown.bs.modal', function (e) {
	    	var button = e.relatedTarget;
			if(button != null){
				var id = $(button).data("id");
				if(id != null){
					console.log(id);
					findById(id);
					$('#btn_save').off('click').on('click', function(id){
						updated(button);
					});
				}

			}
	   });

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
								id="btn_save">
								<span class="glyphicon glyphicon-off"></span> Save
							</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</form>
					</div>
				</div>
			</div>

		</div>
		
									<!-- Delete Model -->
		<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
    		<div class="modal-dialog">
        		<div class="modal-content">
            		<div class="modal-header">
                		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                		<h4 class="modal-title" id="ModalLabel"><spring:message code="delete.title"/></h4>
            		</div>
            		<div class="modal-body">
                		<h4 class="modal-title" id="ModalLabel"><spring:message code="delete.confirm.title"/></h4>
                		<br>
                		<div align="right">
                			<button  id="btn_delete_submit" type="button" class="btn btn-danger" data-dismiss="modal"><span class="glyphicon glyphicon-remove-sign"></span> <spring:message code="main.delete"/></button>
                			<button  id="btn_close" type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="button.cancel"/></button>
                		</div>
	            	</div>
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
