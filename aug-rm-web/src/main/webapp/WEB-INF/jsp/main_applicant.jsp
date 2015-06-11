<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>



<style type="text/css">

#search_row{
	margin: 30px;
}

</style>

	<script type="text/javascript">
		$(document).ready(function(){
			var dtApplicant
		 	//show all applicant
			$('#dataTable').DataTable({
				ajax : {url : '${pageContext.request.contextPath}/search',
						type : 'GET'},
				columns:[{'data': "code"},
						{'data': "applyDate"},
						{'data' : "firstNameEN"},
						{'data' : "position1Str"},
						{'data' : "position2Str"},
						{'data' : "position3Str"},
						{'data' : "trackingStatus"},
						{ data : function(data){
							return '<a href="#EditStatusModal" id="btn_edit_score" data-id="'+data.id+'" data-toggle="modal" class="btn btn-sm btn-warning">Edit Score</b>'
						 }},
						{ data : function(data){
						       return '<a href="#" id="btn_edit_info"  data-toggle="modal" class="btn btn-sm btn-warning">Edit Info</b>'
						 }}
					 ]
				
			}); 
			
			 //Search By Position and Show function 
			$('#btn_search').off('click').on('click', function(){
				if(dtApplicant){
					dtApplicant.ajax.reload();
				}else{
					dtApplicant = $('#dataTable').DataTable({
						lengthChange : false,
						searching : false,
						ajax : {
							url : '${pageContext.request.contextPath}/searchByPosition',
							type : 'GET',
							data : function(d){
								d.position = $('#inputSearch').val();
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
						        	 return '<a href="#EditStatusModal" id="btn_edit_score" data-id="'+data.id+'" data-toggle="modal" class="btn btn-sm btn-warning">Edit Score</b>'
						        	}},
						         { data : function(data){
						        	 return '<a href="#" id="btn_edit_info"  data-id="'+data.id+'" data-toggle="modal" class="btn btn-sm btn-warning">Edit Info</b>'
						        	 }}
						        ]
					});
				}
			});
			
			//Find by Id
			function findById(id){
				console.log(id);
				$.ajax({
					url : "${pageContext.request.contextPath}/findById/" + id,
					type : "POST",
					success : function(data){
						showFillData(data);
						}
					});
				}
			
			//Show data on inputField
			function showFillData(data){
				$("#inputScore").val(data.score);
				$("#inputTechScore").val(data.techScore);
				$("#inputAttitudeHome").val(data.attitudeHome);
				$("#inputAttitudeOffice").val(data.attitudeOffice);
				$("#inputStatus").val(data.trackingStatus);
				
			}
			//Update Score Fuction
			function updateUser(button){
				var id = $(button).data("id");
				var score = $("#inputScore").val();
				var techScore = $('input[name="inputTechScore"]:checked').val();
				var attitudeHome = $("#inputAttitudeHome").val();
				var attitudeOffice = $("#inputAttitudeOffice").val();
				var trackingStatus = $("#inputStatus").val(); 
				console.log(techScore)
				var json = {
						"id" : id,
						"score" : score,
						"techScore" : techScore,
						"attitudeHome" : attitudeHome,
						"attitudeOffice" : attitudeOffice,
						"trackingStatus" : trackingStatus
						};
				$.ajax({
					url : "${pageContext.request.contextPath}/score/update/"+id,
					type : "POST",
					contentType :"application/json; charset=utf-8", 
					data : JSON.stringify(json),
					success : function(data){
						console.log(data.id);
						$('#myModal1').modal('hide');
						
						var table = $('#dataTable').DataTable();	
					 	var rowData = table.row(button.closest('tr')).index(); 
					 	var d = table.row(rowData).data();
					 		d.score = data.score;
							d.techScore = data.techScore;
					 		d.attitudeHome = data.attitudeHome;
					 		d.attitudeOffice = data.attitudeOffice;
					 		d.trackingStatus = data.trackingStatus;
					 		
					 		table.row(rowData).data(d).draw();
					 						 		
					 		}
					});
				
			}
			
			//EditStatusModal
		 	$('#EditStatusModal').on( 'show.bs.modal',function(e){
				var button = e.relatedTarget;
				if (button != null){
					var applicantId = $(button).data("id");
					if(applicantId != null){
						findById(applicantId);
						console.log(applicantId);
						
						$("#btn_submit").off("click").on("click", function(){
							updateUser(button);
							});
					}
				}
			});
		});
	
	</script>
	
	
	<div class="container">
		<!--Input text for Search Applicant -->
		<div class="row" id="search_row">
			<div class="col-lg-8"></div>
			<div class="col-lg-4">
				<div class="input-group">
					<input type="text" class="form-control" id="inputSearch" placeholder="- Enter position -"/>
					<span class="input-group-btn">
						<button type="button" class="btn btn-primary" id="btn_search"><span class="glyphicon glyphicon-search"></span> Search</button>				
					</span>
				</div>
			</div>
		</div>
		<!--Data Table for Applicant List -->		
		<div class="row" id="dataTable_row">
			<div class="col-lg-12">
				<table id="dataTable" class="cell-border" cellspacing="0" width="90%">
					<thead>
						<tr>
							<th>ID Code</th>
							<th>Date</th>
							<th>Name</th>
							<th>Position1</th>
							<th>Position2</th>
							<th>Position3</th>
							<th>Status</th>
							<th>Edit </th>
							<th>Edit Info</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		<form class="form-inline" id="applicantForm" action="${pageContext.request.contextPath}/application" method="get">
		<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_STAFF')">
		<div class="row">
			<div class="col-lg-6"></div>
			<div class="col-lg-6">
				<button type="submit" id="btn_add" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Add New Applicant</button>
			</div>
		</div>
		</sec:authorize>
		</form>
		
		<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_STAFF')">
		<!-- Modal of Edit Status and Score-->	
		<div id="EditStatusModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title">Edit Applicant Status</h4>
					</div>
					<div class="modal-body">
						<h5>Score Details</h5>
						<form role="form" id="EditStatusForm">
							<div class="form-group" style="width:200px ">
								<label for="inputScore">Score</label> 
								<input type="text" class="form-control" id="inputScore" name="inputScore" placeholder="Enter score">
    						</div>
							<div class="form-group">
								<label for="nameTechScore">Technical Score :  </label>
								<label class="radio-inline">
								    <input type="radio" value="pass" id="inputTechScore" name="inputTechScore">Pass
								</label>
								<label class="radio-inline">
								    <input type="radio" value="Not pass" id="inputTechScore" name="inputTechScore">Not Pass
								</label>
    						</div>
							<div class="form-group">
								<label for="inputScore">Attitude Score : </label>
    							<div class="form-group" class="form-inline" style="width: 400px" >
									<div class="row">
										<div class="col-lg-6">
										<label for="inputAttitudeHome">Home</label> 
										<input type="text" class="form-control" id="inputAttitudeHome" name="inputAttitudeHome" placeholder="Enter score">  													
										</div>
										<div class="col-lg-6">
									<label for="inputAttitudeOffice">Office</label> 
									<input type="text" class="form-control" id="inputAttitudeOffice" name="inputAttitudeOffice" placeholder="Enter score">
    							</div>
    							</div>
    							</div>
    						</div>
							<div class="form-group">
								<label for="inputStatus">Applicant Status : </label>
    							<select name="inputStatus" id="inputStatus" class="form-control">
    								<option value="Waiting for consider">Waiting for consider</option>
    								<option value="Pending Test">Pending Test</option>
    								<option value="Pending Interview">Pending Interview</option>
    								<option value="Pending Approve">Pending Approve</option>
    								<option value="Approve">Approve</option>
    								<option value="Not Approve">Not Approve</option>
    							</select>
    						</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="alert">Save</button>
    					<button type="button"  class="btn btn-default" data-dismiss="modal">Cancel</button>
    				</div>
				</div>
			</div>
		</div>
		</sec:authorize>
		
	</div>
