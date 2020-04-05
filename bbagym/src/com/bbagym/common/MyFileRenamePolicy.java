package com.bbagym.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy{
	@Override
	public File rename(File oldFile) {
		
		File newFile = null;
		
		do {
			long currentTime = System.currentTimeMillis();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddssSSS");
			int rnd = (int)(Math.random()*1000); 
			
			String oldName = oldFile.getName();	
			String ext = "";	
			int dot = oldName.lastIndexOf(".");	
			ext = oldName.substring(dot);
			String fileName = sdf.format(new Date(currentTime)) + "_" + rnd + ext;	
			
			newFile = new File(oldFile.getParent(), fileName);
			
		} while(!createNewFile(newFile));
		
		return newFile;
	}

	private boolean createNewFile(File f) {
		try {
			return f.createNewFile();
		}catch(IOException e) {
			return false; 
		}
		
	}
}
