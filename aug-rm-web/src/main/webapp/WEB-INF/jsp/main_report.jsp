<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
$(document).ready(function () {
	var dtReport;

	
	//Search By Position and Show function 
	$('#btn_search').on('click', function(){
		if(dtReport){
			dtReport.ajax.reload();
		}else{
			dtReport = $('#reportTable').DataTable({
				searching : false,
				paging: false,
				ajax : {
					type:'GET',
					url: '${pageContext.request.contextPath}/report/search',
					data: function (d) {/* 
						d.position = $('#inputPosition').val();
						d.degree = $('#inputDegree').val();
						d.major = $('#inputMajor').val();
						d.schoolName = $('#inputSchoolName').val();
						d.gpa = $('#inputGpa').val(); */
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
    			<label for="inputGpa">GPA</label> 
				<input type="text" class="form-control" id="inputGpa" name="inputGpa" placeholder="Enter GPA">
    		</div>
   		</div>
   		<div class="col-md-2">
   			<div class="form-group" style="width:180px">
    			<label for="inputSchoolName">School Name</label> 
				<input type="text" class="form-control" id="inputSchoolName" name="inputSchoolName" placeholder="Enter School Name">
			</div>
   		</div>
   		 <div class="col-md-1">
   		 	<button type="button" class="btn btn-primary" id="btn_search"><span class="glyphicon glyphicon-search"></span> Search</button>				
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

  
  
         
