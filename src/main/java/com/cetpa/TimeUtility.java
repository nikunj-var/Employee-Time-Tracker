package com.cetpa;

import java.time.LocalTime;

public class TimeUtility {
	public static String getCurrentTime() {
		LocalTime lt = LocalTime.now();
		String time =lt.getHour()+":"+lt.getMinute()+":"+lt.getSecond();
		return time;
	}
	
	private static int getTimeInSeconds(String time) {
		String[] x = time.split(":");
		int total = Integer.parseInt(x[0])*3600 + Integer.parseInt(x[1])*60 + Integer.parseInt(x[2]);
		
		return total;
		
	}
	
	public static String getTotalTime(String intime,String outtime) {
		
		int intime_sec = getTimeInSeconds(intime);
		int outtime_sec = getTimeInSeconds(outtime);
		int totalsec = intime_sec-outtime_sec;
		int hr = totalsec/3600;
		int sec = totalsec % 3660;
		int min = sec/60;
		sec=sec%60;
		String total = hr+"hr,"+min+"min,"+sec+"sec";
		
		return total;
	}
}

