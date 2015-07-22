<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style type="text/css">
    .error{
     	color :red;
 		padding: 3px;
	}
	
	#reportTable{
		color:#414141;
		background-color: #ababab;
	}

	td {font-family: "Regular";
    	font-size: 18px;
   		color: #414141;
    }
    
	table.dataTable tr.odd { background-color:#e7e7e7; }
	table.dataTable tr.even { background-color:#d6d6d6; }

	.container{
		font-family: "Regular";
		position:relative;
		margin-left: 40px;
		margin-right: 40px;
		padding-right: 0px;
		padding-left: 0px;
		width: 93%;
	}

	#requestTable_previous{
		padding:3px;
	}

	#requestTable_next{
		padding:3px;
	}

	.form-group{
		margin: 3px;
	}
	
	.report_search{
		position:relative;
		padding-left:20%;
		height: 200px;
	}

	.search_inputgroup{
		float:right;
		margin: 5px;
		padding: 5px;
	}
	#radio_inputgroup{
		margin: 0px 15px 0px 5px; 
	}
	#btn_search{
		margin: 27px 5px 0px 5px;
		width: 95px;
	}
	
	#btn_preview{
		margin: 0px 5px 0px 5px;
		width: 95px;
	}
	
	#table{
		padding: 15px 5px 75px 5px;
		margin-bottom : 100px;
		background: #E0DFDD;

	}
	
}
</style>
<script type="text/javascript">
$(document).ready(function () {
	var dtReport;
	//GPA pattern
	$("#gpa").inputmask('Regex', { regex: "[0-3]\\.[0-9][0-9]?$ |4\\.00$" });
	
	//Search By Criteria and Show function 
	$('#btn_search').off('click').on('click', function(){
		if(dtReport){
			dtReport.ajax.reload();
			console.log("Eiei");
		}else{
			dtReport = $('#reportTable').DataTable({
				"columnDefs": [
				               { "width": "14%", "targets": 2 },
				               { "width": "13%", "targets": 3 },
				               { "width": "13%", "targets": 4 },
				               { "width": "13%", "targets": 5 },

				             ],
				searching : false,
				paging: true,
				ajax :{
					type:'POST',
					url: '${pageContext.request.contextPath}/report/search',
					data: function (d) {
						d.position = $('#position').val();
						d.degree = $('#degree').val();
						d.major = $('#major').val();
						d.schoolName = $('#schoolName').val();
						d.gpa = $('#gpa').val(); 
					},
					complete: function(data){
						if($('.dataTables_empty').length > 0){
							document.getElementById("btn_preview").disabled = true;
						}else document.getElementById("btn_preview").disabled = false;
					}
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
			console.log("Umm");
			
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
	<div class="report_search">
		<f:form method="post" name="reportForm" target="_blank" commandName="searchReportDTO" action="${pageContext.request.contextPath}/report/preview" cssClass="form-inline">
			
				<div class="search_inputgroup">
				<h3><spring:message code="report.text.search"/> </h3>
					<div class="form-group" style="width:216px">
						<label for="position"><spring:message code="info.position"/></label>
						<select name="position" id="position" class="form-control">
							<option value="-1"><spring:message code="report.text.select"/></option>
							<c:forEach items="${positionRequest}" var="items">
								<option value="${items.id}">${items.positionName }</option>
                			</c:forEach>
            			</select>
            		</div>
       				<div class="form-group" style="width:165px">
       					<label for="degree"><spring:message code="education.degree"/></label>
       					<select name="degree" id='degree' class="form-control" style="width:165px">
       						<option value ='' selected ='selected'><spring:message code="report.text.select"/></option>
                    		<option value ='Bachelor'>Bachelor</option>
                    		<option value ='Master'>Master</option>
                    		<option value ='Doctor'>Doctor</option>
                		</select>
       				</div>
       				<div class="form-group" style="width:165px">
       					<label for="major"><spring:message code="education.major"/></label> 
						<input type="text" class="form-control" id="major" name="major" placeholder="<spring:message code="education.text.major"/>" style="width:165px">
    				</div>
   					<div class="form-group" style="width:93px">
    					<label for="gpa"><spring:message code="education.gpa"/></label> <!-- step="0.1" -->
						<input type="text" class="form-control" maxlength="5" id="gpa" name="gpa" placeholder="0.00" style="width:93px">
    				</div>
   					<div class="form-group" style="width:165px">
    					<label for="schoolName"><spring:message code="report.text.school"/></label> 
						<input type="text" class="form-control" id="schoolName" name="schoolName" placeholder="<spring:message code="report.enter.school"/>" style="width:165px">
					</div>
					
   		 			<button type="button" class="btn btn-primary" id="btn_search"><span class="glyphicon glyphicon-search"></span> <spring:message code="main.button.search"/> </button>
				</div>
			
				<div class="search_inputgroup" align="right">
   					<div class="form-group" id="radio_inputgroup">
   						<label for="reportType"><spring:message code="report.text.type"/> </label>
							<input type="radio" value="pdf" id="reportType" name="reportType" checked="checked"> <spring:message code="report.text.pdf"/> 
							<input type="radio" value="xls" id="reportType" name="reportType"> <spring:message code="report.text.xls"/> 
    				</div>
    					  		 	
   			 		<button type="button" class="btn btn-primary submit" data-toggle="modal" data-target="#previewReportModal" id="btn_preview"><span class="glyphicon glyphicon-search"></span> <spring:message code="request.preview"/> </button>		 				
		 		</div>

 </f:form> 
 </div>

	<!------------------- Report DataTable-------------------> 
	<div id="table">
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
                    <th><spring:message code="education.degree"/></th>
                    <th><spring:message code="education.data.gpa"/></th>
                </tr>
            </thead>
         </table>
     </div>
 </div>   

  
  
         
