package com.bbagym.common.encrypt;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;


public class AESEncrypt {

	//양방향 암호화 객체 AES방식(대칭키)
	//메소드를 이용해서 암호화 복호화를 할 수 있도록 만들자!
	//key 암호화 / 복호화 key
	//SecretKey객체(대칭키) 키를 보관하는 객체
	
	private static SecretKey key;
	private static String path;
	
	public AESEncrypt(String path) {
		
		this.path = path;
		//secretKey.bs파일이 있으면 파일의 내용을 불러와서 key저장
		//없으면 생성
		
		File f = new File(path+"/secretkey.bbagym");
		if(f.exists()) {
			//파일을 읽어오기 Object파일 읽어오기
			//ObjectInputStream
			try(ObjectInputStream ois = new ObjectInputStream(new FileInputStream(f));){
				System.out.println("키로드성공");
				key = (SecretKey)ois.readObject();
				
				
				
			}catch(IOException e) {
				e.printStackTrace();
			}catch(ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			
		}else {
			getGeneric();//키를 새로 생성하는 메소드
		}
		
		
		
		
	}
	
	private void getGeneric() {
		//1. salt값을 생성
		SecureRandom salt =new SecureRandom();
		//2.SecureKey를 생성하는 객체를 만듬 KeyGenerator
		KeyGenerator kegen;
		try {
		kegen = KeyGenerator.getInstance("AES");
		kegen.init(128,salt);
		key=kegen.generateKey();
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		//1.파일저장위치선택 - 객체가 생성 될 때(서버가 실행될때) 받아서 처리
		//2.저장위치에 SecretKey객체 파일로 저장 - 
		
		File f = new File(path+"/secretkey.bbagym");
		//outputStram -> 객체를 저장 ObjectOutputStream
		
		try(ObjectOutputStream oss = new ObjectOutputStream(new FileOutputStream(f));){
			//생성된 key값 secretkey.bs파일에 저장
			oss.writeObject(key);
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	//AES 암호화 메소드
	
	public static String encrypt(String target) {
		//cipher객체를 이용해서 암호화를 진행
		try {
			
			Cipher cipher=Cipher.getInstance("AES");
			cipher.init(Cipher.ENCRYPT_MODE, key );
			byte[] oriStr=target.getBytes();
			byte[] encStr=cipher.doFinal(oriStr);
			
			return Base64.getEncoder().encodeToString(encStr);
			
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}catch(NoSuchPaddingException e) {
			e.printStackTrace();
		}catch(InvalidKeyException e) {
			e.printStackTrace();
		}catch(BadPaddingException e) {
			e.printStackTrace();
		}catch(IllegalBlockSizeException e) {
			e.printStackTrace();
		}
		

		return target;
		
		
	}
	
	
	//AES 복호화 메소드
	
	
	public static String decrypt(String target) throws UnsupportedEncodingException {
		
		byte[] decryptStr=null;
		
		try {
			Cipher cipher = Cipher.getInstance("AES");
			cipher.init(Cipher.DECRYPT_MODE, key);
			byte[] decodeStr=Base64.getDecoder().decode(target.getBytes());
			decryptStr = cipher.doFinal(decodeStr);
			
			
		}catch(Exception e) {
//			e.printStackTrace();
			return target;
		}
		
		return new String(decryptStr,"utf-8");
		
	}
	
	
	
	
}
