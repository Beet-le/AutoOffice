function creatJeDate (parmId,isTime,format){
	/*var format = 'YYYY-MM-DD hh:mm:ss';
	if (!isTime){
		format = 'YYYY-MM-DD';
	}*/
	
	jeDate({
		dateCell:parmId,
		format:format,
		isinitVal:true,
		isTime:isTime, //isClear:false,
		minDate:"2000-01-01",
		okfun:function(val){}
	})
};