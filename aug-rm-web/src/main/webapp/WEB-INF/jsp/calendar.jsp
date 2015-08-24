<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">  
   body{  
        maring:0;padding:0;  
        font-family:tahoma, "Microsoft Sans Serif", sans-serif, Verdana;     
        font-size:12px;  
    }  
    #calendar{  
        max-width: 700px;  
        margin: 0 auto;  
        font-size:13px;  
    }          
</style>
<script>
$(document).ready(function() {
    $('#calendar').fullCalendar({  
        header: {  
            left: 'prev,next today',    
            center: 'title',  
            right: 'month,agendaWeek,agendaDay',  
        },    
        events: {  
            url: 'calendar',  
            error: function() {  
  
            }  
        },      
        eventLimit:true,  
        lang: 'th'  
    });  

});


</script>

<div style="margin:auto;width:800px;">  
 	<div id='calendar'></div>  
</div>