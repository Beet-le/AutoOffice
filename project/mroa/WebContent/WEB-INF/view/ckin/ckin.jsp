<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String socketPath = request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>明日科技</title>
    
    
    <link href="<%=basePath %>calendar/css/style.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="<%=basePath %>bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- fullcalendar -->
    <link rel="stylesheet" href="<%=basePath %>fullcalendar/fullcalendar.css" />
    <link rel="stylesheet" media='print' href="<%=basePath %>fullcalendar/fullcalendar.print.css" />
    
	<style type="text/css">

	</style>
</head>
<body style="background-color: #f1f1f1">
		
	<div class="container-fluid">
		<form action="" class="form-inline" style="padding: 30px 0px 30px 30px;">
			<div  class="form-group">
				<label for="selDay">年月</label>
				<input type="text" name="defaultDay" id="defaultDay" style="width: 160px;" readonly="readonly" >
			</div>
			
			<div  class="form-group">
				<label for="role">部门</label>
				<select name="role_group" id="role_group" style="width: 120px;" onchange="changeDep(this);">
					<option value="-1">请选择</option>
					<c:choose>
						<c:when test="${not empty department }">
							<c:forEach items="${department }" var="item" varStatus="vs">
								<option value="${item.role_group }">${item.role_groupname }</option>
							</c:forEach>
						</c:when>
					</c:choose>
				</select>
			</div>
			
			<div  class="form-group">
				<label for="user">人员</label>
				<select name="username" id="username" style="width: 120px;">
					<option value="1">于国良</option>
					<option value="1">刘娜</option>
					<option value="1">周玉娇</option>
					<option value="1">刘迪</option>
				</select>
			</div>
			
			<button type="submit" class="btn btn-primary btn-xs" ><span class="glyphicon glyphicon-search"></span>查询</button>
		</form>
		
		<div id='calendar'></div>
	</div>
		
	
			<div class="modal fade" data-backdrop="false" id="msgDialog" style="z-index: 999;">
				<div class="modal-dialog" >
					<div class="modal-content">
						<div class="modal-header">
							<span style="font-size: 12px;"><strong>打卡信息</strong></span>
						</div>
						<div class="modal-body">
							<textarea id="msgContent" rows="3" class="form-control">
							
							</textarea>
						</div>
						<div class="modal-footer">
							<button class="btn btn-default" data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
			</div>

			
	<script type="text/javascript">
		var basePath = "<%=basePath %>";
		var bodyHeight = window.screen.height-290;
		var today = '${today}';
		var titleYMD = '${today}';
		var username = '${usname}'
	</script>		
    <script src="<%=basePath %>bootstrap-3.3.5-dist/js/jquery-1.11.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type="text/javascript" src="<%=basePath %>bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>calendar/js/simplecalendar.js?v5"></script>
	<script src="<%=basePath %>js/jedate/jedate.js"></script>
    <script type="text/javascript" src="<%=basePath %>fullcalendar/moment.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>fullcalendar/fullcalendar.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>fullcalendar/zh-cn.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/ckin.js"></script>
    <script src="<%=basePath %>js/creatJedate.js"></script>
    <script type="text/javascript">
    	+function ($){
    		
    		initFullCalendar(bodyHeight,today,username);
    		
    		creatJeDate("#defaultDay",false,'YYYY-MM-DD');
    		
    	}(jQuery);
    </script>
</body>
</html>
