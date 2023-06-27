package xyz.itwill.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

//웹프로그램 작성에 필요한 기능을 제공하기 위한 클래스
public class Utility {
	//문자열을 전달받아 암호화 처리하여 변화하는 메소드
	public static String encrypt(String source) {
		String encryptPasswd=""; //암호화 처리된 비밀번호를 저장하기
		try {
			//MessageDigest.getInstance(String algorithm) : 매개변수로 전달받은 암호화 알고리즘이 저장된
			//	MessageDigest 객체를 생성하여 반환하는 메소드
			// => MessageDigest 객체 : 암호화 처리 기능을 제공하기 위한 객체
			// => 매개변수에 잘못된 암호화 알고리즘을 전달할 경우
			//단방향 암호화 알고리즘(복호화 불가능) : MD5(지금은 사용하면 안됨), SHA-1(얘도 비권장). SHA-256, SHA-512 등 
			//양방향 암호화 알고리즘(복호화 가능) : AES-123, RSA 등
			MessageDigest messageDigest=MessageDigest.getInstance("SHA-256");
					//싱글톤이라 new 객체 생성 못함
			
			//messageDigest.update(Byte[] input) : MessageDigest 객체에 암호화 처리하기 위한 문자열을
			//	byte 배열로 전달받아 저장하기 위한 메소드
			//String.getbytes() : String 객체에 저장된 문자열을 원시데이터(byte 배열)로 변환하는 메소드
			messageDigest.update(encryptPasswd.getBytes());		
			
			//MessageDigest.digest() : MessageDigest 객체에 저장된 암호화 알고리즘을 사용하여 
			// byte 배열에 저장된 값을 암호화 처리하여 byte 배열로 반환하는 메소드 
			byte[] digest=messageDigest.digest();
			
			//암호화 처리된 byte 배열을 String 객체의 문자열로 변환하여 저장
			for(int i=0;i<digest.length; i++) {
				//Integer.toHexString(int i) : 매개변수로 전달받은 정수값을 16진수의 문자열로 반환하는 메소드
				encryptPasswd+=Integer.toHexString(digest[i&0xff]);				
			}
		} catch (NoSuchAlgorithmException e) { //try를 사용한 이유가 catch로 NoSuchAlgorithmException을 잡아야하기 때문
			System.out.println("[에러] 잘못된 암호화 알고리즘을 사용하였습니다.");
		}
		return encryptPasswd;
	}

}
