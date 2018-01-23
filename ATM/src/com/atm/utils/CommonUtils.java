package com.atm.utils;

import java.util.Date;
import java.util.UUID;

public class CommonUtils {
	
	//用时间毫秒值作为ID
	public static String getTimeForId(){
		long time = new Date().getTime();
		return time+"";
	}
	
	//获取UUID作为ID
	public static String getUUID(){
		return UUID.randomUUID().toString();
	}
	
}
