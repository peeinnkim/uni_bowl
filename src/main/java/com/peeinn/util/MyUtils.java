package com.peeinn.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

public class MyUtils {
	
	/* String to Date */
	public static Date parseStringToDate(String strDate) throws ParseException {
		if (strDate == null || strDate.isEmpty()) {
			throw new ParseException("Empty string", 0);
		}

		StringBuilder sdfSb = new StringBuilder("yyyy-MM-dd");

		if (strDate.length() < 19) { // "yyyy-MM-dd HH:mm:ss".length == 19
			throw new ParseException("Time is needed.", 11);
		}

		if (strDate.charAt(10) == 'T') {
			sdfSb.append("'T'HH:mm:ss");
		} else if (strDate.charAt(10) == ' ') {
			sdfSb.append(" HH:mm:ss");
		} else {
			throw new ParseException("Wrong separator", 10);
		}

		int timezoneIndex;
		// .SSS는 있을 수도 있고 없을 수도 있음, 없는 경우에는 19번째부터 timezone이고
		// 있는 경우는 23번째부터 timezone
		if (strDate.substring(19).length() >= 4

				&& Pattern.matches("[.]\\d{3}", strDate.substring(19, 23))) {

			sdfSb.append(".SSS");
			timezoneIndex = 23;
		} else {
			timezoneIndex = 19;
		}

		// Timezone을 요약해보면 Z, +09, +0900은 X로, +09:00은 XXX로, KST는 Z로
		String timezone = strDate.substring(timezoneIndex);
		if (timezone.equals("")) {
			;
		} else if (timezone.equals("Z")) {
			sdfSb.append("X");
		} else if (Pattern.matches("[+|-]\\d{2}", timezone)) {
			sdfSb.append("X");
		} else if (Pattern.matches("[+|-]\\d{4}", timezone)) {
			sdfSb.append("X");
		} else if (Pattern.matches("[+|-]\\d{2}[:]\\d{2}", timezone)) {
			sdfSb.append("XXX");
		} else if (Pattern.matches("[A-Z]{3}", timezone)) {
			sdfSb.append("Z");
		} else {
			throw new ParseException("Wrong timezone", timezoneIndex);
		}

		SimpleDateFormat sdf = new SimpleDateFormat(sdfSb.toString());

		return sdf.parse(strDate);
		
	}//parseStringToDate
	
	/* 비밀번호 암호화 */
	public static String encryptSHA256(String str) {
		String sha;

		try {
			MessageDigest sh = MessageDigest.getInstance("SHA-256");
			sh.update(str.getBytes());
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}

			sha = sb.toString();

		} catch (NoSuchAlgorithmException e) {
			System.out.println("Encrypt Error - NoSuchAlgorithmException");
			sha = null;
		}

		return sha;
	}//encryptSHA256(암호화)
	
	/* 임시비밀번호 만들기 */
	public static String makeRandomPw (int length) {  
		int index = 0;  
		char[] charSet = new char[] {  
			'0','1','2','3','4','5','6','7','8','9'  
			,'A','B','C','D','E','F','G','H','I','J','K','L','M'  
			,'N','O','P','Q','R','S','T','U','V','W','X','Y','Z'  
			,'a','b','c','d','e','f','g','h','i','j','k','l','m'  
			,'n','o','p','q','r','s','t','u','v','w','x','y','z'
		};  
			          
		StringBuffer sb = new StringBuffer();  
		for (int i=0; i<length; i++) {  
			index =  (int) (charSet.length * Math.random());  
			sb.append(charSet[index]);  
		}  
		return sb.toString();  
	}  
	      


	

}// DateUtils
