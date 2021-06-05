<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

//获取项目路径（项目名称）
String path = request.getContextPath();
//获取项目路径（项目名称）

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>明日科技</title>
    <!-- Bootstrap -->
    <link href="<%=basePath %>bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath %>css/layout.css?v=4" rel="stylesheet">
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body >

	<div style="height: 100px;background-color: #4d5e70; width: 100%;line-height: 165px;">
			<p style="font-size: 30px;color: #fff; padding-left: 60px;">Office automation for MR Co. Ltd </p>
	</div>

	<div class="container-fluid">
	
			<div id="warp">
				<div id="leftMeun" class="leftMeun" >
					
					<div id="personInfor">
						<p id="userName">${loginEntity.wxname }</p>
						<p>${loginEntity.email }</p>
						<p><a href="<%=basePath%>login/logout">退出登录</a></p>
					</div>
					
					<div style="height: 1px;background-color: #fff;"></div>
					
					<ul class="nav nav-pills nav-stacked">
						<li role="role1" >
						<a href="<%=basePath %>mainContent" target="content">首页</a>
						</li>
					
						<li role="role1" >
						<a role="button" data-toggle="collapse" href="#collapse_rcrw" 
						aria-expanded="false" aria-controls="collapse_rcrw">任务核查</a>
						</li>
						<li>
							<div class="collapse" id="collapse_rcrw">
								<ul style="font-size: 12px; padding-left: 15px;" 
								class="nav nav-pills nav-stacked bg-info">
									<li>
									<a href="<%=basePath %>planGoToday" target="content">
									今日任务核查
									</a>
									</li>
								</ul>
							</div>
						</li>
						
						<li role="role2" >
							<a role="button" data-toggle="collapse" href="#collapse_sqsp" 
							aria-expanded="false" aria-controls="collapse_sqsp">
							申请审批
							</a>
						</li>
						<li>
							<div class="collapse" id="collapse_sqsp">
								<ul style="font-size: 12px; padding-left: 15px;" 
								class="nav nav-pills nav-stacked bg-info">
									<li>
									<a href="javascript:alert('待完善')">病/事假申请</a>
									</li>
									<li>
									<a href="javascript:alert('待完善')">外出申请</a>
									</li>
									<li>
									<a href="javascript:alert('待完善')">采购申请</a>
									</li>
									<li>
									<a href="javascript:alert('待完善')">加班申请</a>
									</li>
								</ul>
							</div>
						</li>
						
						<li role="role1" >
							<a role="button" data-toggle="collapse" href="#collapse_zh" 
							aria-expanded="false" aria-controls="collapse_zh">
							综合
							</a>
						</li>
						<li>
							<div class="collapse" id="collapse_zh">
								<ul style="font-size: 12px; padding-left: 15px;" class="nav nav-pills nav-stacked bg-info">
									<li><a href="<%=basePath %>goCkin" target="content">考勤记录</a></li>
									
									<li><a href="javascript:alert('待完善')">公司通讯录</a></li>
									
									<li><a href="javascript:alert('待完善')">公司计划</a></li>
									
									<li><a href="javascript:alert('待完善')">公司近况概要</a></li>
								</ul>
							</div>
						</li>
						
						<li role="role1" ><a href="<%=basePath%>login/logout">退出</a></li>
					</ul>
					
					<div style="height: 1px;background-color: #fff;"></div>
					
				</div>
				<div id="rightContent">
					
				</div>
				
			</div>
	</div>
	
    <script src="<%=basePath %>bootstrap-3.3.5-dist/js/jquery-1.11.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type="text/javascript" src="<%=basePath %>bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript">
	    +function ($) {
	    	$(function (){
	    		var bodyHeight = window.screen.height-180;
	    		var bodyWidth = window.screen.width-220;
	    		var iframeHtml = "<iframe id=\"content\" name=\"content\" width=\""+bodyWidth+"\" height=\""+bodyHeight+"\" style=\"border: 0px;\" src=\"<%=basePath %>mainContent\" ></iframe>";
				$("#rightContent").html(iframeHtml);
	    	})
	    	
	    }(jQuery);
    </script>
    
</body>
</html>
