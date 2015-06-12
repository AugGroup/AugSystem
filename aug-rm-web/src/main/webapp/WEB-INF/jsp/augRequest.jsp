<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>Request for Application</title>

<style type="text/css">
	.bs-example{
		 margin: 20px;
	}
    .form-horizontal .control-label{
        padding-top: 7px;
    }
    .error{
     	color :red;
 		padding: 3px;
	}
</style>

<script type="text/javascript">
    $(document).ready(function () {
    	/* ------------------ Date picker format ------------------ */
    	$('.input-group.date').datepicker({
    		format: "dd/mm/yyyy",
			startView: 2
			}); 
    	
		/*validate date
		$('#inputRequestDate').datepicker({
			format: "dd/mm/yyyy",
			startView: 2,
			minDate: 0,
			onSelect: function (date) {
	            var date2 = $('#inputRequestDate').datepicker('getDate');
	            date2.setDate(date2.getDate() + 1);
	            $('#inputApproveDate').datepicker('setDate', date2);
	            //sets minDate to dt1 date + 1
	            $('#inputApproveDate').datepicker('option', 'minDate', date2);
	        }
		});
		$('#inputApproveDate').datepicker({
			format: "dd/mm/yyyy",
			startView: 2,
			onClose: function () {
	            var dt1 = $('#inputRequestDate').datepicker('getDate');
	            var dt2 = $('#inputApproveDate').datepicker('getDate');
	            //check to prevent a user from entering a date below date of dt1
	            if (dt2 <= dt1) {
	                var minDate = $('#inputApproveDate').datepicker('option', 'minDate');
	                $('#inputApproveDate').datepicker('setDate', minDate);
	            }
	        }
			});
			 */
			 
		/*-------------------- Validate Request Form--------------------*/
		$('#requestForm').validate({
			rules:{
				inputRequesterName:{required: true},
				inputRequestDate:{required: true},
				inputPosition:{required: true},
			  	inputApprovalName:{required: true},
				inputApproveDate:{required: true},
				inputNumberApplicant:{required: true},
				inputSpecificSkill:{required: true},
				inputYearExperience:{required: true},
				inputStatus:{required: true}
				},
			messages:{
				inputRequesterName:{required: "Requester Name is required"},
			  	inputRequestDate:{required: "Request Date is required"},
			  	inputPosition:{required: "Position is required"},
			  	inputApprovalName:{required: "Approval Name is required"},
				inputApproveDate:{required: "Approve Date is required"},
				inputNumberApplicant:{required: "Number Applicant is required"},
				inputSpecificSkill:{required: "Specific Skill is required"},
				inputYearExperience:{required: "Year Experience is required"},
				inputStatus:{required: "Status is required"}
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
        	        	  return '<button id="btn_preview" class="btn btn-primary" data-id="' + data.id + '" data-toggle="modal" data-target="#previewModal">Preview <span class="glyphicon glyphicon-search"></span></button>';
        	        	  }
        	          },
        	          {data: function (data) {
                        return '<button id="btn_edit" class="btn btn-warning" data-id="' + data.id + '" data-toggle="modal" data-target="#addRequestModal">Edit <span class="glyphicon glyphicon-edit"></span></button>';
                        }
        	          },
        	          {data: function (data) {
        	        	  return '<button id="btn_delete" class="btn btn-danger" data-id="' + data.id + '" data-toggle="modal" data-target="#deleteModal">Delete <span class="glyphicon glyphicon-remove-sign"></span></button>';
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
                	// $('#requestForm')[0].reset();
                	$('#btn_save_req').off('click').on('click', function () {
                		save();
                		});
                	}
                }
        	});

        /*-------------------- Save Function--------------------*/
        function save(button) {
        	var request = {
        			requesterName: $('#inputRequesterName').val(),
        			requestDate: $('#inputRequestDate').val(),
        			approvalName: $('#inputApprovalName').val(),
        			approveDate: $('#inputApproveDate').val(),
        			numberApplicant : $('#inputNumberApplicant').val(),
        			specificSkill: $('#inputSpecificSkill').val(),
        			yearExperience : $('#inputYearExperience').val(),
        			positionRequest : $('#inputPosition').val(),
        			status: $('#inputStatus').val()
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
            				title: 'Create request is successful.',
            				text: '',
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
            var requesterName = $('#inputRequesterName').val();
            var requestDate = $('#inputRequestDate').val();
            var approvalName = $('#inputApprovalName').val();
            var approveDate = $('#inputApproveDate').val();
            var numberApplicant = $('#inputNumberApplicant').val();
            var specificSkill = $('#inputSpecificSkill').val();
            var yearExperience = $('#inputYearExperience').val();
            var positionRequest = $('#inputPosition').val();
            var status = $('#inputStatus').val();
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
				    	nonblock: {
				       	 nonblock: true,
				       	 nonblock_opacity: .2
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
	<h1 align="center">Request Candidate</h1>
	<table id="requestTable" class="cell-border" style="width: 100%">
    	<thead>
        	<tr>
            	<th><spring:message code="request.id"/></th>
            	<th><spring:message code="request.date"/></th>
            	<th><spring:message code="request.human"/></th>
            	<th><spring:message code="info.position"/></th>
            	<th><spring:message code="request.number"/></th>
            	<th><spring:message code="main.status"/></th>
            	<th><spring:message code="request.preview"/></th>
            	<th><spring:message code="main.edit"/></th>
            	<th><spring:message code="main.delete"/></th>
        	</tr>
    	</thead>
</table>

<div class="row">
	<div class="col-md-6"></div>
	<div class="col-md-6" align="center">
		<button id="btn_addReq"class="btn btn-primary btn-info" data-toggle="modal" data-target="#addRequestModal"> Request <span class="glyphicon glyphicon-plus-sign"></span></button>
	</div>
</div>
<!-------------------- Save Modal --------------------> 
<div class="modal fade" id="addRequestModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Request Applicant</h4>
            </div>
            <div class="modal-body" style="width:400px">
                <form role='form' id="requestForm" name="requestForm" >   
                    <div class="form-group">
                        <label for="inputRequesterName">Requester</label>
                        <input type="text" class="form-control" name="inputRequesterName" id="inputRequesterName" />
                    </div>
                    <div class="form-group">
                    	<label for="inputRequestDate">Requester Date</label>
                    	<div class="input-group date">
                    		<input type="text" class="form-control" name="inputRequestDate" id="inputRequestDate"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
    					</div>
    				</div>
                    <div class="form-group">
                        <label for="inputPosition">Position</label> 
                        <select name="inputPosition" id="inputPosition" class="form-control">
                            <c:forEach items="${positionRequest}" var="items">
                                <option value="${items.id}">${items.positionName }</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="inputApprovalName">Approval Name</label>
                        <input type="text" class="form-control" name="inputApprovalName" id="inputApprovalName" />
                    </div>
                    <div class="form-group">
                    	<label for="inputApproveDate">Approval Date</label>
                    	<div class="input-group date">
                    		<input type="text" class="form-control" name="inputApproveDate" id="inputApproveDate"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
    					</div>
    				</div>
                    <div class="form-group">
                        <label for="inputNumberApplicant">Number of Applicant</label>
                        <input type="text" class="form-control" name="inputNumberApplicant" id="inputNumberApplicant" placeholder="Enter Number of Applicant" />
                    </div>
                    <div class="form-group">
                        <label for="inputSpecificSkill">Specific Skill </label>
                        <textarea class="form-control" name="inputSpecificSkill" id="inputSpecificSkill" placeholder="Enter Specific Skill"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="inputYearExperience">Year Experience</label>  
                        <input type="text" class="form-control" name="inputYearExperience" id="inputYearExperience" placeholder="Enter Year Experience"/>
                    </div>
                    <div class="form-group">
                        <label for="inputStatus">Status</label>
                         <select name="inputStatus" id='inputStatus' class="form-control" >
                            <option value ='New Request' selected ='selected'>New Request</option>
                            <option value ='Approve'>Approve</option>
                            <option value ='Not Approve'>Not Approve</option>
                        </select>
                    </div> 
                   <div align="right">
                   		<button type="button" id="btn_save_req" class="btn btn-primary btn-success">Save 
                    		<span class="glyphicon glyphicon-floppy-save"></span>
                    	</button>
                   		<button type="button" id="btn_close" class="btn btn-default" data-dismiss="modal">Close</button>                 
                	</div>
                 </form>
             </div>
         </div>
    </div>
</div>

<!-------------------- Delete Model -------------------->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="ModalLabel">Delete Request</h4>
            </div>
            <div class="modal-body">
            	<div class="container">
            		<div class="row">
               	 		Do you want to delete request ?
            		</div>
                	<div class="row">
                		<div class="col-md-4"></div>
                		<div class="col-md-2">
                			<button  id="btn_delete_submit" type="button" class="btn btn-primary" data-dismiss="modal">Delete</button>
							<button  id="btn_close" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            			</div>
            		</div>
            	</div>
        	</div>
    	</div>  
	</div>
</div>

<!-------------------- Preview Model -------------------->
<div class="modal fade" id="previewModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="ModalLabel">Request Description</h4>
            </div>
            <div class="modal-body">
            <div class="row">
            	<div class="col-md-2"></div>
				<div class="col-md-3">Requester :</div>
				<div class="col-md-6"> <p id="tx_requester"></p></div>
			</div>
			 <div class="row">
			 	<div class="col-md-2"></div>
            	<div class="col-md-3">Request Date :</div>
            	<div class="col-md-6"><p id="tx_requestDate"></p></div>
            </div>
				 <div class="row">
				 	<div class="col-md-2"></div>
				 	<div class="col-md-3">Position :</div> 
				 	<div class="col-md-6"><p id="tx_position"></p></div>
				 </div>
                 <div class="row">
                 	<div class="col-md-2"></div>
                 	<div class="col-md-3">Approval Name :</div>
                 	<div class="col-md-6"><p id="tx_approvalName"></p></div>
                 </div>
                 <div class="row">
                 	<div class="col-md-2"></div>
                 	<div class="col-md-3">Approve Date :</div>
                 	<div class="col-md-6"><p id="tx_approveDate"></p></div>
                </div>
                 <div class="row">
                 	<div class="col-md-2"></div>
                 	<div class="col-md-4">Number of Applicant :</div> 
                 	<div class="col-md-6"><p id="tx_noOfApplicant"></p></div>
                 </div>
                 <div class="row">
                 	<div class="col-md-2"></div>
                 	<div class="col-md-3">Specific Skill :</div>
                 	<div class="col-md-6"><p id="tx_specificSkill"></p></div>
                 </div>
                 <div class="row">
                 	<div class="col-md-2"></div>
                 	<div class="col-md-3">Year Experience :</div>
                 	<div class="col-md-6"><p id="tx_yearExperience"></p></div>
                 </div>
                 <div class="row">
                 	<div class="col-md-2"></div>
                 	<div class="col-md-3">Status :</div>
                 	<div class="col-md-6"><p id="tx_status"></p></div>
                 </div>
            </div>
            <div class="modal-footer">
            	<div align="right">
                 	<button  id="btn_close" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            	 </div>
            </div>
        </div>
    </div>  
</div>
</div>
 



