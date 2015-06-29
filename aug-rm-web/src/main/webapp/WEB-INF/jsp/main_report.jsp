<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
$(document).ready(function () {
	var dtReport;

	
	//Search By Position and Show function 
	$('#btn_search').off('click').on('click', function(){
		if(dtReport){
			dtReport.ajax.reload();
		}else{
			dtReport = $('#reportTable').DataTable({
				searching : false,
				paging: false,
				ajax : {
					type:'POST',
					url: '${pageContext.request.contextPath}/report/search',
					data: function (d) {
						d.position = $('#inputPosition').val();
						d.degree = $('#inputDegree').val();
						d.major = $('#inputMajor').val();
						d.schoolName = $('#inputSchoolName').val();
						d.gpa = $('#inputGPA').val(); 
					},
				},
			columns : [
			           {"data": "code"},
				       {"data": "applyDate"},
				       {"data": "firstNameEN"},
				       {"data": "positionName1"},
				       {"data": "positionName2"},
				       {"data": "positionName3"},
				       {"data": "schoolName"},
				       {"data": "degree"},
				       {"data": "gpa"},
				       ]
			});
		}
		});
	$('#btn_search').trigger("click");
	
	
/* 	$(".submit").click(function() {
		$("form[name='reportForm']").submit();
		$("#previewReportModal").modal("hide");
		previewReport();
	});
	 */
	
	
});
	
</script>

<div class="container">
<!------------------- Report header-------------------> 
 	<div class="row"><h1 align="center">Report</h1></div>
 	
<!------------------- Report search-------------------> 
<h3> Search By : </h3>
	<div class="row">
		<div class="col-md-2">
			<div class="form-group" style="width:180px">
				<label for="inputPosition">Position</label>
				<select name="inputPosition" id="inputPosition" class="form-control">
					<option value="-1">please select</option>
					<c:forEach items="${positionRequest}" var="items">
						<option value="${items.id}">${items.positionName }</option>
                	</c:forEach>
            	</select>
            </div>
       </div>
       <div class="col-md-2">
       		<div class="form-group" style="width:180px">
       			<label for="inputDegree">Degree</label>
       			<input type="text" class="form-control" id="inputDegree" name="inputDegree" placeholder="Enter Degree">
       		</div>
       	</div>
       	<div class="col-md-2">
       		<div class="form-group" style="width:180px">
       			<label for="inputMajor">Major</label> 
				<input type="text" class="form-control" id="inputMajor" name="inputMajor" placeholder="Enter Major">
    		</div>
    	</div>
   		<div class="col-md-1">
   			<div class="form-group" style="width:93px">
    			<label for="inputGPA">GPA</label> 
				<input type="text" class="form-control" id="inputGPA" name="inputGPA" placeholder="Enter GPA">
    		</div>
   		</div>
   		<div class="col-md-2">
   			<div class="form-group" style="width:180px">
    			<label for="inputSchoolName">School Name</label> 
				<input type="text" class="form-control" id="inputSchoolName" name="inputSchoolName" placeholder="Enter School Name">
			</div>
   		</div>
   		 <div class="col-md-1" align="bottom">
   		 	<button type="button" class="btn btn-primary" id="btn_search"><span class="glyphicon glyphicon-search"></span> Search </button>				
		 </div>
    </div>
	<!------------------- Report preview and download --------------------> 
	<div class="row" >
		 <div class="col-md-8"></div>
		 <div class="col-md-1">
   		 	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#previewReportModal" id="btn_preview"> Preview </button>				
		 </div>
		 <div class="col-md-1">
   		 	<button type="button" class="btn btn-default" id="btn_download"> Download </button>				
		 </div>
	</div>
	
	<!------------------- Report Modal preview and download -------------------->
	<div class="modal fade" id="previewReportModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   		<div class="modal-dialog">
        	<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title"> Report</h4>
				</div>
				<f:form method="post" name="reportForm" target="_blank" commandName="applicant" action="${pageContext.request.contextPath}/report/preview" cssClass="form-horizontal">
					<div class="modal-body">
						  Report
					</div><%-- 
					<div class="form-group form-group-sm">
						<div class="col-sm-3"> Document Type </div>
						 <div class="col-sm-6">
							 <label class="radio-inline"><f:radiobutton  path="reportType" value="pdf"/>Pdf</label>
							 <label class="radio-inline"><f:radiobutton path="reportType" value="xls"/>Xls</label>
						 </div>
					 </div> --%>
		
				<div class="modal-footer">
					<button type="button" class="btn btn-default submit" value="preview" id="btn_submit">Preview</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
				</f:form>
			</div>
		</div>
	</div>



	<!------------------- Report DataTable-------------------> 
	<div class="row">
    	<table id="reportTable" class="cell-border" style="width: 100%">
            <thead>
                <tr>
                    <th>ID Code</th>
                    <th>Apply Date</th>
                    <th>Name</th>
                    <th>Position1</th>
                    <th>Position2</th>
                    <th>Position3</th>
                    <th>School Name</th>
                    <th>Degree</th>
                    <th>GPA</th>
                </tr>
            </thead>
         </table>
     </div>
 </div>   

  
  
         
