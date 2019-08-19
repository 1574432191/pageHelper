package com.lishan.gjq.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {
	  public static final int MAX_AGE = 60 * 60 * 24 * 7;  
	  
	    /** 
	     * 添加COOKIE 
	     * @param response 
	     * @param key 
	     * @param value 
	     * @throws UnsupportedEncodingException 
	     */  
	    public static void addCookie(HttpServletResponse response, String key,  
	            String value) throws UnsupportedEncodingException {  
	        value = URLEncoder.encode(value, "utf-8");  
	        Cookie cookie = new Cookie(key, value);  
	        cookie.setMaxAge(MAX_AGE);  
	        cookie.setPath("/");  
	        response.addCookie(cookie);  
	    }  
	  
	    /** 
	     * 删除COOKIE 
	     * @param response 
	     * @param key 
	     */  
	    public static void deleteCookie(HttpServletResponse response, String key) {  
	        Cookie cookie = new Cookie(key, "");  
	        cookie.setMaxAge(0);  
	        cookie.setPath("/");  
	        response.addCookie(cookie);  
	    }  
	  
	    /** 
	     * 查找COOKIE 
	     * @param request 
	     * @param key 
	     * @return  String 
	     * @throws UnsupportedEncodingException 
	     */  
	    public static String findCookie(HttpServletRequest request, String key)  
	            throws UnsupportedEncodingException {     
	        Cookie[] cookies = request.getCookies();  
	        if (cookies != null) {  
	            for (int i = 0; i < cookies.length; i++) {  
	                if (key.equals(cookies[i].getName())) {  
	                    return URLDecoder.decode(cookies[i].getValue(), "utf-8");  
	                }  
	            }  
	        }  
	        return null;  
	    }  
}
