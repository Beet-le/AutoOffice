<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()
				+":"+request.getServerPort()+path+"/";
String socketPath = request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=basePath %>fullcalendar/fullcalendar.css" />
<link rel="stylesheet" media='print' 
	href="<%=basePath %>fullcalendar/fullcalendar.print.css" />
</head>
<body style="background-color: #f1f1f1">
	
<div id='calendar'></div>
	
<script type="text/javascript" src="<%=basePath %>fullcalendar/moment.min.js">
</script>
<script type="text/javascript" src="<%=basePath %>fullcalendar/fullcalendar.min.js">
</script>
<script type="text/javascript" src="<%=basePath %>fullcalendar/zh-cn.js">
</script>
<script type="text/javascript">
    	+function ($){
    		var bodyHeight = window.screen.height-290;
    		var today = '${today}';
    		var username = '${usname}'
    		initFullCalendar(bodyHeight,today,username);
    	}(jQuery);
    	
    	function initFullCalendar(bodyHeight,defaultDate,username){
    		$('#calendar').fullCalendar({
    		    			height:bodyHeight,
    		    			defaultDate:defaultDate,
    		    			selectable: true,
    		    			selectHelper: true,
    		    			editable: true,
    		    			lang:'zh-cn',
    		    			eventLimit: true, // allow "more" link when too many events
    		    			eventClick: function(calEvent, jsEvent, view) {
    		    				$(this).css('border-color', 'yellow');
    		    				
    		    				$("#msgContent").val(calEvent.content);
    		    				$("#msgDialog").modal();
    		    			},
    		    			events: {
    		    				url:basePath+'monthCkin?username='+username
    		    			}
    		    		});
    	}
    </script>
</body>
</html>
