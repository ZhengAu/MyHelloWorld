package com.demo.utils;

import java.util.Date;

public class CommonUtils {
	public static String getTimeForId(){
		long time = new Date().getTime();
		return time+"";
	}
}
