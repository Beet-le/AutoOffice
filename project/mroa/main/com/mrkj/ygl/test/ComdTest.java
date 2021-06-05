package com.mrkj.ygl.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import org.junit.Test;

public class ComdTest {

	@Test
	public void test() {
		String s ="<div>   <p style='color:red'>sssssssssssss</p>    </div>";
	}

	@Test
	public void testDate () throws ParseException{
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date d = sdf.parse("2016-7-1");
		Calendar c = Calendar.getInstance();
		c.setTime(d);
		System.out.println(c.get(c.MONTH));
		
	}
	
	@Test
	public void testDates () throws ParseException{
		
		String s = "aabbccddaabbccdd";
		
		System.out.println(s.replace("aa", "--"));
		System.out.println(s.replaceAll("aa", "--"));
		
	}
}
