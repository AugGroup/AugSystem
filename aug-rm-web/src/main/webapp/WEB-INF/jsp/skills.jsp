<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
$(document).ready(function() {
	
	$('#skillForm').validate({
		rules : {
			skillName : {
				required : true
			}
		},
		messages : {
			skillName : {
				required : "Skill Detail is required!"
			}
		}
	});
	$('#skillTable').DataTable({
		ajax : {
			url : '${pageContext.request.contextPath}/educations',
			type : 'GET'
		},
		columns : [ {
			data : "skillDetail"
		},{ data : function(data) {
			 return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#myModal" class="btn btn-warning btn-mini">' + 'Edit' + '</button>';
		}
		},{ data : function(data) {
			 return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#modalDelete" class="btn btn-danger btn-mini">' + 'Delete' + '</button>';
		}
	}],
		searching : false

	});
	$('#skillSave').on("click", function() {
		if ($('#skillForm').valid()) {
		var table = $('#skillTable').DataTable();

		table.row.add({
			skillDetail : $('#skill').val()
		}).draw();
		$('#skillModal').modal('hide');
		};
	})
	
	$('#certificateSave').on("click", function() {
		
		var insertData = "{";
		insertData+="skills : [ ";
		var skillTable = $("#skillTable").DataTable();
		
		skillTable.rows().iterator( 'row', function ( context, index ) {
		insertData+="{";
		insertData+="applicant : {id :"+$('#applicant').val()+"},";
		insertData+="skillDetail : '"+skillTable.cell( index,0 ).data()+"'},";
		});
			insertData=insertData.substring(0,insertData.length-1);
			insertData+="]";
		insertData+="}";

 		$.ajax({
			contentType : "application/json",
			type : "POST",
			url : '${pageContext.request.contextPath}/saveSkills',
			data : JSON.stringify(eval("(" + insertData + ")")),
			success : function(data) {
				alert(JSON.stringify(data));
				new PNotify({
			        title: 'Success',
			        text: 'Successful Add Skills!!!',
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
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h1>Skill</h1>
					<button class="btn btn-primary" id="skillAdd" data-toggle="modal"
						data-target="#skillModal">
						<span class="glyphicon glyphicon-plus"></span> Skill
					</button>
				</div>
			</div>
		
			<div class="modal fade" id="skillModal" role="dialog">
				<div class="modal-dialog">
		
					<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px;">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4>
								<span class="glyphicon glyphicon-lock"></span> Skill
							</h4>
						</div>
						<div class="modal-body" style="padding: 40px 50px;">
							<form role="form" id="skillForm">
								<div class="form-group">
									<input type="hidden" id="applicant" name="applicant"
										value="${id}">
								</div>
								<div class="form-group">
									<label for="skill">Skill Detail </label> <input type="text"
										class="form-control" id="skill" name="skill"
										placeholder="Enter skill detail">
								</div>
								<br> <br>
								<button type="button" class="btn btn-success" id="skillSave">
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
				<table id="skillTable" class="display" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>SKILL_DETAIL</th>
							<th>Edit</th>
                			<th>Delete</th>
		
						</tr>
					</thead>
		
		
					<tbody></tbody>
				</table>
		
			</div>
		
		
		</div>