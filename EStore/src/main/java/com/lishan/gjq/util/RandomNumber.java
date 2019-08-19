package com.lishan.gjq.util;

import java.util.Random;

public class RandomNumber {
	public String randomNum() {
		String s = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		Random r = new Random();
		String result = null;
		for (int i =0; i < 6; i++ ){
			int n = r.nextInt(3);
		result += s.substring(n, 1);
		
		}
		return result;
	}
	
}
