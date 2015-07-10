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
			format : "dd/mm/yyyy",
			autoclose: true 
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
				required : "<spring:message code="valid.ex.pre"/>"
			},
			fromWorkYear : {
				required : "<spring:message code="valid.ex.from"/>"
			},
			toWorkYear : {
				required : "<spring:message code="valid.ex.to"/>"
			},
			emp : {
				required : "<spring:message code="valid.ex.emp"/>"
			},
			addressBackground : {
				required : "<spring:message code="valid.addr.addr"/>"
			},
			business : {
				required : "<spring:message code="valid.ex.type"/>"
			},
			positionBackground : {
				required : "<spring:message code="valid.ex.position"/>"
			},
			supervisorBackground : {
				required : "<spring:message code="valid.ex.supervisor"/>"
			},
			salaryBackground : {
				required : "<spring:message code="valid.ex.salary"/>"
			},
			descriptionBackground : {
				required : "<spring:message code="valid.ex.des"/>"
			},
			reasonLeaving : {
				required : "<spring:message code="valid.ex.reason"/>"
			}
		}
	});
		
	var dtApplicant;
		
	if(dtApplicant) {
		dtApplicant.ajax.reload();
	}
	else {
		var id = '${id}';
		dtApplicant = $('#experiencesTable').DataTable({
			ajax : {
				url : '${pageContext.request.contextPath}/findByIdExperience/' + id,
				type : 'POST'
			},
			columns : [ {data : "position"},
			            {data : "fromDate"},
			            {data : "toDate"},
			            {data : "employerName"},
			            {data : "address"},
			            {data : "typeOfBusiness"},
			            {data : "positionOfEmployer"},
			            {data : "supervisor"},
			            {data : "salary"},
			            {data : "description"},
			            {data : "reason"},
			            {data : function(data) {
				 			return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#experiencesModal" class="btn btn-warning btn-mini"><span class="glyphicon glyphicon-pencil"></span> <spring:message code="main.edit.info"/></button>';
						}},
						{data : function(data) {
				 			return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal" class="btn btn-danger btn-mini"><span class="glyphicon glyphicon-remove-sign"></span> <spring:message code="main.delete"/></button>';
						}}],
			searching : false

		});
	
	}
		
	function saveExperience(){
		if ($('#experiencesForm').valid()) {
		var id = '${id}';
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
				"applicant" : {"id" : id},
				"position" : position,
				"fromDate" : fromDate,
				"toDate" : toDate,
				"employerName" : employerName,
				"address" : address,
				"typeOfBusiness" : typeOfBusiness,
				"positionOfEmployer" : positionOfEmployer,
				"supervisor" : supervisor,
				"salary" : salary,
				"description" : description,
				"reason" : reason
				};
		
		$.ajax({
			contentType : "application/json",
			type : "POST",
			url : '${pageContext.request.contextPath}/experiences/' +id,
			data : JSON.stringify(json),
			success : function(data) {
				$('#experiencesModal').modal('hide');
				dtApplicant.ajax.reload();
				
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
		};
		
	}
		
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
			if ($('#experiencesForm').valid()) {
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
				 	
					d.position = data.position;
					d.fromDate = data.fromDate;
					d.toDate = data.toDate;
					d.employerName = data.employerName;
					d.address = data.address;
					d.fromDate = data.fromDate;
					d.typeOfBusiness = data.typeOfBusiness;
					d.positionOfEmployer = data.positionOfEmployer;
					d.reason = data.reason;
					d.supervisor = data.supervisor;
					d.salary = data.salary;
					d.description = data.description;
				 	
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
			};
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
	            url: "${pageContext.request.contextPath}/deleteExperience/" + id,
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
				}else{
					$('#experiencesForm')[0].reset();
					$('#btn_save').off('click').on('click', function(id){
						saveExperience();
					});
				}

			}
	   });

	});
</script>
<jsp:include page = "applicationMenu.jsp"/>
	<div class="form-group">
		<label for="experiences"><spring:message code="exp.text"/> </label>
	</div>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h1><spring:message code="exp.name"/></h1>
				<button class="btn btn-primary" id="experiencesAdd"
					data-toggle="modal" data-target="#experiencesModal">
					<span class="glyphicon glyphicon-plus"></span> <spring:message code="exp.name.add"/>
				</button>
			</div>
		</div>
		<div class="modal fade" id="experiencesModal" role="dialog">
			<div class="modal-dialog">

				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> <spring:message code="exp.name"/>
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" id="experiencesForm">
							<div class="form-group">
								<input type="hidden" id="applicant" name="applicant"
									value="${id}">
							</div>

							<div class="form-group">
								<label for="workBackground"><spring:message code="exp.position"/> </label> <input
									type="text" class="form-control" id="workBackground"
									name="workBackground"
									placeholder="<spring:message code="exp.text.Pposition"/> ">
							</div>

							<div class="form-group">
								<label for="fromWorkYear"><span
									class="glyphicon glyphicon-calendar"></span><spring:message code="exp.from"/>
								</label>
								<div class="input-group date">
									<input type="text" id="fromWorkYear" name="fromWorkYear"
										class="form-control"><span class="input-group-addon"><i
										class="glyphicon glyphicon-th"></i></span>
								</div>

							</div>

							<div class="form-group">
								<label for="toWorkYear"><span
									class="glyphicon glyphicon-calendar"></span><spring:message code="exp.to"/> </label>
								<div class="input-group date">
									<input type="text" id="toWorkYear" name="toWorkYear"
										class="form-control"><span class="input-group-addon"><i
										class="glyphicon glyphicon-th"></i></span>
								</div>


							</div>
							<div class="form-group">
								<label for="emp"><spring:message code="exp.emp"/> </label> <input type="text"
									class="form-control" id="emp" name="emp"
									placeholder="<spring:message code="exp.text.emp"/> ">
							</div>

							<div class="form-group">
								<label for="addressBackground"><spring:message code="address.name"/> </label>
								<textarea class="form-control" rows="5" id="addressBackground"
									name="addressBackground" placeholder="<spring:message code="exp.text.address"/>"></textarea>

							</div>

							<div class="form-group">
								<label for="business"><spring:message code="exp.business"/> </label> <input
									type="text" class="form-control" id="business"
									name="business" placeholder="<spring:message code="exp.text.business"/> ">
							</div>

							<div class="form-group">
								<label for="positionBackground"><spring:message code="info.position"/> </label> <input
									type="text" class="form-control" id="positionBackground"
									name="positionBackground" placeholder="<spring:message code="exp.text.position"/> ">
							</div>

							<div class="form-group">
								<label for="supervisorBackground"><spring:message code="exp.supervisor"/> </label> <input
									type="text" class="form-control" id="supervisorBackground"
									name="supervisorBackground" placeholder="<spring:message code="exp.text.supervisor"/>">
							</div>

							<div class="form-group">
								<label for="salaryBackground"><spring:message code="exp.salary"/> </label> <input
									type="text" class="form-control" id="salaryBackground"
									name="salaryBackground" placeholder="<spring:message code="exp.text.salary"/> ">
							</div>

							<div class="form-group">
								<label for="descriptionBackground"><spring:message code="exp.desc"/> </label>
								<textarea class="form-control" rows="5"
									id="descriptionBackground" name="descriptionBackground"
									placeholder="<spring:message code="exp.text.desc"/>"></textarea>
							</div>

							<div class="form-group">
								<label for="reasonLeaving"><spring:message code="exp.reason"/> </label>
								<textarea class="form-control" rows="5" id="reasonLeaving"
									name="reasonLeaving" placeholder="<spring:message code="exp.text.reason"/>"></textarea>

							</div>
							<br> <br>
							<button type="button" class="btn btn-success"
								id="btn_save">
								<span class="glyphicon glyphicon-off"></span> <spring:message code="edit.button.save"/>
							</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal"><spring:message code="button.cancel"/></button>
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
					<th><spring:message code="exp.data.position"/></th>
					<th><spring:message code="exp.data.from"/></th>
					<th><spring:message code="exp.data.to"/></th>
					<th><spring:message code="exp.data.emp"/></th>
					<th><spring:message code="family.data.address"/></th>
					<th><spring:message code="exp.data.business"/></th>
					<th><spring:message code="exp.data.position.emp"/></th>
					<th><spring:message code="exp.data.super"/></th>
					<th><spring:message code="exp.data.salary"/></th>
					<th><spring:message code="exp.data.desc"/></th>
					<th><spring:message code="exp.data.reason"/></th>
					<th><spring:message code="main.edit.info"/></th>
                	<th><spring:message code="main.delete"/></th>
				</tr>
			</thead>


			<tbody></tbody>
		</table>
	</div>
