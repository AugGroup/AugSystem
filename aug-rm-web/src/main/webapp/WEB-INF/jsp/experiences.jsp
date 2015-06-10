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
					previousEmployers : $('#previousEmployersId').val,
					previousEmployersReason : $('#giveReasonId').val,
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
<div id="experiences">
				<div class="form-group">
					<label for="previousEmployers">May inquiry be made of your
						previous employers regarding your character, qualification record
						of employment? </label>
					<div class="radio">
						<label><input type="radio" name="previousEmployersName"
							id="previousEmployersId" value="Yes">Yes</label>
					</div>
					<div class="radio">
						<label><input type="radio" name="previousEmployersName"
							id="previousEmployersId" value="No">No</label>
					</div>
					<div class="form-group">
						<label for="giveReason">If not, please give the reason </label> <input
							type="text" class="form-control" id="giveReasonId"
							name="giveReasonName"
							placeholder="Enter If not, please give the reason">
					</div>
				</div>
				<div class="form-group">
					<label for="reference">REFERENCE: List three persons OTHER
						THAN YOUR RELATIVE OR FORMER EMPLOYER who have definite knowledge
						of your qualifications and your conducts. </label>
					<div class="form-group">
						<label for="fullNameFrist">1.FULL NAME </label> <input type="text"
							class="form-control" id="fullNameFristId"
							name="fullNameFristName" placeholder="Enter FULL NAME">
					</div>
					<div class="form-group">
						<label for="completeAddressFrist">COMPLETE ADDRESS. </label> <input
							type="text" class="form-control" id="completeAddressFristId"
							name="completeAddressFristName"
							placeholder="Enter COMPLETE ADDRESS.">
					</div>
					<div class="form-group">
						<label for="telNoFrist">TELEPHONE NO. </label> <input type="text"
							class="form-control" id="telNoFristId" name="telNoFristName"
							placeholder="Enter TELEPHONE NO.">
					</div>
					<div class="form-group">
						<label for="occupationRef">OCCUPATION </label> <input type="text"
							class="form-control" id="occupationRefFristId"
							name="occupationRefFristName" placeholder="Enter OCCUPATION ">
					</div>

					<div class="form-group">
						<label for="fullNameSecond">2.FULL NAME </label> <input
							type="text" class="form-control" id="fullNameSecondId"
							name="fullNameSecondName" placeholder="Enter FULL NAME">
					</div>
					<div class="form-group">
						<label for="completeAddressSecond">COMPLETE ADDRESS. </label> <input
							type="text" class="form-control" id="completeAddressSecondId"
							name="completeAddressSecondName"
							placeholder="Enter COMPLETE ADDRESS.">
					</div>
					<div class="form-group">
						<label for="telNoSecond">TELEPHONE NO. </label> <input type="text"
							class="form-control" id="telNoSecondId" name="telNoSecondName"
							placeholder="Enter TELEPHONE NO.">
					</div>
					<div class="form-group">
						<label for="occupationRefSecond">OCCUPATION </label> <input
							type="text" class="form-control" id="occupationRefSecondId"
							name="occupationRefSecondName" placeholder="Enter OCCUPATION ">
					</div>

				</div>

				<div class="form-group">
					<label for="experiences">Experiences (start with your
						present or last position of work background) </label>
					<div class="form-group">
						<label for="workBackground">1) Present or last position </label> <input
							type="text" class="form-control" id="workBackgroundId"
							name="workBackgroundName"
							placeholder="Enter present or last position ">
					</div>

					<div class="form-group">
						<label for="fromWorkYear">From (month, year) </label> <input
							type="text" class="form-control" id="fromWorkYearId"
							name="fromWorkYearName" placeholder="Enter from (month, year)">
					</div>

					<div class="form-group">
						<label for="toWorkYear">To (month, year) </label> <input
							type="text" class="form-control" id="toWorkYearId"
							name="toWorkYearName" placeholder="Enter to (month, year)">
					</div>
					<div class="form-group">
						<label for="emp">Employer Name </label> <input type="text"
							class="form-control" id="empId" name="empName"
							placeholder="Enter employer name ">
					</div>

					<div class="form-group">
						<label for="addressBackground">Address </label>
						<textarea class="form-control" rows="5" id="addressBackgroundId"
							name="addressBackgroundName" placeholder="Enter address"></textarea>

					</div>

					<div class="form-group">
						<label for="business">Type of business </label> <input type="text"
							class="form-control" id="businessId" name="businessName"
							placeholder="Enter type of business ">
					</div>

					<div class="form-group">
						<label for="positionBackground">Position </label> <input
							type="text" class="form-control" id="positionBackgroundId"
							name="positionBackgroundName" placeholder="Enter position ">
					</div>

					<div class="form-group">
						<label for="supervisorBackground">Supervisor </label> <input
							type="text" class="form-control" id="supervisorBackgroundId"
							name="supervisorBackgroundName" placeholder="Enter supervisor">
					</div>

					<div class="form-group">
						<label for="salaryBackground">Salary ,Wages </label> <input
							type="text" class="form-control" id="salaryBackgroundId"
							name="salaryBackgroundName" placeholder="Enter salary ,wages ">
					</div>

					<div class="form-group">
						<label for="descriptionBackground">Description of duties
							and responsibilities </label>
						<textarea class="form-control" rows="5"
							id="descriptionBackgroundId" name="descriptionBackgroundName"
							placeholder="Enter description of duties and responsibilities"></textarea>
					</div>

					<div class="form-group">
						<label for="reasonLeaving">Reason for leaving </label>
						<textarea class="form-control" rows="5" id="reasonLeavingId"
							name="reasonLeavingName" placeholder="Enter reason for leaving"></textarea>

					</div>

				</div>
				<button type="button" class="btn btn-success" id="buttonSave">
					<span class="glyphicon glyphicon-off"></span> Save
				</button>
				
			</div>