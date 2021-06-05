function creatRw (){
	
	$("#rwDialog").modal();
	
};

//星星优先级设置
function starYxj (parmNum){
	
	setStar(parmNum,"#starYxj","star");
	
	$("#plan_yxj").val(parmNum);
};

//复杂度
function starFzd(parmNum){
	
	setStar(parmNum,"#starFzd","star");
	
	$("#plan_fzd").val(parmNum);
};

function starXqzs(parmNum){
	setStar(parmNum,"#starXqzs","heart");
	
	$("#memo_xqzs").val(parmNum);
}

function starYlzs(parmNum){
	setStar(parmNum,"#starYlzs","heart");
	
	$("#memo_ylzs").val(parmNum);
}

//设置 参数一次为,当前选中值/选中ID/形状
function setStar(parmNum,id,shape){
	
	for (var i=1;i<=5;i++){
		$(id+i).removeClass("glyphicon-"+shape);
		$(id+i).addClass("glyphicon-"+shape+"-empty");
	}
	
	for (var i=1;i<=parmNum;i++){
		$(id+i).removeClass("glyphicon-"+shape+"-empty");
		$(id+i).addClass("glyphicon-"+shape);
	}
	
}

//表单提交
function formSubmit(parmId){
	
	$(parmId).submit();
	
}

//显示详细信息
function showMessage (parmId){
	
	var content = $("#"+parmId).text();
	$("#msgContent").html(content);
	$("#msgDialog").modal();
}

//翻页
function goPage (flag){
	
	if (flag === 'qian'){
		var current = $("#currentPage").text();
		//alert (current);
		if (current!=='1'){
			$.ajax({
				type:"GET",
				url:basePath+"getContent?page="+(Number(current)-1),
				dataType:"json",
				success:function (data){
					if (data.success){
						innerContentBody(data);
					}else{
						
					}
				}
			})
		}else{
			alert("已经是第一页了.")
		}
	}else {
		var current = $("#currentPage").text();
		if(lastPage!==Number(current)){
			$.ajax({
				type:"GET",
				url:basePath+"getContent?page="+(Number(current)+1),
				dataType:"json",
				success:function (data){
					if (data.success){
						innerContentBody(data)
					}else{
						
					}
				}
			})
		}else{
			alert("已经是最后一页了.")
		}
	}	
}

//翻页
function goPageHC (flag){
	
	if (flag === 'qian'){
		var current = $("#currentPage").text();
		//alert (current);
		if (current!=='1'){
			$.ajax({
				type:"GET",
				url:basePath+"planGoAll?page="+(Number(current)-1),
				dataType:"json",
				success:function (data){
					if (data.success){
						innerContentBody(data);
					}else{
						
					}
				}
			})
		}else{
			alert("已经是第一页了.")
		}
	}else {
		var current = $("#currentPage").text();
		if(lastPage!==Number(current)){
			$.ajax({
				type:"GET",
				url:basePath+"planGoAll?page="+(Number(current)+1),
				dataType:"json",
				success:function (data){
					if (data.success){
						innerContentBody(data)
					}else{
						
					}
				}
			})
		}else{
			alert("已经是最后一页了.")
		}
	}	
}

//ajax返回的数据插入表格内部
function innerContentBody (data){
	$("#contentBody").empty();
	var html = "";
	var planwork = data.data;
	for (var i=0;i<planwork.length;i++){
		html +="<tr><td>"
			 + planwork[i].plan_title
			 + "</td><td>"
		     + planwork[i].plan_creatime
		     + "</td>"
		if (planwork[i].plan_flag === '1'){
			html += "<td>待核查</td>"
		}else{
			html += "<td>"
				 + planwork[i].plan_updatetime
				 + "</td>"
		}
		
		if (planwork[i].plan_flag === '1'){
			html += "<td>待核查</td>";
		}else{
			html +="<td>"
				 + planwork[i].plan_update
				 + "</td>"
		}
		
		html +="<td><a href=\"javascript:void(0)\" onclick=\"showMessage('"+planwork[i].plan_id+"')\"><span class=\"glyphicon glyphicon-th\"></span></a>";
		html +="<textarea style=\"display: none;\" id=\""+planwork[i].plan_id+"\">"+planwork[i].plan_content+"</textarea></td>"
		html +="</tr>";
	}
	$("#contentBody").html(html);
	$("#currentPage").html(data.page);
}

function showHC (plan_id){
	
	$.ajax({
		type:"GET",
		url:basePath+"planByid?plan_id="+plan_id,
		dataType:"json",
		async:false,
		success:function (data){
			console.log(data.plan_yxj+data.plan_fzd);
			setStar(data.plan_yxj,"#starYxj","star");
			setStar(data.plan_fzd,"#starFzd","star");
			$("#plan_start").val(data.plan_start);
			$("#plan_end").val(data.plan_end);
			$("#plan_title").val(data.plan_title);
			$("#plan_content").val(data.plan_content);
			$("#plan_id").val(data.plan_id);
		}
	})
	
	$("#rwDialog").modal();
	
};

//日历时间
function myEvent(parm){
	var year = $(parm).attr('date-year');
	var month = $(parm).attr('date-month');
	var day = $(parm).attr('date-day');
	var ids = $("#"+year+month+day).attr('data-id');
	if (typeof(ids) != 'undefined'){
		var xqzs = $("#"+year+month+day).attr('data-xqzs');
		var ylzs = $("#"+year+month+day).attr('data-ylzs');
		
		
		//设置星星
		starXqzs(xqzs);
		starYlzs(ylzs);
		
		//获取title content
		var h2Text = $("#"+year+month+day).find("h2").text();
	//	var pText = $("#"+year+month+day).find("div").text();
		var pText = $("#"+year+month+day+" div").contents();
		var tempHtml = "";
		for (var i=0;i<pText.length;i++ ){
			var tempDOM = pText[i];
			
			if (tempDOM.nodeType == 1){
				
				/*if (tempDOM.tagName == "H1" || tempDOM.tagName == "H2" || tempDOM.tagName == "H3" || tempDOM.tagName == "H4" || tempDOM.tagName == "H5" || tempDOM.tagName == "H6"){
					tempHtml += "<"+tempDOM.tagName+">"
							  + tempDOM.textContent
					          + "</"+tempDOM.tagName+">"
					          + "\r\n";
				}*/
				
				if (tempDOM.tagName == "P"){
					tempHtml += "<p style='color:"+tempDOM.style.color+"' >"
					          + tempDOM.textContent
					          + "</p>"
				}
				
				if (tempDOM.tagName == "BR"){
					tempHtml += "<br />"
				}
			}else if (tempDOM.nodeType == '3'){
				tempHtml += tempDOM.textContent;
			}
		}
		
		$("#memo_id").val(ids);
		$("#memo_title").val(h2Text);
		$("#memo_content").val(tempHtml);
		$("#memo_year").val(year);
		$("#memo_month").val(month);
		$("#memo_day").val(day);
	}else{
		starXqzs(1);
		starYlzs(1);
		$("#memo_id").val('');
		$("#memo_title").val('');
		$("#memo_content").val('');
		$("#memo_year").val(year);
		$("#memo_month").val(month);
		$("#memo_day").val(day);
	}
	$("#bwlDialog").modal();
}

//ajax 请求日历所有时间
function getJsonData(){
	//findAllMemorandum
	$.ajax({
		type:"GET",
		url:basePath+"findAllMemorandum",
		dataType:"json",
		async:false,
		success:function (data){
			calendar.init(data);
		}
	})
}

//时间补位
function checkTime (i){
	if(i<10){
		i = "0"+i;
		return i;
	}else{
		return i;
	}
}

//显示时间
function showTime (){
	var date = new Date();
	var h = date.getHours();
	var m = date.getMinutes();
	var s = date.getSeconds();
	
	h = checkTime(h);
	m = checkTime(m);
	s = checkTime(s);
	
	$("#sstime").html(h+":"+m+":"+s);
	setTimeout('showTime()',500);
}

//打卡对话框
function ckinOpen (){
	
	$("#ckinDialog").modal();
}

function onLoadCkin(){
	$.ajax({
		type:"GET",
		url:basePath+"findCkin",
		dataType:"json",
		async:false,
		success:function (data){
			if (!data.isEmpty){
				$("#ckin_id").val(data.ckin_id);
				$("#ckin_content").val(data.ckin_content);
				var times = data.ckin_times;
				var splitTimes = times.split(",");
				//alert("上次打卡时间:"+splitTimes[splitTimes.length-1]+" 今日已经打卡:"+splitTimes.length+"次");
				var strP = "";
				if (splitTimes.length > 4){
					strP = "<p>"+splitTimes[0]+"</p><p>"+splitTimes[1]+"</p><p>"+splitTimes[splitTimes.length-2]+"</p><p>"+splitTimes[splitTimes.length-1]+"</p>";
				}else{
					for (var i =0;i<splitTimes.length;i++){
						strP += "<p>"+splitTimes[i]+"</p>";
					}
				}
				
				$("#ckinP").html(strP);
			}else{
				alert("今日尚未打卡~~");
			}
		}
	})
}

//打卡事件
function ckinToday(){
	
	var ckin_content = $("#ckin_content").val();
	var ckin_id = $("#ckin_id").val();
	var parm = {"ckin_content":ckin_content,"ckin_id":ckin_id}

	$.ajax({
		type:"POST",
		url:basePath+"ckin",
		dataType:"json",
		async:false,
		data:parm,
		success:function (data){
			if (data.success){
				alert("打卡成功!"+data.msg);
				$("#ckinP").append(data.msg);
			}else{
				alert("打卡失败!"+data.msg);
			}
		}
	})
}
