package com.lishan.gjq.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public  String getDate(){
		Date date = new Date(System.currentTimeMillis());	 
		SimpleDateFormat sdf =
				new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return sdf.format(date);
		
	}
	
	public String getTimeStamp(){
		Date date = new Date(System.currentTimeMillis());	 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		return sdf.format(date);
		
	}
		public static void main(String[] args) {
		
		}
}
