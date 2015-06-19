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

			columns : [ {data : "schoolName"},
			            {data : "degree"}, 
			            {data : "faculty"}, 
			            {data : "major"},
			            {data : "gpa"},
			            {data : "yearsOfGraduate"},
			            {data : function(data) {
							return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#myModal" class="btn btn-warning btn-mini">' + 'Edit' + '</button>';
						}},
						{data : function(data) {
							return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#modalDelete" class="btn btn-danger btn-mini">' + 'Delete' + '</button>';
						}}],
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
// <<<<<<< HEAD
		
// 		$('#educationSave').on("click", function() {
// =======
		$('#certificateTable').DataTable({
			ajax : {
				url : '${pageContext.request.contextPath}/educations',
				type : 'GET'
			},
			columns : [ {data : "certificate"},
			            {data : function(data) {
							return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#myModal" class="btn btn-warning btn-mini">' + 'Edit' + '</button>';
						}},
						{data : function(data) {
							return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#modalDelete" class="btn btn-danger btn-mini">' + 'Delete' + '</button>';
						}}],
			searching : false

		});

		$('#certificateSave').on("click", function() {
			if ($('#certificateForm').valid()) {
			var table = $('#certificateTable').DataTable();

			table.row.add({
				certificate : $('#certificateId').val()
			}).draw();
			$('#certificateModal').modal('hide');
			};
		})
		$('#skillTable').DataTable({
			ajax : {
				url : '${pageContext.request.contextPath}/educations',
				type : 'GET'
			},
			columns : [ {data : "skillDetail"},
			            {data : function(data) {
							return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#myModal" class="btn btn-warning btn-mini">' + 'Edit' + '</button>';
						}},
						{data : function(data) {
							return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#modalDelete" class="btn btn-danger btn-mini">' + 'Delete' + '</button>';
						}}],
			searching : false

		});
		$('#skillSave').on("click", function() {
			if ($('#skillForm').valid()) {
			var table = $('#skillTable').DataTable();

			table.row.add({
				skillDetail : $('#skillId').val()
			}).draw();
			$('#skillModal').modal('hide');
			};
		})

		$('#languagesTable').DataTable({
			ajax : {
				url : '${pageContext.request.contextPath}/educations',
				type : 'GET'
			},
			columns : [ {data : "languagesName"},
			            {data : "speaking"},
			            {data : "reading"},
			            {data : "understanding"},
			            {data : "writing"},
			            {data : function(data) {
							return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#myModal" class="btn btn-warning btn-mini">' + 'Edit' + '</button>';
						}},
						{data : function(data) {
							return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#modalDelete" class="btn btn-danger btn-mini">' + 'Delete' + '</button>';
						}}],
			searching : false

		});

		$('#languagesSave').on("click", function() {
			if ($('#languagesForm').valid()) { 
			var table = $('#languagesTable').DataTable();

			table.row.add({
				languagesName : $('#languagesId').val(),
				speaking : $('input[name=speakingName]:checked').val(),
				reading : $('input[name=readingName]:checked').val(),
				understanding : $('input[name=understandingName]:checked').val(),
				writing : $('input[name=writingName]:checked').val()
			}).draw();
			$('#languagesModal').modal('hide');
			};
		})

		$('#buttonSave').on("click", function() {
// >>>>>>> Edit ApplicantController,ApplicationController,applications.jsp,educations.jsp,main_applicant.jsp
		
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
		
		//Find by Id
		function findById(id){
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
			$("#universityId").val(data.university);
			$("#degreeId").val(data.techScore);
			$("#facultyId").val(data.faculty);
			$("#majorId").val(data.major);
			$("#graduateId").val(data.graduate);
		}
		
// 		//Update function
// 		function updateUser(button){
// 			var id = $(button).data("id");
// 			var university = $("#universityId").val();
// 			var degree = $('#degreeId').val();
// 			var faculty = $("#facultyId").val();
// 			var major = $("#majorId").val();
// 			var graduate = $("#graduateId").val();

// 			var json = {
// 					"id" : id,
// 					"university" : university,
// 					"degree" : degree,
// 					"faculty" : faculty,
// 					"major" : major,
// 					"yearsOfGraduate" : graduate
// 					};
// 			$.ajax({
// 				url : "${pageContext.request.contextPath}applicant/update/"+id,
// 				type : "POST",
// 				contentType :"application/json; charset=utf-8",
// 				data : JSON.stringify(json),
// 				success : function(data){
// 					$('#educationModal').modal('hide');
					
// 					var table = $('#dataTable').DataTable();	
// 				 	var rowData = table.row(button.closest('tr')).index(); 
// 				 	var d = table.row(rowData).data();
// 				 		d.university = data.university;
// 						d.degree = data.degree;
// 				 		d.faculty = data.faculty;
// 				 		d.major = data.major;
// 				 		d.graduate = data.yearsOfGraduate;
				 		
// 				 		table.row(rowData).data(d).draw();
				 		
// 						new PNotify({
// 						    title: 'Edit Success',
// 						    text: 'You can edit data',
// 						    type: 'success',
// 						    nonblock: {
// 						        nonblock: true,
// 						        nonblock_opacity: .2
// 						    }
// 						});
// 				 }
// 			});
			
// 		}

});
</script>
<jsp:include page="applicationMenu.jsp" />

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
							<button type="button" class="btn btn-success" id="educationSave">
								<span class="glyphicon glyphicon-off"></span> Save
							</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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

<!-- </div> -->
<!-- <br> -->
<!-- <br> -->
<!-- <div class="container"> -->
<!-- 	<div class="row"> -->
<!-- 		<div class="col-md-6"> -->
<!-- 			<h1>Certificate</h1> -->
<!-- 			<button class="btn btn-primary" id="certificateAdd" -->
<!-- 				data-toggle="modal" data-target="#certificateModal"> -->
<!-- 				<span class="glyphicon glyphicon-plus"></span> Certificate -->
<!-- 			</button> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!-- 	<div class="modal fade" id="certificateModal" role="dialog"> -->
<!-- 		<div class="modal-dialog"> -->

<!-- 			<div class="modal-content"> -->
<!-- 				<div class="modal-header" style="padding: 35px 50px;"> -->
<!-- 					<button type="button" class="close" data-dismiss="modal">&times;</button> -->
<!-- 					<h4> -->
<!-- 						<span class="glyphicon glyphicon-lock"></span> Certificate -->
<!-- 					</h4> -->
<!-- 				</div> -->
<!-- 				<div class="modal-body" style="padding: 40px 50px;"> -->
<%-- 					<form role="form" id="certificateForm"> --%>
<!-- 						<div class="form-group"> -->
<!-- 							<input type="hidden" id="applicantId" name="applicantName" -->
<%-- 								value="${id}"> --%>
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label for="certificate">Certificate </label> <input type="text" -->
<!-- 								class="form-control" id="certificateId" name="certificateName" -->
<!-- 								placeholder="Enter certificate"> -->
<!-- 						</div> -->
<!-- 						<br> <br> -->
<!-- 						<button type="button" class="btn btn-success" id="certificateSave"> -->
<!-- 							<span class="glyphicon glyphicon-off"></span> Save -->
<!-- 						</button> -->
<!-- 						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<%-- 					</form> --%>
<!-- 				</div> -->
<!-- 				<div class="modal-footer"> -->
<!-- 					<p>Please fill your information</p> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<br> <br> -->
<!-- 	<div> -->
<!-- 		<table id="certificateTable" class="display" cellspacing="0" -->
<!-- 			width="100%"> -->
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<th>CERTIFICATE</th> -->

<!-- 				</tr> -->
<!-- 			</thead> -->


<!-- 			<tbody></tbody> -->
<!-- 		</table> -->

<!-- 	</div> -->


<!-- </div> -->
<!-- <div class="container"> -->
<%-- <form enctype="multipart/form-data" method="post"> --%>
<!-- 		<div class="form-group"> -->
<!-- 			<label for="file">File</label> <input type="file" multiple="multiple" id="file" -->
<!-- 			name="file"> -->
<!-- 		<p class="help-block">Block-level help text here.</p> -->
<!-- 		</div> -->

<!-- 		<!-- <div class="form-group"> -->
<!-- 			<label for="transcript">Transcript</label> <input type="file" -->
<!-- 			id="transcript" name="transcript"> -->
<!-- 		<p class="help-block">Block-level help text here.</p> -->
<!-- 		</div> --> -->
<!-- 		<br> -->
<!-- 		<input type="button" id="buttonUpload" name="buttonUpload" value="Upload"/> -->
		
		
<%-- </form> --%>
<!-- </div> -->
<!-- <br> -->
<!-- <br> -->
<!-- <div class="container"> -->
<!-- 	<div class="row"> -->
<!-- 		<div class="col-md-6"> -->
<!-- 			<h1>Skill</h1> -->
<!-- 			<button class="btn btn-primary" id="skillAdd" data-toggle="modal" -->
<!-- 				data-target="#skillModal"> -->
<!-- 				<span class="glyphicon glyphicon-plus"></span> Skill -->
<!-- 			</button> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!-- 	<div class="modal fade" id="skillModal" role="dialog"> -->
<!-- 		<div class="modal-dialog"> -->

<!-- 			<div class="modal-content"> -->
<!-- 				<div class="modal-header" style="padding: 35px 50px;"> -->
<!-- 					<button type="button" class="close" data-dismiss="modal">&times;</button> -->
<!-- 					<h4> -->
<!-- 						<span class="glyphicon glyphicon-lock"></span> Skill -->
<!-- 					</h4> -->
<!-- 				</div> -->
<!-- 				<div class="modal-body" style="padding: 40px 50px;"> -->
<%-- 					<form role="form" id="skillForm"> --%>
<!-- 						<div class="form-group"> -->
<!-- 							<input type="hidden" id="applicantId" name="applicantName" -->
<%-- 								value="${id}"> --%>
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label for="skill">Skill Detail </label> <input type="text" -->
<!-- 								class="form-control" id="skillId" name="skillName" -->
<!-- 								placeholder="Enter skill detail"> -->
<!-- 						</div> -->
<!-- 						<br> <br> -->
<!-- 						<button type="button" class="btn btn-success" id="skillSave"> -->
<!-- 							<span class="glyphicon glyphicon-off"></span> Save -->
<!-- 						</button> -->
<!-- 						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<%-- 					</form> --%>
<!-- 				</div> -->
<!-- 				<div class="modal-footer"> -->
<!-- 					<p>Please fill your information</p> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<br> <br> -->
<!-- 	<div> -->
<!-- 		<table id="skillTable" class="display" cellspacing="0" width="100%"> -->
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<th>SKILL_DETAIL</th> -->

<!-- 				</tr> -->
<!-- 			</thead> -->


<!-- 			<tbody></tbody> -->
<!-- 		</table> -->

<!-- 	</div> -->


<!-- </div> -->
<!-- <br> -->
<!-- <br> -->
<!-- <div class="container"> -->
<!-- 	<div class="row"> -->
<!-- 		<div class="col-md-6"> -->
<!-- 			<h1>Languages</h1> -->
<!-- 			<button class="btn btn-primary" id="languagesAdd" data-toggle="modal" -->
<!-- 				data-target="#languagesModal"> -->
<!-- 				<span class="glyphicon glyphicon-plus"></span> Languages -->
<!-- 			</button> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!-- 	<div class="modal fade" id="languagesModal" role="dialog"> -->
<!-- 		<div class="modal-dialog"> -->

<!-- 			<div class="modal-content"> -->
<!-- 				<div class="modal-header" style="padding: 35px 50px;"> -->
<!-- 					<button type="button" class="close" data-dismiss="modal">&times;</button> -->
<!-- 					<h4> -->
<!-- 						<span class="glyphicon glyphicon-lock"></span> Languages -->
<!-- 					</h4> -->
<!-- 				</div> -->
<!-- 				<div class="modal-body" style="padding: 40px 50px;"> -->
<%-- 					<form role="form" id="languagesForm"> --%>
<!-- 						<div class="form-group"> -->
<!-- 							<input type="hidden" id="applicantId" name="applicantName" -->
<%-- 								value="${id}"> --%>
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->

<!-- 							<label for="languages">Languages </label> <input type="text" -->
<!-- 								class="form-control" id="languagesId" name="languagesName" -->
<!-- 								placeholder="Enter languages"> -->
								
<!-- 							<label for="speaking">Speaking -->
<!-- 							</label> -->
<!-- 							<div class="radio-inline"> -->
<!-- 								<label><input type="radio" name="speakingName" -->
<!-- 									id="speakingId" value="Excellent">Excellent</label> -->
<!-- 							</div> -->
<!-- 							<div class="radio-inline"> -->
<!-- 								<label><input type="radio" name="speakingName" -->
<!-- 									id="speakingId" value="Good">Good</label> -->
<!-- 							</div> -->
<!-- 							<div class="radio-inline"> -->
<!-- 								<label><input type="radio" name="speakingName" -->
<!-- 									id="speakingId" value="Fair">Fair</label> -->
<!-- 							</div> -->
							
							
<!-- 							<br> <label for="understanding">Understanding </label> -->
<!-- 							<div class="radio-inline"> -->
<!-- 								<label><input type="radio" name="understandingName" -->
<!-- 									id="understandingId" value="Excellent">Excellent</label> -->
<!-- 							</div> -->
<!-- 							<div class="radio-inline"> -->
<!-- 								<label><input type="radio" name="understandingName" -->
<!-- 									id="understandingId" value="Good">Good</label> -->
<!-- 							</div> -->
<!-- 							<div class="radio-inline"> -->
<!-- 								<label><input type="radio" name="understandingName" -->
<!-- 									id="understandingId" value="Fair">Fair</label> -->
<!-- 							</div> -->
							
							
<!-- 							<br> <label for="reading">Reading </label> -->
<!-- 							<div class="radio-inline"> -->
<!-- 								<label><input type="radio" name="readingName" -->
<!-- 									id="readingId" value="Excellent">Excellent</label> -->
<!-- 							</div> -->
<!-- 							<div class="radio-inline"> -->
<!-- 								<label><input type="radio" name="readingName" -->
<!-- 									id="readingId" value="Good">Good</label> -->
<!-- 							</div> -->
<!-- 							<div class="radio-inline"> -->
<!-- 								<label><input type="radio" name="readingName" -->
<!-- 									id="readingId" value="Fair">Fair</label> -->
<!-- 							</div> -->
							
							
<!-- 							<br> <label for="writing">Writing </label> -->
<!-- 							<div class="radio-inline"> -->
<!-- 								<label><input type="radio" name="writingName" -->
<!-- 									id="writingId" value="Excellent">Excellent</label> -->
<!-- 							</div> -->
<!-- 							<div class="radio-inline"> -->
<!-- 								<label><input type="radio" name="writingName" -->
<!-- 									id="writingId" value="Good">Good</label> -->
<!-- 							</div> -->
<!-- 							<div class="radio-inline"> -->
<!-- 								<label><input type="radio" name="writingName" -->
<!-- 									id="writingId" value="Fair">Fair</label> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<br> <br> -->
<!-- 						<button type="button" class="btn btn-success" id="languagesSave"> -->
<!-- 							<span class="glyphicon glyphicon-off"></span> Save -->
<!-- 						</button> -->
<!-- 						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<%-- 					</form> --%>
<!-- 				</div> -->
<!-- 				<div class="modal-footer"> -->
<!-- 					<p>Please fill your information</p> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<br> <br> -->
<!-- 	<div> -->
<!-- 		<table id="languagesTable" class="display" cellspacing="0" width="100%"> -->
<!-- 			<thead> -->
<!-- 				<tr> -->
<!-- 					<th>LANGUAGES_NAME</th> -->
<!-- 					<th>SPEAKING</th> -->
<!-- 					<th>READING</th> -->
<!-- 					<th>UNDERSTANDING</th> -->
<!-- 					<th>WRITING</th> -->
<!-- <!-- 					<th>EDIT</th> --> -->

<!-- 				</tr> -->
<!-- 			</thead> -->


<!-- 			<tbody></tbody> -->
<!-- 		</table> -->

<!-- 	</div> -->
<!-- 	<button type="button" class="btn btn-success" id="buttonSave"> -->
<!-- 		<span class="glyphicon glyphicon-off"></span> Save -->
<!-- 	</button> -->

<!-- </div> -->
<!-- >>>>>>> Edit ApplicantController,ApplicationController,applications.jsp,educations.jsp,main_applicant.jsp -->
