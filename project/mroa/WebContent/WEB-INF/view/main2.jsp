<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"
+request.getServerName()+":"+request.getServerPort()+path+"/";
String socketPath = request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>明日科技</title>
    <link href="<%=basePath %>bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- 结构布局css样式 -->
    <link href="<%=basePath %>css/layout.css?v=4" rel="stylesheet">
</head>
<body >

	<div style="height: 100px;background-color: #4d5e70; width: 100%;line-height: 165px;">
			<!-- 顶部文字展示 -->
			<p style="font-size: 30px;color: #fff; padding-left: 60px;">
			Office automation for MR Co. Ltd </p>
	</div>

	<div class="container-fluid">
			<div id="warp">
				<div id="leftMeun" class="leftMeun" >
					<!-- 导航区 -->
				</div>
				<div id="rightContent">
					<!-- 工作区 -->
				</div>
			</div>
	</div>
	
    <script src="<%=basePath %>bootstrap-3.3.5-dist/js/jquery-1.11.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type="text/javascript" 
    src="<%=basePath %>bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
	    +function ($) {
	    	$(function (){
	    		var bodyHeight = window.screen.height-180;
	    		var bodyWidth = window.screen.width-220;
	    		var iframeHtml = "<iframe id=\"content\" name=\"content\" width=\""
	    		+bodyWidth+"\" height=\""+bodyHeight+"\" style=\"border: 0px;\" "
	    		+"src=\"<%=basePath %>mainContent\" ></iframe>";
				$("#rightContent").html(iframeHtml);
	    	})
	    	
	    }(jQuery);
    </script>
    
</body>
</html>
