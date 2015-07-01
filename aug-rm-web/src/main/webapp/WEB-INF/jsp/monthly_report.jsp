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
					url: '${pageContext.request.contextPath}/report/searchMonth',
					data: function (d) {
						d.applyDate = $('#applyDate').val(); 
						console.log(d.applyDate);
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

<f:form method="post" name="reportForm" target="_blank" commandName="searchReportDTO" action="${pageContext.request.contextPath}/reportMonthly/preview" cssClass="form-horizontal">
<h1 align="center"> Monthly Report </h1>
<h4 > Search By Month : </h4>
	<div class="row">
		<div class="col-md-2">
			<div class="form-group" style="width:200px">
				<select name="applyDate" id="applyDate" class="form-control">
					<option value="-1"> -please select month- </option>
					<option value="01">January</option>
					<option value="02">Febuary</option>
					<option value="03">March</option>
					<option value="04">April</option>
					<option value="05">May</option>
					<option value="06">June</option>
					<option value="07">July</option>
					<option value="08">August</option>
					<option value="09">September</option>
					<option value="10">October</option>
					<option value="11">November</option>
					<option value="12">December</option>
            	</select>
            </div>
       </div>
   		<div class="col-md-1" align="left">
   		 	<button type="button" class="btn btn-primary" id="btn_search"><span class="glyphicon glyphicon-search"></span> Search </button>				
   		</div>
    </div>
    <div class="row">
    	<div class="col-md-2" align="right">
    		<div class="form-group">
    			<label for="reportType">Report Type </label>
				<input type="radio" value="pdf" id="reportType" name="reportType" checked="checked"> PDF 
				<input type="radio" value="xls" id="reportType" name="reportType"> XLS 
    		</div>
    	</div>
   		<div class="col-md-1" align="left">	
   			<button type="button" class="btn btn-primary submit" data-toggle="modal" data-target="#previewReportModal" id="btn_preview"><span class="glyphicon glyphicon-search"></span> Preview </button>			 				
		</div>
	</div>
	
</f:form>

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