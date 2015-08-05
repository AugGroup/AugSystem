<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title><spring:message code="request.application" /></title>

<script type="text/javascript">
    $(document).ready(function () {
        var $inputRequesterName = $('#inputRequesterName');
        var $inputRequestDate = $('#inputRequestDate');
        var $inputApprovalName = $('#inputApprovalName');
        var $inputApproveDate = $('#inputApproveDate');
        var $inputNumberApplicant = $('#inputNumberApplicant');
        var $inputSpecificSkill = $('#inputSpecificSkill');
        var $inputYearExperience = $('#inputYearExperience');
        var $inputPosition = $('#inputPosition');
        var $inputStatus = $('#inputStatus');
        
    	/* ------------------ Date picker format ------------------ */
    	$('.input-group.date').datepicker({
    		format: "dd/mm/yyyy",
			startView: 2,
			autoclose: true 
			}); 
    	/* ------------------ajax setup ------------------ */
    	$.ajaxSetup({
    		/* statusCode: */
    		 statusCode : {
        		400: function() {
        			window.location="/AugRmSystem/exception/400"
        		},
        		404: function() {
        			window.location="/AugRmSystem/exception/404"
          		},
          		415: function() {
            		window.location="/AugRmSystem/exception/415"
          		},
          		500: function() {
            		window.location="/AugRmSystem/exception/500"
          		},
        		
   			 }, 
    		 error: function(jqXHR, textStatus, errorThrown){
    			 window.location="/AugRmSystem/exception/custom"
	          /*    var exceptionVO = jQuery.parseJSON(jqXHR.responseText);
	            console.log(jqXHR.status);
	            $('#exceptionModal')
	            .find('.modal-header h3').html(jqXHR.status+' error').end()
	            .find('.modal-body p>strong').html(exceptionVO.clazz).end()
	            .find('.modal-body p>em').html(exceptionVO.method).end()
	            .find('.modal-body p>span').html(exceptionVO.message).end()
	            .modal('show');  */ 
	            
	        }  
    	});
    	
		
			 
		/*-------------------- Validate Request Form--------------------*/
		$('#requestForm').validate({
			rules:{
				inputRequesterName:{required: true},
				inputRequestDate:{required: true},
				inputPosition:{required: true},
			  	inputApprovalName:{required: true},
				inputApproveDate:{required: true},
				inputNumberApplicant:{required: true,digits: true},
				inputSpecificSkill:{required: true},
				inputYearExperience:{required: true,digits: true},
				inputStatus:{required: true}
				},
			messages:{
				inputRequesterName:{required: "<spring:message code="valid.req.name"/>"},
			  	inputRequestDate:{required: "<spring:message code="valid.req.date"/>"},
			  	inputPosition:{required: "<spring:message code="valid.req.position"/>"},
			  	inputApprovalName:{required: "<spring:message code="valid.req.approval"/>"},
				inputApproveDate:{required: "<spring:message code="valid.req.approve.date"/>"},
				inputNumberApplicant:{required: "<spring:message code="valid.req.applicant"/>",
									digits: "<spring:message code="valid.info.tel.number"/>"},
				inputSpecificSkill:{required: "<spring:message code="valid.req.skill"/>"},
				inputYearExperience:{required: "<spring:message code="valid.req.year"/>",
									digits: "<spring:message code="valid.info.tel.number"/>"},
				inputStatus:{required: "<spring:message code="valid.req.status"/>"}
				}
			  	});
			 
		/*-------------------- DataTable--------------------*/	 
        var dtRequest;
        if(dtRequest){
        	dtRequest.ajax.reload();
		}else{
         dtRequest = $('#requestTable').DataTable({
        	 searching : true,
        	 paging: 10,
        	 sort : false,
        	 "columnDefs": [
        	                { "width": "5%", "targets": 0 },
        	                { "width": "10%", "targets": 1 },
        	                { "width": "17%", "targets": 2 },
        	                { "width": "7%", "targets": 4 },
        	                
				             ],
        	 /* order: [[ 2, 'asc' ]], */
        	 ajax: {
        		 type: "GET",
        		 url: '${pageContext.request.contextPath}/request/search'
        		 },
        	columns: [
        	          {"data": "id"},
        	          {"data": "requestDate"},
        	          {"data": "requesterName"},
        	          {"data": "positionStr"},
        	          {"data": "numberApplicant"},
        	          {"data": "status"},
        	          {data: function (data) {
        	        	  return '<button id="btn_preview" class="btn btn-primary" data-id="' + data.id + '" data-toggle="modal" data-target="#previewModal"><spring:message code="request.preview"/> <span class="glyphicon glyphicon-search"></span></button>';
        	        	  }
        	          },
        	          {data: function (data) {
        	        	  if(data.status!="Approve"){
                        	return '<button id="btn_edit" class="btn btn-warning" data-id="' + data.id + '" data-toggle="modal" data-target="#addRequestModal"><spring:message code="main.edit.info"/> <span class="glyphicon glyphicon-edit"></span></button>';
        	        	  }else{
        	        		  return '<button id="btn_edit" class="btn btn-warning" data-id="' + data.id + '" data-toggle="modal" data-target="#addRequestModal" disabled><spring:message code="main.edit.info"/> <span class="glyphicon glyphicon-edit"></span></button>';
            	          }
        	        	}
        	          },
        	          {data: function (data) {
        	        	  if(data.status!="Approve"){
        	        	 	  return '<button id="btn_delete" class="btn btn-danger" data-id="' + data.id + '" data-toggle="modal" data-target="#deleteModal"><spring:message code="main.delete"/> <span class="glyphicon glyphicon-remove-sign"></span></button>';
        	        	  }else{
        	        		  return '<button id="btn_delete" class="btn btn-danger" data-id="' + data.id + '" data-toggle="modal" data-target="#deleteModal" disabled ><spring:message code="main.delete"/> <span class="glyphicon glyphicon-remove-sign"></span></button>'}
        	         	  }
        	          }
        	          ]
        		 });
         }
        
        /*-------------------- Delete Modal Function--------------------*/
        $('#deleteModal').off("click").on('shown.bs.modal', function (e) {
        	var button = e.relatedTarget;
            var id = $(button).data("id");
            if (id !== null) {
            	$('#btn_delete_submit').on('click', function () {
            		deleted(button);
            		});
            	}
            });
        /*-------------------- Delete Function--------------------*/
        function deleted(button) {
        	var dtRequest = $('#requestTable').DataTable();
            var id = $(button).data("id");
            var index = dtRequest.row(button.closest("tr")).index();
            $.ajax({
                url: "${pageContext.request.contextPath}/request/delete/" + id,
                type: "POST",
                success: function () {
                    dtRequest.row(index).remove().draw();
                }
            });
        }

        /*-------------------- Save and Edit Request Modal Function--------------------*/
        $('#addRequestModal').off("click").on('shown.bs.modal', function (e) {
        	var button = e.relatedTarget;
        	if (button != null) {
        		var id = $(button).data("id");
                if (id != null) {
                	editSearch(id);
                	$('#btn_save_req').off('click').on('click', function () {
                		edit(button);
                		});
                } else {
                	$('#requestForm')[0].reset();
                	$('#btn_save_req').off('click').on('click', function () {
                		save();
                		});
                	}
                }
        	});

        /*-------------------- Save Function--------------------*/
        function save(button) {
        	var request = {
        			requesterName: $inputRequesterName.val(),
        			requestDate: $inputRequestDate.val(),
        			approvalName: $inputApprovalName.val(),
        			approveDate: $inputApproveDate.val(),
        			numberApplicant : $inputNumberApplicant.val(),
        			specificSkill: $inputSpecificSkill.val(),
        			yearExperience : $inputYearExperience.val(),
        			positionRequest : $inputPosition.val(),
        			status: $inputStatus.val()
        			};
        	//console.log(request);
        	var isValid = $("#requestForm").valid();
            //debugger;
            if(isValid){
            	$.ajax({
            		contentType: "application/json",
            		type: "POST",
            		url: '${pageContext.request.contextPath}/request/save',
            		data: JSON.stringify(request),
            		success: function (data) {
            			$('#addRequestModal').modal('hide');
            			dtRequest.ajax.reload();
            			//console.log(data.requesterName);
            			new PNotify({
    				    	title: 'Edit request is successful.',
    				    	text: '',
    				    	type: 'success',
    				    	delay: 3000,
    				    	buttons: {
    				    			closer_hover: false,
    				    	        sticker: false
    				    	    }
    					});
            		},
            		 
            	});
            };
           }
        
        /*-------------------- Edit Function (Search id)--------------------*/
        function editSearch(id) {
        	$.ajax({
        		url: "${pageContext.request.contextPath}/request/search/" + id,
        		type: "POST",
        		success: function (data) {
        			editShowData(data);
        		}
        		
        	});
        }
        
        /*-------------------- Edit Function (Fill Data)--------------------*/
        function editShowData(data) {
        	$('#inputRequesterName').val(data.requesterName);
            $('#inputRequestDate').val(data.requestDate);
            $('#inputApprovalName').val(data.approvalName);
            $('#inputApproveDate').val(data.approveDate);
            $('#inputNumberApplicant').val(data.numberApplicant);
            $('#inputSpecificSkill').val(data.specificSkill);
            $('#inputYearExperience').val(data.yearExperience);
            $('#inputPosition').val(data.positionRequest);
            $('#inputStatus').val(data.status);
        }
       
        /*-------------------- Edit Function --------------------*/
        function edit(button){
            var id = $(button).data("id");
            var requesterName = $inputRequesterName.val();
            var requestDate = $inputRequestDate.val();
            var approvalName = inputApprovalName.val();
            var approveDate = $inputApproveDate.val();
            var numberApplicant = $inputNumberApplicant.val();
            var specificSkill = $inputSpecificSkill.val();
            var yearExperience = $inputYearExperience.val();
            var positionRequest = $inputPosition.val();
            var status = $inputStatus.val();
            var index = dtRequest.row(button.closest("tr")).index();
            
            var request = {
                'id': id,
                'requesterName': requesterName,
                'requestDate' : requestDate,
                'approvalName' : approvalName,
                'approveDate' : approveDate,
                'numberApplicant': numberApplicant,
                'specificSkill': specificSkill,
                'yearExperience': yearExperience, 
                'positionRequest':positionRequest,
                'status': status
            };
            if($("#requestForm").valid()){
            $.ajax({
                contentType: "application/json",
                type: "POST",
                url: "${pageContext.request.contextPath}/request/edit/" + id,
                data: JSON.stringify(request),
                success: function (data) {
                	//console.log(data.positionStr);
                    var dt = dtRequest.data();
                    dt.id = data.id;
                    dt.requesterName = data.requesterName;
                    dt.requestDate = data.requestDate;
                    dt.approvalName = data.approvalName;
                    dt.approveDate = data.approveDate;
                    dt.numberApplicant = data.numberApplicant;
                    dt.specificSkill = data.specificSkill;
                    dt.yearExperience = data.yearExperience;
                    dt.status = data.status;
                    dt.positionStr = data.positionStr;
                    dtRequest.row(index).data(dt).draw();
                    $("#addRequestModal").modal('hide');
                    new PNotify({
				    	title: 'Edit request is successful.',
				    	text: '',
				    	type: 'success',
				    	delay: 3000,
				    	buttons: {
				    			closer_hover: false,
				    	        sticker: false
				    	    }
					});
                }
            });
            };
        }

        /*-------------------- Preview Modal Function --------------------*/
        $('#previewModal').off("click").on('shown.bs.modal', function (e) {
            var button = e.relatedTarget;
            var id = $(button).data("id");
            if (id !== null) {
            	$.ajax({
            		url : "${pageContext.request.contextPath}/request/search/" + id,
					type : "POST",
					success : function(data){
						previewShowData(data);
					}
            	});
            }
        });
      
        /*-------------------- Preview Function --------------------*/
        
        function previewShowData(data){
        	//console.log(data.requesterName);
        	$('#tx_requester').text(data.requesterName);
            $('#tx_requestDate').text(data.requestDate);
            $('#tx_approvalName').text(data.approvalName);
            $('#tx_approveDate').text(data.approveDate);
            $('#tx_noOfApplicant').text(data.numberApplicant);
            $('#tx_specificSkill').text(data.specificSkill);
            $('#tx_yearExperience').text(data.yearExperience);
            $('#tx_position').text(data.positionRequest);
            $('#tx_status').text(data.status);
            }
        });
</script>

<div class="container">
	<h1 align="center"><spring:message code="request.title"/></h1>
	<div id="table">
		<table class="dataTable" id="requestTable" class="cell-border" style="width: 100%">
			<thead>
				<tr>
					<th><spring:message code="request.id" /></th>
					<th><spring:message code="request.date" /></th>
					<th><spring:message code="request.human" /></th>
					<th><spring:message code="info.position" /></th>
					<th><spring:message code="request.number" /></th>
					<th><spring:message code="main.status" /></th>
					<th><spring:message code="request.preview" /></th>
					<th><spring:message code="main.edit" /></th>
					<th><spring:message code="main.delete" /></th>
				</tr>
			</thead>
		</table>
		<button id="btn_new_req" class="btn btn-warning" data-toggle="modal" data-target="#addRequestModal">
			<spring:message code="request.button" /><span class="glyphicon glyphicon-plus-sign"></span>
		</button>
	</div>


	<!-------------------- Save Modal -------------------->
	<div class="modal fade" id="addRequestModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel"><spring:message code="request.title.appli"/></h4>
				</div>
				<div class="modal-body" >
					<form role='form' id="requestForm" name="requestForm">
						<div style="width: 400px; padding-left: 50px;">
						<div class="form-group">
							<label for="inputRequesterName"><spring:message code="request.human" /></label> 
							<input type="text" class="form-control" name="inputRequesterName" id="inputRequesterName" />
						</div>
						<div class="form-group">
							<label for="inputRequestDate"><spring:message code="request.date" /></label>
							<div class="input-group date">
								<input type="text" class="form-control" name="inputRequestDate" id="inputRequestDate">
								<span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPosition"><spring:message code="info.position" /></label> 
							<select name="inputPosition" id="inputPosition" class="form-control">
								<c:forEach items="${positionRequest}" var="items">
									<option value="${items.id}">${items.positionName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="inputApprovalName"><spring:message code="request.approve.name" /></label> 
							<input type="text" class="form-control" name="inputApprovalName" id="inputApprovalName" />
						</div>
						<div class="form-group">
							<label for="inputApproveDate"><spring:message code="request.approve.date" /></label>
							<div class="input-group date">
								<input type="text" class="form-control" name="inputApproveDate" id="inputApproveDate">
								<span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
							</div>
						</div>
						<div class="form-group">
							<label for="inputNumberApplicant"><spring:message code="request.number" /></label> 
							<input type="text" class="form-control" name="inputNumberApplicant" id="inputNumberApplicant"
								placeholder="<spring:message code="request.text.number"/>" />
						</div>
						<div class="form-group">
							<label for="inputSpecificSkill"><spring:message code="request.skill" /> </label>
							<textarea class="form-control" name="inputSpecificSkill" id="inputSpecificSkill"
								placeholder="<spring:message code="request.text.skill"/>"></textarea>
						</div>
						<div class="form-group">
							<label for="inputYearExperience"><spring:message code="request.year" /></label> 
							<input type="text" class="form-control" name="inputYearExperience" id="inputYearExperience"
								placeholder="<spring:message code="request.text.year"/>" />
						</div>
						<div class="form-group">
							<label for="inputStatus"><spring:message code="main.status" /></label> 
							<select name="inputStatus" id='inputStatus' class="form-control">
								<option value='New Request' selected='selected'><spring:message code="request.new" /></option>
								<option value='Approve'><spring:message code="edit.approve" /></option>
								<option value='Not Approve'><spring:message code="edit.notApprove" /></option>
							</select>
						</div>
						</div>
						<div align="right" style="padding: 15px 35px 15px 15px;">
							<button type="button" id="btn_save_req" style="width: 100px;" class="btn btn-success">
								<spring:message code="edit.button.save"/>  <span class="glyphicon glyphicon-floppy-save"></span>
							</button>
							<button type="button" id="btn_close"  style="width: 100px;" class="btn btn-default" data-dismiss="modal">
								<spring:message code="button.cancel" />
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-------------------- Delete Model -------------------->
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
						<spring:message code="request.delete" />
					</h4>
				</div>
				<div class="modal-body">
					<div class="container">
						<div class="row" >
							<spring:message code="request.ask" />
							<br><br>
						</div>
						<div class="row" style="float: right; padding-right: 20px;">
								<button id="btn_delete_submit" type="button" class="btn btn-primary" data-dismiss="modal">
									<spring:message code="main.delete" />
								</button>
								<button id="btn_close" type="button" class="btn btn-default" data-dismiss="modal">
									<spring:message code="button.cancel" />
								</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-------------------- Preview Model -------------------->
	<div class="modal fade" id="previewModal" tabindex="-1" role="dialog"
		aria-labelledby="ModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="ModalLabel"><spring:message code="request.desc" /></h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-4 col-md-offset-2" style="width: 170px;"><spring:message code="request.request" /></div>
						<div class="col-md-6"><p id="tx_requester"></p></div>
					</div>
					<div class="row">
						<div class="col-md-4 col-md-offset-2" style="width: 170px;"><spring:message code="request.request.date" /></div>
						<div class="col-md-6"><p id="tx_requestDate"></p></div>
					</div>
					<div class="row">
						<div class="col-md-4" style="width: 170px;"><spring:message code="request.pos" /></div>
						<div class="col-md-6"><p id="tx_position"></p></div>
					</div>
					<div class="row">
						<div class="col-md-4 col-md-offset-2" style="width: 170px;"><spring:message code="request.approv.name" /></div>
						<div class="col-md-6"><p id="tx_approvalName"></p></div>
					</div>
					<div class="row">
						<div class="col-md-4 col-md-offset-2" style="width: 170px;"><spring:message code="request.approv.date" /></div>
						<div class="col-md-6"><p id="tx_approveDate"></p></div>
					</div>
					<div class="row">
						<div class="col-md-4 col-md-offset-2" style="width: 170px;"><spring:message code="request.number.appli" /></div>
						<div class="col-md-6"><p id="tx_noOfApplicant"></p></div>
					</div>
					<div class="row">
						<div class="col-md-4 col-md-offset-2" style="width: 170px;"><spring:message code="request.spec.skill" /></div>
						<div class="col-md-6"><p id="tx_specificSkill"></p></div>
					</div>
					<div class="row">
						<div class="col-md-4 col-md-offset-2" style="width: 170px;"><spring:message code="request.year.exper" /></div>
						<div class="col-md-6"><p id="tx_yearExperience"></p></div>
					</div>
					<div class="row">
						<div class="col-md-4 col-md-offset-2" style="width: 170px;"><spring:message code="request.request.status"/></div>
						<div class="col-md-6"><p id="tx_status"></p></div>
					</div>
				</div>
				<div class="modal-footer">
					<div align="right">
						<button id="btn_close" type="button" class="btn btn-default" data-dismiss="modal">
							<spring:message code="button.cancel" />
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-------------------- Exception Model -------------------->
	<!-- <div class="modal fade" id="exceptionModal" tabindex="-1" role="dialog"
		aria-labelledby="ModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h3 class="modal-title" id="ModalLabel">Exception Handler</h3>
				</div>
				<div class="modal-body">
					<div class="container">
						<div class="row">
							<div class="col-sm-5">
								<p>
									<b></b><em></em><span></span>
								</p>
							</div>
						</div>
						<div class="row">
							<h4>Contact me +22003455!!!</h4>
						</div>
						<div class="row">
							<div class="col-sm-4"></div>
							<div class="col-sm-2">
								<button id="btn_close" type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> -->

</div>
