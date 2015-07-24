<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#languageses {
	background: #E0DFDD;
}

#languagesTable {
	color: #414141;
	background-color: #ababab;
	margin-right: 5px;
}

#languagesAdd {
	margin-left: 5px;
}

#table {
	padding: 15px 5px 15px 5px;
	background: #E0DFDD;;
}

#languagesAdd{
	margin-top: 15px;
	margin-right: 5px;
	margin-bottom:15px;
	width: 150px;
	height: 30px;
	float:right;
	font-family: "Regular";
	font-size: 16px;
}

#buttonBack{
	margin-top: 15px;
	margin-right:15px;
	margin-bottom:15px;
	width: 90px;
	height: 30px;
	background-color: f4f4f4;
	font-family: "Regular";
	font-size: 14px;
	color: #414141;
}

h3{
	height: 30px;
	font-family: "SemiBold";
    font-size: 18px;
	color: #ffffff;
    border: 1px #F7C11F; 
    background: #ffc000;
	padding-left: 5px;
	margin-left: 5px;
	margin-right: 5px;
}


</style>
<script>
$(document).ready(function() {
	
	$('#languagesForm').validate({
		rules : {languages : {required : true},
			speaking : {required : true},
			understanding : {required : true},
			reading : {required : true},
			writing : {required : true}},
			messages : {languages : {required : "<spring:message code="valid.lang.name"/>"},
			speaking : {required : "<spring:message code="valid.lang.speak"/>"},
			understanding : {required : "<spring:message code="valid.lang.understand"/>"},
			reading : {required : "<spring:message code="valid.lang.read"/>"},
			writing : {required : "<spring:message code="valid.lang.write"/>"}
			}
	});
	
	var dtApplicant;

	if(dtApplicant) {
		dtApplicant.ajax.reload();
	}
	else {
		var id = '${id}';
		dtApplicant = $('#languagesTable').DataTable({
			paging: true,
			hover:false,
			sort:false,
			ajax : {
				url : '${pageContext.request.contextPath}/findByIdLanguages/' +id,
				type : 'POST'
			},
			columns : [ {data : "languagesName"},
			            {data : "speaking"},
			            {data : "reading"},
			            {data : "understanding"},
			            {data : "writing"},
			            {data : function(data) {
				 			return '<button id="buttonEdit" data-id="'+data.id+'" data-toggle="modal" data-target="#languagesModal" class="btn btn-warning btn-mini"><span class="glyphicon glyphicon-pencil"></span> <spring:message code="main.edit.info"/></button>';
						}},
						{data : function(data) {
							return '<button id="buttonDelete" data-id="'+data.id+'" data-toggle="modal" data-target="#deleteModal" class="btn btn-danger btn-mini"><span class="glyphicon glyphicon-remove-sign"></span> <spring:message code="main.delete"/> </button>';
						}}],
			searching : false

		});

	}
	
	function saveLanguages(){
		if ($('#languagesForm').valid()) {
		var id = '${id}'
		var languagesName = $("#languages").val();
		var speaking = $('input[name="speaking"]:checked').val();
		var reading = $('input[name="reading"]:checked').val();
		var understanding = $('input[name="understanding"]:checked').val();
		var writing = $('input[name="writing"]:checked').val();
		
		var json = {
				"applicant" : {"id" : id},
				"languagesName" : languagesName,
				"speaking" : speaking,
				"reading" : reading,
				"understanding" : understanding,
				"writing" : writing
				};

 		$.ajax({
			contentType : "application/json",
			type : "POST",
			url : '${pageContext.request.contextPath}/languages/'+id,
			data : JSON.stringify(json),
			success : function(data) {
				$('#languagesModal').modal('hide');
				dtApplicant.ajax.reload();
				
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
		};
	}
	
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
		$("input[name=speaking]:radio[value=" + data.speaking +"]").prop('checked', true);
		$("input[name=reading]:radio[value=" + data.reading +"]").prop('checked', true);
		$("input[name=understanding]:radio[value=" + data.understanding +"]").prop('checked', true);
		$("input[name=writing]:radio[value=" + data.writing +"]").prop('checked', true);
 	}
	
	//Update function
	function updated(button){
		if ($('#languagesForm').valid()) {
		var id = $(button).data("id");
		var languagesName = $("#languages").val();
		var speaking = $('input[name="speaking"]:checked').val();
		var reading = $('input[name="reading"]:checked').val();
		var understanding = $('input[name="understanding"]:checked').val();
		var writing = $('input[name="writing"]:checked').val();
		
		var json = {
				"id" : id,
				"languagesName" : languagesName,
				"speaking" : speaking,
				"reading" : reading,
				"understanding" : understanding,
				"writing" : writing
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
			 		d.speaking = data.speaking;
			 		d.reading = data.reading;
			 		d.understanding = data.understanding;
			 		d.writing = data.writing;
			 		
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
	
    function deleted(button) {
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
			}else{
				$('#languagesForm')[0].reset();
				$('#btn_save').off('click').on('click', function(id){
					saveLanguages();
				});
			}

		}
   });

	
});
</script>
<jsp:include page="applicationMenu.jsp" />
<div class="container" id="languageses">
<div class="row">
		<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12">
			<h3><spring:message code="languages.name.less"/></h3>			
		</div>
	</div>

	<div class="modal fade" id="languagesModal" role="dialog">
		<div class="modal-dialog">

			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-lock"></span>
						<spring:message code="languages.name.less" />
					</h4>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form role="form" id="languagesForm">
						<div class="form-group">
							<input type="hidden" id="applicant" name="applicant"
								value="${id}">
						</div>
						<div class="form-group">

							<label for="languages"><spring:message
									code="languages.name.less" /> </label> <input type="text"
								class="form-control" id="languages" name="languages"
								placeholder="<spring:message code="languages.text.name"/>">
						<label for="languages" class="error" style="display:none;"></label><br>
							<label for="speaking"><spring:message
									code="languages.speak.less" /></label>
							<div class="radio-inline">
								<label><input type="radio" name="speaking" id="speaking"
									value="Excellent">
								<spring:message code="languages.excellent" /></label>
							</div>
							<div class="radio-inline">
								<label><input type="radio" name="speaking" id="speaking"
									value="Good">
								<spring:message code="languages.good" /></label>
							</div>
							<div class="radio-inline">
								<label><input type="radio" name="speaking" id="speaking"
									value="Fair">
								<spring:message code="languages.fair" /></label>
							</div><br>
						<label for="speaking" class="error" style="display:none;"></label>

							<br> <label for="understanding"><spring:message
									code="languages.understand.less" /> </label>
							<div class="radio-inline">
								<label><input type="radio" name="understanding"
									id="understanding" value="Excellent">
								<spring:message code="languages.excellent" /></label>
							</div>
							<div class="radio-inline">
								<label><input type="radio" name="understanding"
									id="understanding" value="Good">
								<spring:message code="languages.good" /></label>
							</div>
							<div class="radio-inline">
								<label><input type="radio" name="understanding"
									id="understanding" value="Fair">
								<spring:message code="languages.fair" /></label>
							</div><br>
						<label for="understanding" class="error" style="display:none;"></label>

							<br> <label for="reading"><spring:message
									code="languages.read.less" /> </label>
							<div class="radio-inline">
								<label><input type="radio" name="reading" id="reading"
									value="Excellent">
								<spring:message code="languages.excellent" /></label>
							</div>
							<div class="radio-inline">
								<label><input type="radio" name="reading" id="reading"
									value="Good">
								<spring:message code="languages.good" /></label>
							</div>
							<div class="radio-inline">
								<label><input type="radio" name="reading" id="reading"
									value="Fair">
								<spring:message code="languages.fair" /></label>
							</div><br>
						<label for="reading" class="error" style="display:none;"></label>

							<br> <label for="writing"><spring:message
									code="languages.write.less" /> </label>
							<div class="radio-inline">
								<label><input type="radio" name="writing" id="writing"
									value="Excellent">
								<spring:message code="languages.excellent" /></label>
							</div>
							<div class="radio-inline">
								<label><input type="radio" name="writing" id="writing"
									value="Good">
								<spring:message code="languages.good" /></label>
							</div>
							<div class="radio-inline">
								<label><input type="radio" name="writing" id="writing"
									value="Fair">
								<spring:message code="languages.fair" /></label>
							</div><br>
					<label for="writing" class="error" style="display:none;"></label>
							
						</div>
						<br> <br>
						<button type="button" class="btn btn-success" id="btn_save">
							<span class="glyphicon glyphicon-off"></span>
							<spring:message code="edit.button.save" />
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<spring:message code="button.cancel" />
						</button>
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
		<table id="languagesTable" class="display" cellspacing="0"
			width="100%">
			<thead>
				<tr>
					<th><spring:message code="languages.name" /></th>
					<th><spring:message code="languages.speak" /></th>
					<th><spring:message code="languages.read" /></th>
					<th><spring:message code="languages.understand" /></th>
					<th><spring:message code="languages.write" /></th>
					<th><spring:message code="main.edit.info" /></th>
					<th><spring:message code="main.delete" /></th>

				</tr>
			</thead>


			<tbody></tbody>
		</table>
		<div align="right">
			<button class="btn btn-warning" id="languagesAdd" data-toggle="modal"><span class="glyphicon glyphicon-plus"></span><spring:message code="languages.name.add" /></button>
			<button class="btn btn-default" type="button" id="buttonBack" name="buttonBack" onclick="window.location='${pageContext.request.contextPath}/applicant'"><span class="glyphicon glyphicon-step-backward"></span> Back </button>
		</div>
	</div>
</div>