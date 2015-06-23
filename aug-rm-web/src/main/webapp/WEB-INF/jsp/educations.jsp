<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(document).ready(function() {
		$('#educationsForm').validate({
			rules : {
				universityName : {
					required : true
				},
				degreeName : {
					required : true
				},
				facultyName : {
					required : true
				},
				majorName : {
					required : true
				},
				gpaName : {
					required : true
				},
				graduateName : {
					required : true
				}
			},
			messages : {
				universityName : {
					required : "University is required!"
				},
				degreeName : {
					required : "Degree is required!"
				},
				facultyName : {
					required : "Faculty is required!"
				},
				majorName : {
					required : "Major is required!"
				},
				gpaName : {
					required : "GPA is required!"
				},
				graduateName : {
					required : "Years of graduate is required!"
				}
			}
		});
	
		
	
		$('.input-group.date').datepicker({
			startView : 2,
			todayBtn : "linked",
			format : "dd/mm/yyyy"

		});

		$('#educationTable').DataTable({
			ajax : {
				url : '${pageContext.request.contextPath}/educations',
				type : 'GET'
			},
			columns : [ {
				data : "schoolName"
			}, {
				data : "degree"
			}, {
				data : "faculty"
			}, {
				data : "major"
			}, {
				data : "gpa"
			}, {
				data : "yearsOfGraduate"
			},{ data : function(data) {
				 return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#myModal" class="btn btn-warning btn-mini">' + 'Edit' + '</button>';
			}
			},{ data : function(data) {
				 return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#modalDelete" class="btn btn-danger btn-mini">' + 'Delete' + '</button>';
			}
		} ],
			searching : false

		});
		$('#educationSave').on("click", function() {
			if ($('#educationsForm').valid()) { 
			var table = $('#educationTable').DataTable();

			table.row.add({
				schoolName : $('#universityId').val(),
				degree : $('#degreeId').val(),
				faculty : $('#facultyId').val(),
				major : $('#majorId').val(),
				gpa : $('#gpaId').val(),
				yearsOfGraduate : $('#graduateId').val()
			}).draw();
			$('#educationModal').modal('hide');
			};
		})
		
		$('#educationSave').on("click", function() {
		
			var insertData = "{";
			
			insertData+="educations : [ ";
			var educationTable = $("#educationTable").DataTable();
			
			educationTable.rows().iterator( 'row', function ( context, index ) {
			insertData+="{";
			insertData+="applicant : {id :"+$('#applicantId').val()+"},";
			insertData+="schoolName : '"+educationTable.cell( index,0 ).data()+"',";
			insertData+="degree : '"+educationTable.cell( index,1 ).data()+"',";
			insertData+="faculty : '"+educationTable.cell( index,2 ).data()+"',";
			insertData+="major : '"+educationTable.cell( index,3 ).data()+"',";
			insertData+="gpa : "+educationTable.cell( index,4 ).data()+",";
			insertData+="yearsOfGraduate : '"+educationTable.cell( index,5 ).data()+"'},";
			});
				insertData=insertData.substring(0,insertData.length-1);
				insertData+="]}";
			
 		$.ajax({
				contentType : "application/json",
				type : "POST",
				url : '${pageContext.request.contextPath}/saveEducations',
				data : JSON.stringify(eval("(" + insertData + ")")),
				success : function(data) {
					alert(JSON.stringify(data));
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

		})

	});
</script>
<jsp:include page="applicationMenu.jsp" />

	<div class="row">
		<div class="col-md-6">
			<h1>Education</h1>
			<button class="btn btn-primary" id="educationAdd" data-toggle="modal"
				data-target="#educationModal">
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
							<button type="button" class="btn btn-success" id="educationSave">
								<span class="glyphicon glyphicon-off"></span> Save
							</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
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
		<table id="educationTable" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>SCHOOL_NAME</th>
					<th>DEGREE</th>
					<th>FACULTY</th>
					<th>MAJOR</th>
					<th>GPA</th>
					<th>YEAR_OF_GRADUATE</th>
					<th>Edit</th>
                	<th>Delete</th>

				</tr>
			</thead>


			<tbody></tbody>
		</table>

	</div>

