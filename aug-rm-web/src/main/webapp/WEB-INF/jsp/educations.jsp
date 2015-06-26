<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(document).ready(function() {
		
		var dtApplicant;
		
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
					required : "University is required!"
				},
				degree : {
					required : "Degree is required!"
				},
				faculty : {
					required : "Faculty is required!"
				},
				major : {
					required : "Major is required!"
				},
				gpa : {
					required : "GPA is required!"
				},
				graduate : {
					required : "Years of graduate is required!"
				}
			}
		});

		$('.input-group.date').datepicker({
			startView : 2,
			todayBtn : "linked",
			format : "dd/mm/yyyy"

		});

		if(dtApplicant){
			dtApplicant.ajax.reload();
		}else{
			var id = '${id}';
			$('#educationTable').DataTable({
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
								return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#educationModal" class="btn btn-warning btn-mini">' + 'Edit' + '</button>';
							}},
							{data : function(data) {
								return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal" class="btn btn-danger btn-mini">' + 'Delete' + '</button>';
							}}],
				searching : false

			});
		}

// 		$('#buttonSave').on("click", function() {
		
// 			var insertData = "{";
			
// 			insertData+="educations : [ ";
// 			var educationTable = $("#educationTable").DataTable();
			
// 			educationTable.rows().iterator( 'row', function ( context, index ) {
// 			insertData+="{";
// 			insertData+="applicant : {id :"+$('#applicant').val()+"},";
// 			insertData+="schoolName : '"+educationTable.cell( index,0 ).data()+"',";
// 			insertData+="degree : '"+educationTable.cell( index,1 ).data()+"',";
// 			insertData+="faculty : '"+educationTable.cell( index,2 ).data()+"',";
// 			insertData+="major : '"+educationTable.cell( index,3 ).data()+"',";
// 			insertData+="gpa : "+educationTable.cell( index,4 ).data()+",";
// 			insertData+="yearsOfGraduate : '"+educationTable.cell( index,5 ).data()+"'},";
// 			});
// 				insertData=insertData.substring(0,insertData.length-1);
// 				insertData+="]}";
			
//  		$.ajax({
// 				contentType : "application/json",
// 				type : "POST",
// 				url : '${pageContext.request.contextPath}/saveEducations',
// 				data : JSON.stringify(eval("(" + insertData + ")")),
// 				success : function(data) {
// 					alert(JSON.stringify(data));
// 					new PNotify({
// 				        title: 'Success',
// 				        text: 'Successful Add Education!!!',
// 				        type: 'success',
// 				        nonblock: {
// 				            nonblock: true,
// 				            nonblock_opacity: .2
// 				        }
// 				    });
// 				}
// 			}); 

// 		})
		
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
					}

				}
	       });
});
</script>
<jsp:include page="applicationMenu.jsp" />
<div class="container">
	<div class="row">
		<div class="col-md-6">
			<h1>Education</h1>
			<button class="btn btn-primary" id="educationAdd" data-toggle="modal" data-target="#educationModal">
				<span class="glyphicon glyphicon-plus"></span> Education
			</button>
		</div>
	</div>

	<div class="modal fade" id="educationModal" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-lock"></span> Education
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
								<label for="university">University </label> <input type="text"
									class="form-control" id="university" name="university"
									placeholder="Enter university">
							</div>

							<div class="form-group">
								<label for="degree">Degree </label> <input type="text"
									class="form-control" id="degree" name="degree"
									placeholder="Enter degree">
							</div>

							<div class="form-group">
								<label for="faculty">Faculty </label> <input type="text"
									class="form-control" id="faculty" name="faculty"
									placeholder="Enter faculty">
							</div>
							<div class="form-group">
								<label for="major">Major </label> <input type="text"
									class="form-control" id="major" name="major"
									placeholder="Enter major">
							</div>
							<div class="form-group">
								<label for="gpa">GPA </label> <input type="text"
									class="form-control" id="gpa" name="gpa"
									placeholder="Enter GPA">
							</div>

							<div class="form-group">
								<label for="graduate">Years of graduate </label> <input
									type="text" class="form-control" id="graduate"
									name="graduate" placeholder="Enter years of graduate">
							</div>
							<br> <br>
							<button type="button" class="btn btn-success" id="btn_save">
								<span class="glyphicon glyphicon-off"></span> Save
							</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>
	<br> <br>
	<div>
		<table id="educationTable" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>SCHOOL_NAME</th>
					<th>DEGREE</th>
					<th>FACULTY</th>
					<th>MAJOR</th>
					<th>GPA</th>
					<th>YEAR_OF_GRADUATE</th>
					<th>EDIT</th>
					<th>DELETE</th>

				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</div>
<div class="container">
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
