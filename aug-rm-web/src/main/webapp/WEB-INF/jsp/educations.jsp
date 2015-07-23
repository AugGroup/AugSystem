<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#educations {
	background: #E0DFDD;
}

#educationTable {
	color: #414141;
	background-color: #ababab;
	margin-right: 5px;
}

#educationAdd {
	margin-left: 5px;
}

#table {
	padding: 15px 5px 65px 5px;
	margin-bottom: 100px;
	background: #E0DFDD;;
}

h1 {
	padding-left: 5px;
}
</style>
<script>
	$(document).ready(function() {
		
		$('#educationsForm').validate({
			rules : {
				university : {
					required : true
				},
				degree : {
					required : true
				},
				faculty : {
					required : true
				},
				major : {
					required : true
				},
				gpa : {
					required : true
				},
				graduate : {
					required : true
				}
			},
			messages : {
				university : {
					required : "<spring:message code="valid.ed.univers"/>"
				},
				degree : {
					required : "<spring:message code="valid.ed.degree"/>"
				},
				faculty : {
					required : "<spring:message code="valid.ed.faculty"/>"
				},
				major : {
					required : "<spring:message code="valid.ed.major"/>"
				},
				gpa : {
					required : "<spring:message code="valid.ed.gpa"/>"
				},
				graduate : {
					required : "<spring:message code="valid.ed.year"/>"
				}
			}
		});

		var dtApplicant;
		
		if(dtApplicant){
			dtApplicant.ajax.reload();
		}else{
			var id = '${id}';
			dtApplicant = $('#educationTable').DataTable({
				paging: true,
				hover:false,
				sort:false,
				ajax : {
					url : '${pageContext.request.contextPath}/findByIdEducation/'+ id,
					type : 'POST'
				},

				columns : [ {data : "schoolName"},
				            {data : "degree"}, 
				            {data : "faculty"}, 
				            {data : "major"},
				            {data : "gpa"},
				            {data : "yearsOfGraduate"},
				            {data : function(data) {
								return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#educationModal" class="btn btn-warning btn-mini"><span class="glyphicon glyphicon-pencil"></span> <spring:message code="main.edit.info"/></button>';
							}},
							{data : function(data) {
								return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal" class="btn btn-danger btn-mini"><span class="glyphicon glyphicon-remove-sign"></span> <spring:message code="main.delete"/></button>';
							}}],
				searching : false

			});
		}

		function saveEducation(){
				if ($('#educationsForm').valid()) {
				var id = '${id}'
				var schoolName = $("#university").val();
				var degree = $("#degree").val();
				var faculty = $("#faculty").val();
				var major = $("#major").val();
				var yearsOfGraduate = $("#graduate").val();
				var gpa = $("#gpa").val();
				console.log(id);
				
				var json = {
						"applicant" : {"id" : id},
						"schoolName" : schoolName,
						"degree" : degree,
						"faculty" : faculty,
						"major" : major,
						"yearsOfGraduate" : yearsOfGraduate,
						"gpa" : gpa,
						};
				
	 			$.ajax({
					contentType : "application/json",
					type : "POST",
					url : '${pageContext.request.contextPath}/educations/' + id,
					data : JSON.stringify(json),
					success : function(data) {
						$('#educationModal').modal('hide');
						dtApplicant.ajax.reload();
						
						new PNotify({
					        title: 'Success',
					        text: 'Successful Add Education!!!',
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
				url : "${pageContext.request.contextPath}/findEducationId/" + id,
				type : "POST",
				success : function(data){
					showFillData(data);
				}
			});
		}
		
 		//Show data on inputField
		function showFillData(data){
			$("#university").val(data.schoolName);
			$("#degree").val(data.degree);
			$("#faculty").val(data.faculty);
			$("#major").val(data.major);
			$("#graduate").val(data.yearsOfGraduate);
			$("#gpa").val(data.gpa);
		}
		
		//Update function
		function updated(button){
			if ($('#educationsForm').valid()) {
			var id = $(button).data("id");
			var schoolName = $("#university").val();
			var degree = $("#degree").val();
			var faculty = $("#faculty").val();
			var major = $("#major").val();
			var yearsOfGraduate = $("#graduate").val();
			var gpa = $("#gpa").val();
			console.log(id);
			
			var json = {
					"id" : id,
					"schoolName" : schoolName,
					"degree" : degree,
					"faculty" : faculty,
					"major" : major,
					"yearsOfGraduate" : yearsOfGraduate,
					"gpa" : gpa,
					};
			
			$.ajax({
				url : "${pageContext.request.contextPath}/updateEducations/"+id,
				type : "POST",
				contentType :"application/json; charset=utf-8",
				data : JSON.stringify(json),
				success : function(data){
					$('#educationModal').modal('hide');
					
					var table = $('#educationTable').DataTable();	
				 	var rowData = table.row(button.closest('tr')).index(); 
				 	var d = table.row(rowData).data();
				 		console.log(data.houseNo);

				 		d.schoolName = data.schoolName;
				 		d.degree = data.degree;
						d.faculty = data.faculty;
				 		d.major = data.major;
				 		d.yearsOfGraduate = data.yearsOfGraduate;
				 		d.gpa = data.gpa;
				 		
				 		table.row(rowData).data(d).draw();
				 		
						new PNotify({
						    title: 'Edit Education Success!!',
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
	    
        //delete function 
        function deleted(button) {
            var dtApplicant = $('#educationTable').DataTable();
            var id = $(button).data("id");
            var index = dtApplicant.row(button.closest("tr")).index();
            $.ajax({
                url: "${pageContext.request.contextPath}/deleteEducation/" + id,
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
        
        $('#educationModal').on('shown.bs.modal', function (e) {
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
					$('#educationsForm')[0].reset();
					$('#btn_save').off('click').on('click', function(id){
						saveEducation();
					});
				}

			}
       });
});
</script>
<jsp:include page="applicationMenu.jsp" />
<div class="container" id="educations">
	<div class="row">
		<div class="col-md-6">
			<h1>
				<spring:message code="education.name" />
			</h1>
			<button class="btn btn-primary" id="educationAdd" data-toggle="modal"
				data-target="#educationModal">
				<span class="glyphicon glyphicon-plus"></span>
				<spring:message code="education.name.add" />
			</button>
		</div>
	</div>

	<div class="modal fade" id="educationModal" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-lock"></span>
						<spring:message code="education.name" />
					</h4>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form" id="educationsForm">
						<div id="educations">
							<div class="form-group">
								<input type="hidden" id="applicant" name="applicant"
									value="${id}">
							</div>

							<div class="form-group">
								<label for="university"><spring:message
										code="education.university" /> </label> <input type="text"
									class="form-control" id="university" name="university"
									placeholder="<spring:message code="education.text.university"/>">
							</div>

							<div class="form-group">
								<label for="degree"><spring:message
										code="education.degree" /> </label> <input type="text"
									class="form-control" id="degree" name="degree"
									placeholder="<spring:message code="education.text.degree"/>">
							</div>

							<div class="form-group">
								<label for="faculty"><spring:message
										code="education.faculty" /> </label> <input type="text"
									class="form-control" id="faculty" name="faculty"
									placeholder="<spring:message code="education.text.faculty"/>">
							</div>
							<div class="form-group">
								<label for="major"><spring:message
										code="education.major" /> </label> <input type="text"
									class="form-control" id="major" name="major"
									placeholder="<spring:message code="education.text.major"/>">
							</div>
							<div class="form-group">
								<label for="gpa"><spring:message code="education.gpa" />
								</label> <input type="text" class="form-control" id="gpa" name="gpa"
									placeholder="<spring:message code="education.text.gpa"/>">
							</div>

							<div class="form-group">
								<label for="graduate"><spring:message
										code="education.graduate" /> </label> <input type="text"
									class="form-control" id="graduate" name="graduate"
									placeholder="<spring:message code="education.text.graduate"/>">
							</div>
							<br> <br>
							<button type="button" class="btn btn-success" id="btn_save">
								<span class="glyphicon glyphicon-off"></span>
								<spring:message code="edit.button.save" />
							</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">
								<spring:message code="button.cancel" />
							</button>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>

	<!-- Delete Model -->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
		aria-labelledby="ModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="ModalLabel">
						<spring:message code="delete.title" />
					</h4>
				</div>
				<div class="modal-body">
					<h4 class="modal-title" id="ModalLabel">
						<spring:message code="delete.confirm.title" />
					</h4>
					<br>
					<div align="right">
						<button id="btn_delete_submit" type="button"
							class="btn btn-danger" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove-sign"></span>
							<spring:message code="main.delete" />
						</button>
						<button id="btn_close" type="button" class="btn btn-default"
							data-dismiss="modal">
							<spring:message code="button.cancel" />
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br> <br>
	<div id="table">
		<table id="educationTable" class="display" cellspacing="0"
			width="100%">
			<thead>
				<tr>
					<th><spring:message code="education.data" /></th>
					<th><spring:message code="education.data.degree" /></th>
					<th><spring:message code="education.data.faculty" /></th>
					<th><spring:message code="education.data.major" /></th>
					<th><spring:message code="education.data.gpa" /></th>
					<th><spring:message code="education.data.graduate" /></th>
					<th><spring:message code="main.edit.info" /></th>
					<th><spring:message code="main.delete" /></th>

				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</div>
<div class="container">
	<!-- Delete Model -->
	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
		aria-labelledby="ModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="ModalLabel">
						<spring:message code="delete.title" />
					</h4>
				</div>
				<div class="modal-body">
					<h4 class="modal-title" id="ModalLabel">
						<spring:message code="delete.confirm.title" />
					</h4>
					<br>
					<div align="right">
						<button id="btn_delete_submit" type="button"
							class="btn btn-danger" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove-sign"></span>
							<spring:message code="main.delete" />
						</button>
						<button id="btn_close" type="button" class="btn btn-default"
							data-dismiss="modal">
							<spring:message code="button.cancel" />
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
