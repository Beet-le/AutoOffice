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
		<div id="di1hang">
			<div style="border: 1px solid #000;height: 300px;width: 70%;
			float:left;min-width: 750px;" >
				<!--  任务申报面板  -->
			</div>
			<div  style="border: 1px solid #000;height: 300px;width:29%;float:right;" >
				<!--  考勤面板  -->
			</div>
		</div>
		<div style="padding-top: 15px;clear:both;" id="di2hang">
			<div class="panel panel-default" 
			style="border: 1px solid #000;height: 500px;width:70%;float: left;">
				<!--  备忘录展示面板  -->
			</div>
			<div class="calendar hidden-print" 
			style="border: 1px solid #000;height: 500px;width: 29%;float: right;">
	          	<!--  备忘录日历  -->
	        </div>
		</div>
	
		<div class="modal fade" data-backdrop="false" id="rwDialog" style="z-index: 0;">
				<div class="modal-dialog" >
					<div class="modal-content">
						<div class="modal-header">
							<span style="font-size: 12px;"><strong>工作计划申报</strong></span>
						</div>
						<div class="modal-body">
							<form action="<%=basePath%>savePlanWork" method="post" id="savePlanWork">
								<div class="form-group">
									<label for="plan_title">
										To:
									</label>
									<select class="form-control" name="plan_to">
										<c:choose>
											<c:when test="${not empty bmzgs }">
												<c:forEach items="${bmzgs }" var="itema" varStatus="vs">
													<option value="${itema.username }">${itema.wxname }</option>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<option >无部门主管</option>
											</c:otherwise>
										</c:choose>
									</select>
								</div>
								<div class="form-group">
									<label>计划优先级</label>
<div>
	<a href="javascript:void(0)" onclick="starYxj(1);">
	<span id="starYxj1" class="glyphicon glyphicon-star"></span>
	</a>
	<a href="javascript:void(0)" onclick="starYxj(2);">
	<span id="starYxj2" class="glyphicon glyphicon-star-empty"></span>
	</a>
	<a href="javascript:void(0)" onclick="starYxj(3);">
	<span id="starYxj3" class="glyphicon glyphicon-star-empty"></span>
	</a>
	<a href="javascript:void(0)" onclick="starYxj(4);">
	<span id="starYxj4" class="glyphicon glyphicon-star-empty"></span>
	</a>
	<a href="javascript:void(0)" onclick="starYxj(5);">
	<span id="starYxj5" class="glyphicon glyphicon-star-empty"></span>
	</a>
</div>
<input readonly="readonly" type="hidden" name="plan_yxj" id="plan_yxj" value="1">

								</div>
								<div class="form-group">
									<label>计划复杂度</label>
									<div>
										<a href="javascript:void(0)" onclick="starFzd(1);"><span id="starFzd1" class="glyphicon glyphicon-star"></span></a>
										<a href="javascript:void(0)" onclick="starFzd(2);"><span id="starFzd2" class="glyphicon glyphicon-star-empty"></span></a>
										<a href="javascript:void(0)" onclick="starFzd(3);"><span id="starFzd3" class="glyphicon glyphicon-star-empty"></span></a>
										<a href="javascript:void(0)" onclick="starFzd(4);"><span id="starFzd4" class="glyphicon glyphicon-star-empty"></span></a>
										<a href="javascript:void(0)" onclick="starFzd(5);"><span id="starFzd5" class="glyphicon glyphicon-star-empty"></span></a>
									</div>
									<input readonly="readonly" type="hidden" name="plan_fzd" id="plan_fzd" value="1">
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
									<input type="text" class="form-control" placeholder="最多输入80个字符" id="plan_title" name="plan_title">
								</div>
								
								<div class="form-group">
									<label for="plan_content">
										内容
									</label>
									<textarea rows="3" class="form-control" name="plan_content" id="plan_content" ></textarea>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button class="btn btn-default" data-dismiss="modal">关闭</button>
							<button class="btn btn-primary" onclick="formSubmit('#savePlanWork')">确定</button>
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
			
			<div class="modal fade" data-backdrop="false" id="bwlDialog" style="z-index: 0;">
				<div class="modal-dialog" >
					<div class="modal-content">
						<div class="modal-header">
							<span style="font-size: 12px;"><strong>备忘录</strong></span>
						</div>
						<div class="modal-body">
							<form action="<%=basePath%>saveMemorandum" method="post" id="saveMemorandum">
								<input id="memo_year" name="memo_year" type="hidden" />
								<input id="memo_month" name="memo_month" type="hidden" />
								<input id="memo_day" name="memo_day" type="hidden" />
								<input id="memo_id" name="memo_id" type="hidden" />
								<div class="form-group">
									<label>心情指数</label>
									<div>
										<a href="javascript:void(0)" onclick="starXqzs(1);"><span id="starXqzs1" class="glyphicon glyphicon-heart"></span></a>
										<a href="javascript:void(0)" onclick="starXqzs(2);"><span id="starXqzs2" class="glyphicon glyphicon-heart-empty"></span></a>
										<a href="javascript:void(0)" onclick="starXqzs(3);"><span id="starXqzs3" class="glyphicon glyphicon-heart-empty"></span></a>
										<a href="javascript:void(0)" onclick="starXqzs(4);"><span id="starXqzs4" class="glyphicon glyphicon-heart-empty"></span></a>
										<a href="javascript:void(0)" onclick="starXqzs(5);"><span id="starXqzs5" class="glyphicon glyphicon-heart-empty"></span></a>
									</div>
									<input readonly="readonly" type="hidden" name="memo_xqzs" id="memo_xqzs" value="1">
								</div>
								
								<div class="form-group">
									<label>压力指数</label>
									<div>
										<a href="javascript:void(0)" onclick="starYlzs(1);"><span id="starYlzs1" class="glyphicon glyphicon-heart"></span></a>
										<a href="javascript:void(0)" onclick="starYlzs(2);"><span id="starYlzs2" class="glyphicon glyphicon-heart-empty"></span></a>
										<a href="javascript:void(0)" onclick="starYlzs(3);"><span id="starYlzs3" class="glyphicon glyphicon-heart-empty"></span></a>
										<a href="javascript:void(0)" onclick="starYlzs(4);"><span id="starYlzs4" class="glyphicon glyphicon-heart-empty"></span></a>
										<a href="javascript:void(0)" onclick="starYlzs(5);"><span id="starYlzs5" class="glyphicon glyphicon-heart-empty"></span></a>
									</div>
									<input readonly="readonly" type="hidden" name="memo_ylzs" id="memo_ylzs" value="1">
								</div>
								
								<div class="form-group">
									<label for="memo_title">
										标题
									</label>
									<input type="text" class="form-control" placeholder="最多输入80个字符" id="memo_title" name="memo_title">
								</div>
								
								<div class="form-group">
									<label for="memo_content">
										内容
									</label>
									<textarea rows="3" class="form-control" name="memo_content" id="memo_content" ></textarea>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button class="btn btn-default" data-dismiss="modal">关闭</button>
							<button class="btn btn-primary" onclick="formSubmit('#saveMemorandum')">确定</button>
						</div>
					</div>
				</div>
			</div>
			
			<div class="modal fade" data-backdrop="false" id="ckinDialog" style="z-index: 0;">
				<div class="modal-dialog" >
					<div class="modal-content">
						<div class="modal-header">
							<span style="font-size: 12px;"><strong>详细信息</strong></span>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<input id="ckin_id" name="ckin_id" type="hidden" value="">
								<label for="ckin_content">
									内容
								</label>
								<textarea rows="3" class="form-control" name="ckin_content" id="ckin_content" ></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-default" data-dismiss="modal">关闭</button>
							<button class="btn btn-primary" onclick="ckinToday()">确定</button>
						</div>
					</div>
				</div>
			</div>
	<script type="text/javascript">
		var basePath = "<%=basePath %>";
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
    		creatJeDate("#plan_start",true,'YYYY-MM-DD hh:mm:ss');
    		creatJeDate("#plan_end",true,'YYYY-MM-DD hh:mm:ss');
    		getJsonData();
    		showTime ();
    		onLoadCkin();
    	}(jQuery);
    </script>
</body>
</html>
