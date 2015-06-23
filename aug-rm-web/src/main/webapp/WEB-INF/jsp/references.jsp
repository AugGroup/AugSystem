<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(document).ready(function() {
		$('#referenceForm').validate({
			rules : {
				fullName : {
					required : true
				},
				completeAddressName : {
					required : true,
				},
				telNoName : {
					required : true,
				},
				occupationRefName : {
					required : true,
				}
			},
			messages : {
				fullName : {
					required : "FULL NAME is required!"
				},
				completeAddressName : {
					required : "COMPLETE ADDRESS. is required!"
				},
				telNoName : {
					required : "TELEPHONE NO. is required!"
				},
				occupationRefName : {
					required : "OCCUPATION is required!"
				}
			}
		});
		
		$('#referenceTable').DataTable({
			ajax : {
				url : '${pageContext.request.contextPath}/experiences',
				type : 'GET'
			},
			columns : [ {
				data : "fullName"
			}, {
				data : "tel"
			}, {
				data : "occupation"
			}, {
				data : "completeAddress"
			}, { data : function(data) {
				 return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#myModal" class="btn btn-warning btn-mini">' + 'Edit' + '</button>';
			}
			}, { data : function(data) {
				 return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#modalDelete" class="btn btn-danger btn-mini">' + 'Delete' + '</button>';
			}
		}],
			searching : false

		});
		$('#referenceSave').on("click", function() {

			if ($('#referenceForm').valid()) { 
			var table = $('#referenceTable').DataTable();

			table.row.add({
				fullName : $('#fullName').val(),
				tel : $('#telNo').val(),
				occupation : $('#occupationRef').val(),
				completeAddress : $('#completeAddress').val()
			}).draw();
			$('#referenceModal').modal('hide');
			};
		})

		$('#referenceSave').on("click", function() {
			
			var insertData = "{";
			insertData+="references : [ ";
			
			var referenceTable = $("#referenceTable").DataTable();
			referenceTable.rows().iterator( 'row', function ( context, index ) {
			  
				insertData+="{";
				insertData+="applicant : {id :"+$('#applicant').val()+"},";
				insertData+="fullName : '"+referenceTable.cell( index,0 ).data()+"',";
				insertData+="tel : '"+referenceTable.cell( index,1 ).data()+"',";
				insertData+="occupation : '"+referenceTable.cell( index,2 ).data()+"',";
				insertData+="completeAddress : '"+referenceTable.cell( index,3 ).data()+"'},";
			});

			insertData=insertData.substring(0,insertData.length-1);
			
			insertData+="]";
			insertData+="}";
	
	 		$.ajax({
				contentType : "application/json",
				type : "POST",
				url : '${pageContext.request.contextPath}/saveReferences',
				data : JSON.stringify(eval("(" + insertData + ")")),
				success : function(data) {
					alert(JSON.stringify(data));
					new PNotify({
				        title: 'Success',
				        text: 'Successful Add References!!!',
				        type: 'success',
				        nonblock: {
				            nonblock: true,
				            nonblock_opacity: .2
				        }
				    });
					
				
				}
			}); 
	});
		
		
		
		
		
	});
</script>
<jsp:include page="applicationMenu.jsp" />
	<div class="form-group">
		<label for="reference">REFERENCE: List three persons OTHER
			THAN YOUR RELATIVE OR FORMER EMPLOYER who have definite knowledge of
			your qualifications and your conducts. </label>
	</div>
	<br>
		<div class="row">
			<div class="col-md-6">
				<h1>REFERENCE</h1>
				<button class="btn btn-primary" id="referenceAdd"
					data-toggle="modal" data-target="#referenceModal">
					<span class="glyphicon glyphicon-plus"></span> REFERENCE
				</button>
			</div>
		</div>
		<div class="modal fade" id="referenceModal" role="dialog">
			<div class="modal-dialog">

				<div class="modal-content">
					<div class="modal-header" style="padding: 35px 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> REFERENCE
						</h4>
					</div>
					<div class="modal-body" style="padding: 40px 50px;">
						<form role="form" id="referenceForm">
							<div class="form-group">
								<input type="hidden" id="applicant" name="applicant"
									value="${id}">
							</div>
							<div class="form-group">
								<label for="fullNameRef">FULL NAME </label> <input type="text"
									class="form-control" id="fullName" name="fullName"
									placeholder="Enter FULL NAME">
							</div>
							<div class="form-group">
								<label for="completeAddress">COMPLETE ADDRESS. </label> <input
									type="text" class="form-control" id="completeAddress"
									name="completeAddress"
									placeholder="Enter COMPLETE ADDRESS.">
							</div>
							<div class="form-group">
								<label for="telNo">TELEPHONE NO. </label> <input type="text"
									class="form-control" id="telNo" name="telNo"
									placeholder="Enter TELEPHONE NO.">
							</div>
							<div class="form-group">
								<label for="occupationRef">OCCUPATION </label> <input
									type="text" class="form-control" id="occupationRef"
									name="occupationRef" placeholder="Enter occupation">
							</div>
							<br> <br>
							<button type="button" class="btn btn-success" id="referenceSave">
								<span class="glyphicon glyphicon-off"></span> Save
							</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<p>Please fill your information</p>
				</div>
			</div>

		</div>
	
	<br> <br>
	<div>
		<table id="referenceTable" class="display" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>FULLNAME</th>
					<th>TEL</th>
					<th>OCCUPATION</th>
					<th>COMPLETE_ADDRESS</th>
					<th>Edit</th>
                	<th>Delete</th>
				</tr>
			</thead>


			<tbody></tbody>
		</table>
		</div>