package com.addressbook.utils;

import java.util.Date;

public class CommonUtils {
	//获取当前的毫秒值作为添加联系人的id
	public static String getTimeForId(){
		long time = new Date().getTime();
		return time+"";
	}
}
