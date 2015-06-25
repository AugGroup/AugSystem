<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
$(document).ready(function() {
	
	var dtApplicant;
	
		$('#languagesForm').validate({
			rules : {languages : {required : true},
				speaking : {required : true},
				understanding : {required : true},
				reading : {required : true},
				writing : {required : true}},
			messages : {languages : {
					required : "Languages is required!"},
				speaking : {required : "Speaking is required!"},
				understanding : {required : "Understanding is required!"},
				reading : {required : "Reading is required!"},
				writing : {required : "Writing is required!"}
				}
		});

		if(dtApplicant) {
			dtOrder.ajax.reload();
		}
		else {
		var id = '${id}';
	$('#languagesTable').DataTable({
		ajax : {
			url : '${pageContext.request.contextPath}/findByIdLanguages/' +id,
			type : 'POST'
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
			 return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#languagesModal" class="btn btn-warning btn-mini">' + 'Edit' + '</button>';
		}
		},{ data : function(data) {
			 return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal" class="btn btn-danger btn-mini">' + 'Delete' + '</button>';
		}
	}],
		searching : false

	});
		}
	
	
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
	
	//Update 
	function findById(id){
		$.ajax({
			url : "${pageContext.request.contextPath}/findLanguagesId/" + id,
			type : "POST",
			success : function(data){
				showFillData(data);
			}
		});
	}
	
	//Show data on inputField
	function showFillData(data){
		$("#languages").val(data.languagesName);
 	}
	
	//Update function
	function updated(button){
		var id = $(button).data("id");
		var languagesName = $("#languages").val();
		
		var json = {
				"id" : id,
				"languagesName" : languagesName,
				};
		
		$.ajax({
			url : "${pageContext.request.contextPath}/updateLanguages/"+id,
			type : "POST",
			contentType :"application/json; charset=utf-8",
			data : JSON.stringify(json),
			success : function(data){
				$('#languagesModal').modal('hide');
				
				var table = $('#languagesTable').DataTable();	
			 	var rowData = table.row(button.closest('tr')).index(); 
			 	var d = table.row(rowData).data();
			 	
			 		d.languagesName = data.languagesName;
			 		
			 		table.row(rowData).data(d).draw();
			 		
					new PNotify({
					    title: 'Edit Languages Success!!',
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
	
    function deleteLanguages(button) {
        var dtApplicant = $('#languagesTable').DataTable();
        var id = $(button).data("id");
        var index = dtApplicant.row(button.closest("tr")).index();
        $.ajax({
            url: "${pageContext.request.contextPath}/deleteLanguages/" + id,
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
    
    $('#languagesModal').on('shown.bs.modal', function (e) {
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
						<button type="button" class="btn btn-success" id="btn_save">
							<span class="glyphicon glyphicon-off"></span> Save
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</form>
				</div>
			</div>

		</div>
	</div>
	
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