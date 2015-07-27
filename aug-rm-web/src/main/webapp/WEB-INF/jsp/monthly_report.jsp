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
		padding-left:60%;
		height: 180px;
	}

	.search_inputgroup{
		float:right;
		margin: 5px;
		padding: 5px;
	}
	#radio_inputgroup{
		margin: 0px 15px 0px 5px; 
	}
	
	
	#btn_preview, #btn_search{
		margin: 0px 5px 0px 5px;
		width: 95px;
	}
	
	#table{
		padding: 15px 5px 75px 5px;
		margin-bottom : 100px;
		background: #E0DFDD;
	}
	#btn_search{
	float: right;
	}
}
</style>
<script type="text/javascript">
$(document).ready(function () {
	var dtReport;
    $('input[name="applyDateStr"]').daterangepicker({
        format: 'DD/MM/YYYY'
        
    });

	//Search By Position and Show function 
	$('#btn_search').off('click').on('click', function(){
		if(dtReport){
			dtReport.ajax.reload();
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
				ajax : {
					type:'POST',
					url: '${pageContext.request.contextPath}/report/searchMonth',
					data: function (d) {
						d.applyDateStr = $('#applyDateStr').val();
						/* console.log(d.applyDateStr); */
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
 	<div class="row"><h1 align="center"><spring:message code="report.text.monthly"/></h1></div>
 
<!------------------- Report search-------------------> 
	<div class="report_search">
		<f:form method="post" name="reportForm" target="_blank" commandName="searchReportDTO" action="${pageContext.request.contextPath}/reportMonthly/preview" cssClass="form-inline">
			<div class="search_inputgroup">
				<h3><spring:message code="report.text.search.month"/></h3>
				<div class="form-group" style="width:210px">
					<input type="text" name="applyDateStr" id="applyDateStr" class="form-control" style="width:210px" />
            	</div>
       			<button type="button" class="btn btn-primary" id="btn_search"><span class="glyphicon glyphicon-search"></span> <spring:message code="main.button.search"/> </button>				
   			</div>
    	
   			<div class="search_inputgroup" >
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
