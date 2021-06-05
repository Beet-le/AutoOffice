
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


function changeDep (parm){
	var role_group = $(parm).val();
	if (role_group != '-1'){
		$.ajax({
			type:"GET",
			url:basePath+"getUser?role_group="+role_group,
			dataType:"json",
			success:function (data){
				$("#username").empty();
				if (data.length>0){
					for (var i =0;i<data.length;i++){
						$("#username").append("<option value='"+data[i].username+"'>"+data[i].wxname+"</option>");
					}
				}else{
					$("#username").append("<option value='-1'>暂无数据</option>");
				}
			}
		})
	}
}