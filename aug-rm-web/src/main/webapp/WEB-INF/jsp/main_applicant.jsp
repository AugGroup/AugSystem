<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%><html>

	<script type="text/javascript">
		$(document).ready(function(){
			var dtApplicant
			//Search and Show function 
			$('#btn_search').on('click', function(){
				if(dtApplicant){
					dtApplicant.ajax.reload();
				}else{
					dtApplicant = $('#dataTable').DataTable({
						lengthChange : false,
						searching : false,
						ajax : {
							url : '${pageContext.request.contextPath}/search',
							type : 'GET',
							data : function(d){
								d.position = $('#inputSearch').val();
								
								
							}
						},
						columns:[{'data': "code"},
						         {'data': "applyDate"},
						         {'data' : "firstNameEN"},
						         {'data' : "position1"},
						         {'data' : "position2"},
						         {'data' : "position3"},
						         {'data' : "trackingStatus"},
						         { data : function(data){
						        	 return '<a href="#EditStatusModal" id="btn_table_edit"  data-toggle="modal" class="btn btn-sm btn-warning">Edit Score</b>'
						        	 //data-id="'+data.id+'"
						        	}},
						        	{ data : function(data){
							        	 return '<a href="#" id="btn_table_edit"  data-toggle="modal" class="btn btn-sm btn-warning">Edit Info</b>'
							        	 //data-id="'+data.id+'"
							        	}}
						        ]
					});
				}
			});
			
			
		});
	
	</script>
	
	
	<div class="container">
		<!--Input text for Search Applicant -->
		<div class="row">
			<div class="col-lg-9"></div>
			<div class="col-lg-3">
				<div class="input-group">
					<input type="text" class="form-control" id="inputSearch" placeholder="Search ?"/>
					<span class="input-group-btn">
						<button class="btn btn-default" id="btn_search" type="button"> Search </button>
					</span>
				</div>
			</div>
		</div>
		<!--Data Table for Applicant List -->		
		<div class="row">
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
		<div class="row">
			<div class="col-lg-6"></div>
			<div class="col-lg-6">
				<a href="#" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> Add New Applicant</a>
			</div>
		</div>
		
		<!-- Modal -->	
		<a href="#EditStatusModal" id="btn_register" class="btn btn-primary" data-toggle="modal"><span class="glyphicon glyphicon-plus-sign"></span> Edit Status </a>
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
							<div class="form-group">
								<label for="inputScore">Score</label> 
								<input type="text" class="form-control" id="inputScore" name="inputScore" placeholder="Enter score">
    						</div>
							<div class="form-group">
								<label for="nameTechScore">Technical Score :  </label>
								<label class="radio-inline">
								    <input type="radio" value="pass" name="inputTechScore">Pass
								</label>
								<label class="radio-inline">
								    <input type="radio" value="Not pass" name="inputTechScore">Not Pass
								</label>
    						</div>
							<div class="form-group">
								<label for="inputScore">Attitude Score</label>
    							<select name="inputScore" id="inputScore" class="form-control">
    								<c:forEach items="${departments}" var="items">
    									<option value="${items.deptId}">${items.dName }</option>
    								</c:forEach>
    							</select>
    						</div>
							<div class="form-group">
								<label for="inputStatus">Applicant Status</label>
    							<select name="inputStatus" id="inputStatus" class="form-control">
    								<c:forEach items="${departments}" var="items">
    									<option value="${items.deptId}">${items.dName }</option>
    								</c:forEach>
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
		
	</div>
