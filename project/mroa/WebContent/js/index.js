$(document).ready(function(){
    dropdownOpen();//调用
});
/**
 * 鼠标划过就展开子菜单，免得需要点击才能展开
 */
function dropdownOpen() {

    var $dropdownLi = $('li.dropdown');
    var $xlxz = $('#xlxz');
    $dropdownLi.mouseover(function() {
        $(this).addClass('open');
    }).mouseout(function() {
        $(this).removeClass('open');
    });
    
    $xlxz.mouseover(function() {
        $("#ssdiv").addClass('open');
    });
}

function ssxz (parmValue,parmText){
	$("#ssxz").html(parmText);
	$("#sslm").val(parmValue);
}