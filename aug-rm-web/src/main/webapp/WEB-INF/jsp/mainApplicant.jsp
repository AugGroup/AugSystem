<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<style type="text/css">

#search_row {
	margin: 30px;
}

</style>

<script type="text/javascript">
	$(document).ready(function(){
		var dtApplicant
		/* $('#EditStatusForm').validate({
			rules:{
				inputRequesterName:{required: true},
				inputScore:{required: true},
				inputTechScore:{required: true},
			  	inputAttitudeHome:{required: true},
			  	inputAttitudeOffice:{required: true},
			  	inputStatus:{required: true}
			  	},
			messages: {
				inputRequesterName:{required: "Requester name is required"},
			  	inputScore:{required: "Score is required"},
			  	inputTechScore:{required: "Technical score is required"},
			  	inputAttitudeHome:{required: "Attitude at home is required"},
			  	inputAttitudeOffice:{required: "Attitude at office is required"},
			  	inputStatus:{required: "Request status is required"}
			  	}
		}); */
		
		//Search By Position and Show function 
		$('#btn_search').on('click', function(){
			if(dtApplicant){
				dtApplicant.ajax.reload();
			}else{
				dtApplicant = $('#dataTable').DataTable({
					searching : true,
					paging: true,
					hover:false,
					sort:false,
					ajax : {
						url : '${pageContext.request.contextPath}/applicant/search',
						type : 'POST',
						data : function(d){
							d.position = $('#inputSearch').val();
							/* console.log(d.position) */
						},
					},
					columns:[{'data': "code"},
					         {'data': "applyDate"},
					         {'data' : "firstNameEN"},
					         {'data' : "position1Str"},
					         {'data' : "position2Str"},
					         {'data' : "position3Str"},
					         {'data' : "trackingStatus"},
					         { data : function(data){
					        	 return '<a href="#EditStatusModal" id="btn_edit_score" data-id="'+data.id+'" data-toggle="modal" class="btn btn-sm btn-warning"><span class="glyphicon glyphicon-pencil"></span> <spring:message code="edit.button.edit.score"/></b>'
					        	 }},
					         { data : function(data){
						    	 return '<a href="${pageContext.request.contextPath}/info/' + data.id + '" id="btn_edit_info"  data-id="'+data.id+'" data-toggle="modal" class="btn btn-sm btn-warning"><span class="glyphicon glyphicon-pencil"></span> <spring:message code="main.edit.info"/></b>'
						    	 }},
						     { data: function (data) {
						    	 return '<a href="#deleteModal" id="btn_delete" data-id="' + data.id + '" data-toggle="modal" class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-remove-sign"></span> <spring:message code="main.delete"/></b>'
				                 }}
						    ]
					});
				}
			});
		
		//EditStatusModal
		$('#EditStatusModal').on('show.bs.modal',function(e){
			var button = e.relatedTarget;
			if (button != null){
				var applicantId = $(button).data("id");
				if(applicantId != null){
					findById(applicantId);
					/* console.log(applicantId); */
					$("#btn_submit").off("click").on("click", function(){
						updateUser(button);
						});
					}
				}
			});
		
		//Find by Id
		function findById(id){
			/* console.log(id); */
			$.ajax({
				url : "${pageContext.request.contextPath}/applicant/search/" + id,
				type : "POST",
				success : function(data){
				showFillData(data);
				}
			});
		}
		
		//Show data on inputField
		function showFillData(data){
			$('#EditStatusForm')[0].reset();
			$('#inputScore').val(data.score);
			$('input[name="inputTechScore"][value='+data.techScore+']').prop('checked', true);
			$('#inputAttitudeHome').val(data.attitudeHome);
			$('#inputAttitudeOffice').val(data.attitudeOffice);
			$('#inputStatus').val(data.trackingStatus);
		}
		
		//Update Score Fuction
		function updateUser(button){
			var id = $(button).data("id");
			var score = $("#inputScore").val();
			var techScore = $('input[name="inputTechScore"]:checked').val();
			var attitudeHome = $("#inputAttitudeHome").val();
			var attitudeOffice = $("#inputAttitudeOffice").val();
			var trackingStatus = $("#inputStatus").val(); 
			var json = {
					"id" : id,
					"score" : score,
					"techScore" : techScore,
					"attitudeHome" : attitudeHome,
					"attitudeOffice" : attitudeOffice,
					"trackingStatus" : trackingStatus
					};
			if($("#EditStatusForm").valid()){
				$.ajax({
					url : "${pageContext.request.contextPath}/update/score/"+id,
					type : "POST",
					contentType :"application/json; charset=utf-8", 
					data : JSON.stringify(json),
					success : function(data){
						$('#EditStatusModal').modal('hide');
						var table = $('#dataTable').DataTable();	
					 	var rowData = table.row(button.closest('tr')).index(); 
					 	var d = table.row(rowData).data();
					 	d.score = data.score;
					 	d.techScore = data.techScore;
					 	d.attitudeHome = data.attitudeHome;
					 	d.attitudeOffice = data.attitudeOffice;
					 	d.trackingStatus = data.trackingStatus;
					 	table.row(rowData).data(d).draw();
					 	
					 	new PNotify({
					 		title: 'Edit score is successful',
					 		text: '',
					 		type: 'success',
					 		delay: 10000,
					 		buttons:{
					 			closer_hover: false,
					 			sticker: false
					 			}
					 	});
					}
				});
			}
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
		
		//delete function
		function deleted(button) {
			var dtApplicant = $('#dataTable').DataTable();
			var id = $(button).data("id");
			var index = dtApplicant.row(button.closest("tr")).index();
			$.ajax({
				url: "${pageContext.request.contextPath}/delete/" + id,
	            type: "POST",
	            success: function () {
	            	dtApplicant.row(index).remove().draw();
	            	new PNotify({
	            		title: 'Delete Success',
						text: 'You can delete data',
						type: 'success',
					    delay: 10000,
					    buttons:{
					    	closer_hover: false,
					        sticker: false
					    }
	            	});
	            }
			});
		}
		
		$('#btn_search').trigger("click");
		
	});
	
</script>
<div class="container">
	<!--Input text for Search Applicant -->
	<div class="row" id="search_row">
		<div class="col-md-8"></div>
		<div class="col-md-4">
			<div class="input-group">
				<input type="text" class="form-control" id="inputSearch"
					placeholder="<spring:message code="main.text.field"/>" /> <span
					class="input-group-btn">
					<button type="button" class="btn btn-primary" id="btn_search">
						<span class="glyphicon glyphicon-search"></span>
						<spring:message code="main.button.search" />
					</button>
				</span>
			</div>
		</div>
	</div>
	<!--Data Table for Applicant List -->
	<c:set var="ss" value="display:none;"></c:set>
	<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_STAFF')">
		<div id="table">
			<table  class="dataTable" id="dataTable" class="cell-border" style="width: 100%" >
				<thead>
					<tr>
						<th><spring:message code="main.code" /></th>
						<th><spring:message code="main.date" /></th>
						<th><spring:message code="main.name" /></th>
						<th><spring:message code="main.position1" /></th>
						<th><spring:message code="main.position2" /></th>
						<th><spring:message code="main.position3" /></th>
						<th><spring:message code="main.status" /></th>
						<th><spring:message code="main.edit" /></th>
						<th><spring:message code="main.edit.info" /></th>
						<th><spring:message code="main.delete" /></th>
					</tr>
				</thead>
			</table>
			<a type="submit" id="btn_new_app" class="btn btn-warning" href="${pageContext.request.contextPath}/informations">
			<span class="glyphicon glyphicon-plus"></span> <spring:message code="main.button.add" /></a>
		</div>
	</sec:authorize>


	<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_STAFF')">
		<!-- Modal of Edit Status and Score-->
		<div id="EditStatusModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title"><spring:message code="edit.title" /> </h4>
					</div>
					<div class="modal-body">
						<h5> <spring:message code="edit.score.detail" /></h5>
						<form role="form" id="EditStatusForm">
							<div class="form-group" style="width: 200px">
								<label for="inputScore"><spring:message code="edit.score" /></label> 
								<input type="text" class="form-control" id="inputScore" name="inputScore" placeholder="<spring:message code="edit.text.feild"/>">
							</div>
							<div class="form-group">
								<label for="nameTechScore"><spring:message code="edit.tech.score" /></label>
								<label class="radio-inline"> <input type="radio" value="Pass" id="inputTechScore" name="inputTechScore">
								<spring:message code="edit.radio.pass" /></label>
								<label class="radio-inline"> <input type="radio" value="Not" id="inputTechScore" name="inputTechScore">
								<spring:message code="edit.radio.notPass" /></label>
							</div>
							<div class="form-group">
								<label for="inputScore"><spring:message code="edit.attitude.score" /> </label>
								<div class="form-group" class="form-inline" style="width: 400px">
									<div class="row">
										<div class="col-md-6">
											<label for="inputAttitudeHome"><spring:message code="edit.attitude.home" /></label> 
											<input type="text" class="form-control" id="inputAttitudeHome" name="inputAttitudeHome" placeholder="<spring:message code="edit.text.feild"/>">
										</div>
										<div class="col-md-6">
											<label for="inputAttitudeOffice"><spring:message code="edit.attitude.office" /></label> 
											<input type="text" class="form-control" id="inputAttitudeOffice" name="inputAttitudeOffice" placeholder="<spring:message code="edit.text.feild"/>">
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="inputStatus"><spring:message code="edit.status" /></label> 
								<select name="inputStatus" id="inputStatus" class="form-control">
									<option value="Waiting for consider"><spring:message code="edit.wait.consider" /></option>
									<option value="Pending Test"><spring:message code="edit.pending.test" /></option>
									<option value="Pending Interview"><spring:message code="edit.pending.interview" /></option>
									<option value="Pending Approve"><spring:message code="edit.pending.approve" /></option>
									<option value="Approve"><spring:message code="edit.approve" /></option>
									<option value="Not Approve"><spring:message code="edit.notApprove" /></option>
								</select>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="alert"><spring:message code="edit.button.save" /></button>
						<button type="button" id="btn_close" class="btn btn-default" data-dismiss="modal"><spring:message code="button.cancel" /></button>
					</div>
				</div>
			</div>
		</div>
	</sec:authorize>

	<!-- Delete Model -->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
		aria-labelledby="ModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="ModalLabel"><spring:message code="delete.title" /></h4>
				</div>
				<div class="modal-body">
					<h4 class="modal-title" id="ModalLabel"><spring:message code="delete.confirm.title" /></h4><br>
					<div align="right">
						<button id="btn_delete_submit" type="button" class="btn btn-danger" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove-sign"></span><spring:message code="main.delete" />
						</button>
						<button id="btn_close" type="button" class="btn btn-default" data-dismiss="modal">
							<spring:message code="button.cancel" />
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>