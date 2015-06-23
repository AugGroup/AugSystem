<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
$(document).ready(function() {
		$('#languagesForm').validate({
			rules : {
				languagesName : {
					required : true
				},
				speakingName : {
					required : true
				},
				understandingName : {
					required : true
				},
				readingName : {
					required : true
				},
				writingName : {
					required : true
				}
			},
			messages : {
				languagesName : {
					required : "Languages is required!"
				},
				speakingName : {
					required : "Speaking is required!"
				},
				understandingName : {
					required : "Understanding is required!"
				},
				readingName : {
					required : "Reading is required!"
				},
				writingName : {
					required : "Writing is required!"
				}
			}
		});

	
	$('#languagesTable').DataTable({
		ajax : {
			url : '${pageContext.request.contextPath}/languages',
			type : 'GET'
		},
		columns : [ {
			data : "languagesName"
		}, {
			data : "speaking"
		}, {
			data : "reading"
		}, {
			data : "understanding"
		}, {
			data : "writing"
		},{ data : function(data) {
			 return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#myModal" class="btn btn-warning btn-mini">' + 'Edit' + '</button>';
		}
		},{ data : function(data) {
			 return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#modalDelete" class="btn btn-danger btn-mini">' + 'Delete' + '</button>';
		}
	}],
		searching : false

	});

	$('#languagesSave').on("click", function() {
		if ($('#languagesForm').valid()) { 
		var table = $('#languagesTable').DataTable();

		table.row.add({
			languagesName : $('#languages').val(),
			speaking : $('input[name=speaking]:checked').val(),
			reading : $('input[name=reading]:checked').val(),
			understanding : $('input[name=understanding]:checked').val(),
			writing : $('input[name=writing]:checked').val()
		}).draw();
		$('#languagesModal').modal('hide');
		};
	})
	
	
	$('#languagesSave').on("click", function() {
		var insertData = "{";
		insertData+="languages : [ ";
		var languagesTable = $("#languagesTable").DataTable();
		
		languagesTable.rows().iterator( 'row', function ( context, index ) {
		insertData+="{";
		insertData+="applicant : {id :"+$('#applicant').val()+"},";
		insertData+="languagesName : '"+languagesTable.cell( index,0 ).data()+"',";
		insertData+="speaking : '"+languagesTable.cell( index,1 ).data()+"',";
		insertData+="reading : '"+languagesTable.cell( index,2 ).data()+"',";
		insertData+="understanding : '"+languagesTable.cell( index,3 ).data()+"',";
		insertData+="writing : '"+languagesTable.cell( index,4 ).data()+"'},";
		
		});
			insertData=insertData.substring(0,insertData.length-1);
			insertData+="]}";
		

 		$.ajax({
			contentType : "application/json",
			type : "POST",
			url : '${pageContext.request.contextPath}/saveLanguages',
			data : JSON.stringify(eval("(" + insertData + ")")),
			success : function(data) {
				alert(JSON.stringify(data));
				new PNotify({
			        title: 'Success',
			        text: 'Successful Add Languages!!!',
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
<div class="row">
		<div class="col-md-6">
			<h1>Languages</h1>
			<button class="btn btn-primary" id="languagesAdd" data-toggle="modal"
				data-target="#languagesModal">
				<span class="glyphicon glyphicon-plus"></span> Languages
			</button>
		</div>
	</div>

	<div class="modal fade" id="languagesModal" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-lock"></span> Languages
					</h4>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form" id="languagesForm">
						<div class="form-group">
							<input type="hidden" id="applicant" name="applicant"
								value="${id}">
						</div>
						<div class="form-group">

							<label for="languages">Languages </label> <input type="text"
								class="form-control" id="languages" name="languages"
								placeholder="Enter languages">
								
							<label for="speaking">Speaking
							</label>
							<div class="radio-inline">
								<label><input type="radio" name="speaking"
									id="speaking" value="Excellent">Excellent</label>
							</div>
							<div class="radio-inline">
								<label><input type="radio" name="speaking"
									id="speaking" value="Good">Good</label>
							</div>
							<div class="radio-inline">
								<label><input type="radio" name="speaking"
									id="speaking" value="Fair">Fair</label>
							</div>
							
							
							<br> <label for="understanding">Understanding </label>
							<div class="radio-inline">
								<label><input type="radio" name="understanding"
									id="understanding" value="Excellent">Excellent</label>
							</div>
							<div class="radio-inline">
								<label><input type="radio" name="understanding"
									id="understanding" value="Good">Good</label>
							</div>
							<div class="radio-inline">
								<label><input type="radio" name="understanding"
									id="understanding" value="Fair">Fair</label>
							</div>
							
							
							<br> <label for="reading">Reading </label>
							<div class="radio-inline">
								<label><input type="radio" name="reading"
									id="reading" value="Excellent">Excellent</label>
							</div>
							<div class="radio-inline">
								<label><input type="radio" name="reading"
									id="reading" value="Good">Good</label>
							</div>
							<div class="radio-inline">
								<label><input type="radio" name="reading"
									id="reading" value="Fair">Fair</label>
							</div>
							
							
							<br> <label for="writing">Writing </label>
							<div class="radio-inline">
								<label><input type="radio" name="writing"
									id="writing" value="Excellent">Excellent</label>
							</div>
							<div class="radio-inline">
								<label><input type="radio" name="writing"
									id="writing" value="Good">Good</label>
							</div>
							<div class="radio-inline">
								<label><input type="radio" name="writing"
									id="writing" value="Fair">Fair</label>
							</div>
						</div>
						<br> <br>
						<button type="button" class="btn btn-success" id="languagesSave">
							<span class="glyphicon glyphicon-off"></span> Save
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
		<table id="languagesTable" class="display" cellspacing="0"
			width="100%">
			<thead>
				<tr>
					<th>LANGUAGES_NAME</th>
					<th>SPEAKING</th>
					<th>READING</th>
					<th>UNDERSTANDING</th>
					<th>WRITING</th>
					<th>Edit</th>
                	<th>Delete</th>

				</tr>
			</thead>


			<tbody></tbody>
		</table>

	</div>