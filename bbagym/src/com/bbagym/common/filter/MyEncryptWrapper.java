package com.bbagym.common.filter;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class MyEncryptWrapper extends HttpServletRequestWrapper {

	public MyEncryptWrapper(HttpServletRequest request) {
		super(request);
		// TODO Auto-generated constructor stub
	}

	
	@Override
	public String getParameter(String name) {
		String value="";
		//name값이 password에 관련된 사항이면 암호화처리
		//아니면 원본값 반환
		if(name!=null && (name.equals("") || name.equals(""))) {
//			System.out.println("암호화 전 " + super.getParameter(name));
			value=getSha512(super.getParameter(name));
//			System.out.println("암호화 후 " + value);
		}else {
			value = super.getParameter(name);
		}
	
		
		return value;
		
	}
	
	private String getSha512(String name) {
		//암호화 처리할 수 있는 객체를 생성
		MessageDigest md =null;
		try {
			md=MessageDigest.getInstance("SHA-512");
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		byte[] bytes=name.getBytes(Charset.forName("utf-8"));
		md.update(bytes);//byte로 암호화됨.
		//암호화된 byte값을 base64인코더를 이용해서 String형으로 변환
		return Base64.getEncoder().encodeToString(md.digest());
		
	}
	
	
}
