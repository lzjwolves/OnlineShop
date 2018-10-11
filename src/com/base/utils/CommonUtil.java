package com.base.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;



public class CommonUtil {
	public static boolean isEmpty(String str) {
		if (str == null || str.equals(""))
			return true;
		return false;
	}
	/**
	 * 订单规则： 8位时间戳+8位随机数
	 * @return
	 */
public static String generateOderId(){
	Long timestamp =System.currentTimeMillis();
	String timestampStr =timestamp.toString();
	Integer d =(int)(Math.random()*1e8);
	String randomStr =d.toString();
	
	return timestampStr+randomStr;
	
}
public static void main(String ag[]){
	Date dNow = new Date();   //当前时间  
    Date dBefore = new Date();  
    Calendar calendar = Calendar.getInstance(); //得到日历  
    calendar.setTime(dNow);//把当前时间赋给日历  
    calendar.add(Calendar.MONTH, -3);  //设置为前3月  
    dBefore = calendar.getTime();   //得到前3月的时间  
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //设置时间格式  
    String defaultStartDate = sdf.format(dBefore);    //格式化前3月的时间  
    String defaultEndDate = sdf.format(dNow); //格式化当前时间  
    System.out.println("三个月之前时间======="+defaultStartDate);  
    System.out.println("当前时间==========="+defaultEndDate); 
}
}
