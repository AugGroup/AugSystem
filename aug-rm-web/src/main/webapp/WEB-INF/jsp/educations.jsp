<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(document).ready(function() {

		$('.input-group.date').datepicker({
			startView : 2,
			todayBtn : "linked",
			format : "dd/mm/yyyy"

		});

		$('#buttonSave').on("click", function() {

			var insertData = {

				certificate : $('#certificateId').val(),
				educations : {
					schoolName : $('#universityId').val(),
					degree : $('#degreeId').val(),
					faculty : $('#facultyId').val(),
					major : $('#majorId').val(),
					gpa : $('#gpaId').val(),
					yearsOfGraduate : $('#graduateId').val()

				},
				skills : {
					skillDetail : $('#skillId').val()

				},
				languages : {
					languagesName : $('#languagesId').val(),
					speaking : $('#speakingId').val(),
					reading : $('#readingId').val(),
					understanding : $('#understandingId').val(),
					writing : $('#writingId').val()
					
				}
			}
			$.ajax({
				contentType : "application/json",
				type : "POST",
				url : '${pageContext.request.contextPath}/save',
				data : JSON.stringify(insertData),
				success : function(data) {
					alert(JSON.stringify(data));
				}
			});

		})

	});
</script>

<div id="educations">
	<div class="form-group">
		<label for="university">University </label> <input type="text"
			class="form-control" id="universityId" name="universityName"
			placeholder="Enter university">
	</div>

	<div class="form-group">
		<label for="degree">Degree </label> <input type="text"
			class="form-control" id="degreeId" name="degreeName"
			placeholder="Enter degree">
	</div>

	<div class="form-group">
		<label for="faculty">Faculty </label> <input type="text"
			class="form-control" id="facultyId" name="facultyName"
			placeholder="Enter faculty">
	</div>
	<div class="form-group">
		<label for="major">Major </label> <input type="text"
			class="form-control" id="majorId" name="majorName"
			placeholder="Enter major">
	</div>
	<div class="form-group">
		<label for="gpa">GPA </label> <input type="text" class="form-control"
			id="gpaId" name="gpaName" placeholder="Enter GPA">
	</div>

	<div class="form-group">
		<label for="graduate">Years of graduate </label> <input type="text"
			class="form-control" id="graduateId" name="graduateName"
			placeholder="Enter years of graduate">
	</div>
	<div class="form-group">
		<label for="certificate">Certificate </label> <input type="text"
			class="form-control" id="certificateId" name="certificateName"
			placeholder="Enter certificate">
	</div>

	<div class="form-group">
		<label for="resume">Resume</label> <input type="file" id="resumeId"
			name="resumeName">
		<p class="help-block">Block-level help text here.</p>
	</div>

	<div class="form-group">
		<label for="transcript">Transcript</label> <input type="file"
			id="transcriptId" name="transcriptName">
		<p class="help-block">Block-level help text here.</p>
	</div>

	<div class="form-group">
		<label for="skill">Skill Detail </label> <input type="text"
			class="form-control" id="skillId" name="skillName"
			placeholder="Enter skill detail">
	</div>

	<div class="form-group">
	
		<label for="languages">Languages </label> <input type="text"
			class="form-control" id="languagesId" name="languagesName"
			placeholder="Enter languages"> <label for="speaking">Speaking
		</label>
		<div class="radio">
			<label><input type="radio" name="speakingName"
				id="speakingId" value="Excellent">Excellent</label>
		</div>
		<div class="radio">
			<label><input type="radio" name="speakingName"
				id="speakingId" value="Good">Good</label>
		</div>
		<div class="radio">
			<label><input type="radio" name="speakingName"
				id="speakingId">Fair</label>
		</div>
		<label for="understanding">Understanding </label>
		<div class="radio">
			<label><input type="radio" name="understandingName"
				id="understandingId" value="Excellent">Excellent</label>
		</div>
		<div class="radio">
			<label><input type="radio" name="understandingName"
				id="understandingId" value="Good">Good</label>
		</div>
		<div class="radio">
			<label><input type="radio" name="understandingName"
				id="understandingId">Fair</label>
		</div>
		<label for="reading">Reading </label>
		<div class="radio">
			<label><input type="radio" name="readingName" id="readingId"
				value="Excellent">Excellent</label>
		</div>
		<div class="radio">
			<label><input type="radio" name="readingName" id="readingId"
				value="Good">Good</label>
		</div>
		<div class="radio">
			<label><input type="radio" name="readingName" id="readingId">Fair</label>
		</div>
		<label for="writing">Writing </label>
		<div class="radio">
			<label><input type="radio" name="writingName" id="writingId"
				value="Excellent">Excellent</label>
		</div>
		<div class="radio">
			<label><input type="radio" name="writingName" id="writingId"
				value="Good">Good</label>
		</div>
		<div class="radio">
			<label><input type="radio" name="writingName" id="writingId">Fair</label>
		</div>
	</div>



	<button type="button" class="btn btn-success" id="buttonSave">
		<span class="glyphicon glyphicon-off"></span> Save
	</button>
</div>
