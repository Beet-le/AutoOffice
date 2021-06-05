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
	<style type="text/css">

	</style>
</head>
<body style="background-color: #f1f1f1">

		<div style="border: 1px solid #000;height: 300px;width: 100%;float:left;min-width: 750px;" class="">
			<h4 class="text-center">待核查内容</h4>
			<table class="table table-bordered" style="min-width: 750px;">
				<tr>
					<th>
					<a href="javascript:void(0)" onclick="goPageHC('qian');"><span class="glyphicon glyphicon-chevron-left"></span></a>
					第<span id="currentPage">1</span>页
					<a href="javascript:void(0)" onclick="goPageHC('hou');"><span class="glyphicon glyphicon-chevron-right"></span></a>
					</th>
					<th>申报日期</th>
					<th>核查日期</th>
					<th>申报人</th>
					<th  class="text-right">
						
					</th>
				</tr>			
				<tbody id="contentBody">		
				<c:choose>
					<c:when test="${not empty top7 }">
						<c:forEach items="${top7 }" var="item" varStatus="vs">
							<tr>
								<td>
									${item.plan_title}
								</td>
								<td>
									${item.plan_creatime}
								</td>
								<c:if test="${item.plan_flag eq 1}">
									<td>
										待核查
									</td>
								</c:if>
								<c:if test="${item.plan_flag eq 2}">
									<td>
										${item.plan_updatetime}
									</td>
								</c:if>
								<td>										
									${item.wxname}
								</td>
								<td class="text-center">
									<a href="javascript:void(0)" onclick="showHC('${item.plan_id}')"><span class="glyphicon glyphicon-th"></span></a>
									<textarea style="display: none;" rows="" cols="" id="${item.plan_id}">
										${item.plan_content}
									</textarea>
								</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
				</tbody>
			</table>
		</div>
		
		<div style="border: 1px solid #000;height: 300px;width: 100%;float:left;min-width: 750px;" class="">
			<h4 class="text-center">已核查内容</h4>
			<table class="table table-bordered" style="min-width: 750px;">
				<tr>
					<th>
					<a href="javascript:void(0)" onclick="goPageHC('qian');"><span class="glyphicon glyphicon-chevron-left"></span></a>
					第<span id="currentPage">1</span>页
					<a href="javascript:void(0)" onclick="goPageHC('hou');"><span class="glyphicon glyphicon-chevron-right"></span></a>
					</th>
					<th>申报日期</th>
					<th>核查日期</th>
					<th>申报人</th>
					<th  class="text-right">
						
					</th>
				</tr>			
				<tbody id="contentBody">		
				<c:choose>
					<c:when test="${not empty top7Over }">
						<c:forEach items="${top7Over }" var="item" varStatus="vs">
							<tr>
								<td>
									${item.plan_title}
								</td>
								<td>
									${item.plan_creatime}
								</td>
								<td>
									${item.plan_updatetime}
								</td>
								<td>										
									${item.wxname}
								</td>
								<td class="text-center">
									<a href="javascript:void(0)" onclick="showMessage('${item.plan_id}')"><span class="glyphicon glyphicon-th"></span></a>
									<textarea style="display: none;" rows="" cols="" id="${item.plan_id}">
										${item.plan_content}
									</textarea>
								</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
				</tbody>
			</table>
		</div>
	
			<div class="modal fade" data-backdrop="false" id="rwDialog" style="z-index: 0;">
				<div class="modal-dialog" >
					<div class="modal-content">
						<div class="modal-header">
							<span style="font-size: 12px;"><strong>工作计划申报</strong></span>
						</div>
						<div class="modal-body">
							<form action="<%=basePath%>updatePlanWork" method="post" id="updatePlanWork">
								<input type="hidden" name="plan_id" id="plan_id">
								<div class="form-group">
									<label>计划优先级</label>
									<div>
										<a href="javascript:void(0)" ><span id="starYxj1" class="glyphicon glyphicon-star"></span></a>
										<a href="javascript:void(0)" ><span id="starYxj2" class="glyphicon glyphicon-star-empty"></span></a>
										<a href="javascript:void(0)" ><span id="starYxj3" class="glyphicon glyphicon-star-empty"></span></a>
										<a href="javascript:void(0)" ><span id="starYxj4" class="glyphicon glyphicon-star-empty"></span></a>
										<a href="javascript:void(0)" ><span id="starYxj5" class="glyphicon glyphicon-star-empty"></span></a>
									</div>
								</div>
								<div class="form-group">
									<label>计划复杂度</label>
									<div>
										<a href="javascript:void(0)" ><span id="starFzd1" class="glyphicon glyphicon-star"></span></a>
										<a href="javascript:void(0)" ><span id="starFzd2" class="glyphicon glyphicon-star-empty"></span></a>
										<a href="javascript:void(0)" ><span id="starFzd3" class="glyphicon glyphicon-star-empty"></span></a>
										<a href="javascript:void(0)" ><span id="starFzd4" class="glyphicon glyphicon-star-empty"></span></a>
										<a href="javascript:void(0)" ><span id="starFzd5" class="glyphicon glyphicon-star-empty"></span></a>
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<label >预估工期</label><br/>
										<input type="text" name="plan_start" id="plan_start" style="width: 160px;" readonly="readonly" >
										<span >至</span>
										<input type="text" name="plan_end" id="plan_end" style="width: 160px;" readonly="readonly" >
									</div>
								</div>
								
								<div class="form-group">
									<label for="plan_title">
										标题
									</label>
									<input type="text" class="form-control" placeholder="最多输入80个字符" id="plan_title" name="plan_title" readonly="readonly">
								</div>
								
								<div class="form-group">
									<label for="plan_content">
										内容
									</label>
									<textarea rows="3" class="form-control" name="plan_content" id="plan_content" ></textarea>
								</div>
								
								<div class="radio">
									<label>
										<input type="radio" value="2" name="plan_flag" checked="checked" />
										同意
									</label>
									<label>
										<input type="radio" value="3" name="plan_flag" />
										不同意
									</label>
								</div>
								
							</form>
						</div>
						<div class="modal-footer">
							<button class="btn btn-default" data-dismiss="modal">关闭</button>
							<button class="btn btn-primary" onclick="formSubmit('#updatePlanWork')">确定</button>
						</div>
					</div>
				</div>
			</div>
			
			<div class="modal fade" data-backdrop="false" id="msgDialog" style="z-index: 0;">
				<div class="modal-dialog" >
					<div class="modal-content">
						<div class="modal-header">
							<span style="font-size: 12px;"><strong>详细信息</strong></span>
						</div>
						<div class="modal-body">
							<div id="msgContent">
								
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-default" data-dismiss="modal">关闭</button>
						</div>
					</div>
				</div>
			</div>
			
	<script type="text/javascript">
		var basePath = "<%=basePath %>";
		var count = ${count};
		var row = ${row};
		var lastPage = ${lastPage};
		var countOver = ${countOver};
		var lastPageOver = ${lastPageOver};
	</script>		
    <script src="<%=basePath %>bootstrap-3.3.5-dist/js/jquery-1.11.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type="text/javascript" src="<%=basePath %>bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>calendar/js/simplecalendar.js?v5"></script>
	<script src="<%=basePath %>js/jedate/jedate.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/plan.js?v4"></script>
    <script src="<%=basePath %>js/creatJedate.js"></script>
    <script type="text/javascript">
    	+function ($){
    		
    	}(jQuery);
    </script>
</body>
</html>
