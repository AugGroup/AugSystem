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
				paging: true,
				ajax : {
					type:'POST',
					url: '${pageContext.request.contextPath}/report/search',
					data: function (d) {
						d.position = $('#position').val();
						d.degree = $('#degree').val();
						d.major = $('#major').val();
						d.schoolName = $('#schoolName').val();
						d.gpa = $('#gpa').val(); 
					},
				},
			columns : [
			           {"data": "code"},
				       {"data": "applyDate"},
				       {"data": "fullNameEN"},
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
	
	
 	 $(".submit").click(function() {
		$("form[name='reportForm']").submit();
	});
	 	
});
	
</script>

<div class="container">
<!------------------- Report header-------------------> 
 	<div class="row"><h1 align="center"><spring:message code="report.text"/></h1></div>
 	
<!------------------- Report search-------------------> 
<f:form method="post" name="reportForm" target="_blank" commandName="searchReportDTO" action="${pageContext.request.contextPath}/report/preview" cssClass="form-horizontal">
<h3> <spring:message code="report.text.search"/> </h3>
	<div class="row">
		<div class="col-md-2">
			<div class="form-group" style="width:180px">
				<label for="position"><spring:message code="info.position"/></label>
				<select name="position" id="position" class="form-control">
					<option value="-1"><spring:message code="report.text.select"/></option>
					<c:forEach items="${positionRequest}" var="items">
						<option value="${items.id}">${items.positionName }</option>
                	</c:forEach>
            	</select>
            </div>
       </div>
       <div class="col-md-2">
       		<div class="form-group" style="width:180px">
       			<label for="degree"><spring:message code="education.degree"/></label>
       			<input type="text" class="form-control" id="degree" name="degree" placeholder="<spring:message code="education.text.degree"/>">
       		</div>
       	</div>
       	<div class="col-md-2">
       		<div class="form-group" style="width:180px">
       			<label for="major"><spring:message code="education.major"/></label> 
				<input type="text" class="form-control" id="major" name="major" placeholder="<spring:message code="education.text.major"/>">
    		</div>
    	</div>
   		<div class="col-md-1">
   			<div class="form-group" style="width:93px">
    			<label for="gpa"><spring:message code="education.gpa"/></label> <!-- step="0.1" -->
				<input type="text"  class="form-control" id="gpa" name="gpa" placeholder="<spring:message code="education.text.gpa"/>">
    		</div>
   		</div>
   		<div class="col-md-2">
   			<div class="form-group" style="width:180px">
    			<label for="schoolName"><spring:message code="report.text.school"/></label> 
				<input type="text" class="form-control" id="schoolName" name="schoolName" placeholder="<spring:message code="report.enter.school"/>">
			</div>
   		</div>
   		</div>
   		<div class="row">
   			 <div class="col-md-8" align="right">
   				<div class="form-group">
   					<label for="reportType"><spring:message code="report.text.type"/> </label>
						<input type="radio" value="pdf" id="reportType" name="reportType" checked="checked"> <spring:message code="report.text.pdf"/> 
						<input type="radio" value="xls" id="reportType" name="reportType"> <spring:message code="report.text.xls"/> 
    			</div>
    		</div>
   		 	<div class="col-md-2" align="left">
   		 		<button type="button" class="btn btn-primary" id="btn_search"><span class="glyphicon glyphicon-search"></span> <spring:message code="main.button.search"/> </button>		
   		 	</div>
   			 <div class="col-md-1" align="left">	
   			 	<button type="button" class="btn btn-primary submit" data-toggle="modal" data-target="#previewReportModal" id="btn_preview"><span class="glyphicon glyphicon-search"></span> <spring:message code="request.preview"/> </button>		 				
		 	</div>
		 </div>

	
	<!------------------- Report Modal preview and download -------------------->
	<!-- <div class="modal fade" id="previewReportModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   		<div class="modal-dialog">
        	<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h4 class="modal-title"> Report</h4>
				</div>
 				
 					<div class="modal-body"> Report	
						<div class="col-md-7" align="right">
   							<div class="form-group">
   								<label for="inputReportType">Report Type </label>
								<input type="radio" value="pass" id="inputReportType" name="inputReportType"> PDF 
								<input type="radio" value="Not pass" id="inputReportType" name="inputReportType"> XLS 
					        </div>
    	                </div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default submit" value="preview" id="btn_submit">Preview</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				
			</div>
		</div>
	</div>
 -->
 </f:form> 

	<!------------------- Report DataTable-------------------> 
	<div class="row">
    	<table id="reportTable" class="cell-border" style="width: 100%">
            <thead>
                <tr>
                    <th><spring:message code="main.code"/></th>
                    <th><spring:message code="info.apply.date"/></th>
                    <th><spring:message code="main.name"/></th>
                    <th><spring:message code="main.position1"/></th>
                    <th><spring:message code="main.position2"/></th>
                    <th><spring:message code="main.position3"/></th>
                    <th><spring:message code="report.data.school"/></th>
                    <th><spring:message code="education.data.degree"/></th>
                    <th><spring:message code="education.data.gpa"/></th>
                </tr>
            </thead>
         </table>
     </div>
 </div>   

  
  
         
