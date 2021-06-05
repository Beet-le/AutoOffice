package com.mrkj.ygl.standard;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component("standardUtil")
public class Util {

	/**
	 * 
	 * @param page
	 * @param rwo
	 * @return
	 * 
	 * 
	 */
		public static String page (int page,int lastPage){
		StringBuffer sb = new StringBuffer("<nav style=\"text-align: center;\">"
				+ "<ul class=\"pagination pagination-lg\">\n");
		if (page == 1){
			sb.append("<li class=\"disabled\">"
					+ "<a href=\"javascript:void(0)\" aria-label=\"Previous\">"
					+ "<span aria-hidden=\"true\">&laquo;"
					+ "</span>"
					+ "</a>"
					+ "</li>\n");
		}else{
			sb.append("<li >"
					+ "<a href=\"?page="+(page-1)+"\" aria-label=\"Previous\">"
					+ "<span aria-hidden=\"true\">&laquo;"
					+ "</span>"
					+ "</a>"
					+ "</li>\n");
		}
		if ((lastPage-page+1) >=5){
			for (int i = page ; i < page+5;i++){
				if (i==page){//如果是第一页那么会有一个class样式
					sb.append("<li class=\"active\">"
							+ "<a href=\"?page="+i+"\">"+i+"</a>"
									+ "</li>\n");
				}else
				sb.append("<li >"
						+ "<a href=\"?page="+i+"\">"+i+"</a>"
								+ "</li>\n");
			}
		}else if(lastPage-4 > 0){
			for (int i = lastPage-4 ; i <= lastPage;i++){
				
				if (i==page){//如果是第一页那么会有一个class样式
					sb.append("<li class=\"active\">"
							+ "<a href=\"?page="+i+"\">"+i+"</a>"
									+ "</li>\n");
				}else
				sb.append("<li >"
						+ "<a href=\"?page="+i+"\">"+i+"</a>"
								+ "</li>\n");
			}
		}else{
			for (int i = 1 ; i <= lastPage;i++){
				
				if (i==page){//如果是第一页那么会有一个class样式
					sb.append("<li class=\"active\">"
							+ "<a href=\"?page="+i+"\">"+i+"</a>"
									+ "</li>\n");
				}else
				sb.append("<li >"
						+ "<a href=\"?page="+i+"\">"+i+"</a>"
								+ "</li>\n");
			}
		}
		if (page != lastPage){
			sb.append("<li >"
					+ "<a href=\"?page="+(page+1)+"\" aria-label=\"Next\">"
							+ "<span aria-hidden=\"true\">&raquo;</span>"
							+ "</a>"
							+ "</li>"
							+ "</ul>"
							+ "</nav>\n");
		}else{
			sb.append("<li class=\"disabled\">"
					+ "<a href=\"javascript:void(0)\" aria-label=\"Next\">"
					+ "<span aria-hidden=\"true\">&raquo;</span>"
					+ "</a>"
					+ "</li>"
					+ "</ul>"
					+ "</nav>\n");
		}
		
		return sb.toString();
	}
	
	/**
	 * 获取一个月的第一天与最后一天	
	 */
	public static Map<String,String> getDays (Date day){
		Map<String,String> result = new HashMap<String, String>();
		Calendar c = Calendar.getInstance();
		c.setTime(day);
		int month = c.get(c.MONTH)+1;
		String months = "";
		if (month<10){
			months = "0"+month;
		}else{
			months = ""+month;
		}
		switch (month) {
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			result.put("starDay",c.get(c.YEAR)+"-"+months+"-0"+1 );
			result.put("endDay",c.get(c.YEAR)+"-"+months+"-"+31 );
			break;
		case 4:
		case 6:
		case 9:
		case 11:
			result.put("starDay",c.get(c.YEAR)+"-"+months+"-0"+1 );
			result.put("endDay",c.get(c.YEAR)+"-"+months+"-"+30 );
			break;
		case 2:	
			int year = c.get(c.YEAR);
			result.put("starDay",c.get(c.YEAR)+"-"+month+"-0"+1 );
			if ((year%4==0&&year%100!=0)||(year%400==0)){
				result.put("endDay",c.get(c.YEAR)+"-"+months+"-"+29 );
			}else{
				result.put("endDay",c.get(c.YEAR)+"-"+months+"-"+28 );
			}
			break;
		default:
			break;
		}
		
		return result;
	}
}
