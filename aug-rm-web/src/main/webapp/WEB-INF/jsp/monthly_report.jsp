<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
$(document).ready(function () {
	var dtReport;
    $('input[name="applyDate"]').daterangepicker({
        format: 'MM/DD/YYYY'
        
    });

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
					url: '${pageContext.request.contextPath}/report/searchMonth',
					data: function (d) {
						d.applyDateStr = $('#applyDate').val();
						console.log(d.applyDateStr);
					},
				},
			columns : [
			           {"data": "code"},
				       {"data": "applyDateStr"},
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

<f:form method="post" name="reportForm" target="_blank" commandName="searchReportDTO" action="${pageContext.request.contextPath}/reportMonthly/preview" cssClass="form-horizontal">
<h1 align="center"> <spring:message code="report.text.monthly"/> </h1>
<h4 > <spring:message code="report.text.search.month"/> </h4>
	<div class="row">
        <div class="col-md-2">
			<div class="form-group">
					<input type="text" name="applyDate" id="applyDate" class="form-control" />
            </div>
       </div>
   		<div class="col-md-1" align="left">
   		 	<button type="button" class="btn btn-primary" id="btn_search"><span class="glyphicon glyphicon-search"></span> <spring:message code="report.text.search"/> </button>				
   		</div>
    </div>
    <div class="row">
    	<div class="col-md-2" align="right">
    		<div class="form-group">
    			<label for="reportType"><spring:message code="report.text.type"/> </label>
				<input type="radio" value="pdf" id="reportType" name="reportType" checked="checked"> <spring:message code="report.text.pdf"/> 
				<input type="radio" value="xls" id="reportType" name="reportType"> <spring:message code="report.text.xls"/> 
    		</div>
    	</div>
   		<div class="col-md-1" align="left">	
   			<button type="button" class="btn btn-primary submit" data-toggle="modal" data-target="#previewReportModal" id="btn_preview"><span class="glyphicon glyphicon-search"></span> <spring:message code="request.preview"/> </button>			 				
		</div>
	</div>
	
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