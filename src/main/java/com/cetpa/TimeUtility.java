package com.cetpa;

import java.time.LocalTime;

public class TimeUtility {
	public static String getCurrentTime() {
		LocalTime lt = LocalTime.now();
		String time =lt.getHour()+":"+lt.getMinute()+":"+lt.getSecond();
		return time;
	}
}
