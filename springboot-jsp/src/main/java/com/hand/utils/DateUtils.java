package com.hand.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
	public static Date getNowDate(Date date){
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyy-mm-dd hh:mm:ss");
		String timeString = simpleDateFormat.format(date);
	
		try{
			date = simpleDateFormat.parse(timeString);
		}catch(ParseException e){
			e.printStackTrace();
		}
		return date;
	}


}
