package com.hwadee.mimile.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.hwadee.mimile.pojo.Goods;
import com.hwadee.mimile.service.GoodsService;

public class FileUpload {
	
	public File file;
	private String fileFileName;
	private String fileFileContentType;
	public Goods goods=new Goods();
	
	
    	
	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}


	public String getFileFileName() {
		return fileFileName;
	}


	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}




	public String getFileFileContentType() {
		return fileFileContentType;
	}


	public void setFileFileContentType(String fileFileContentType) {
		this.fileFileContentType = fileFileContentType;
	}
	
	

	
	
	
	public String execute() {
		
		
		GoodsService goodsservice=new GoodsService();
		
		
		/*文件保存父目录*/
		String path = ServletActionContext.getRequest().getRealPath("/");
		
		String completeName = path + "img\\" + fileFileName;
		goods.setGimageurl(fileFileName);
		
		goodsservice.update(goods);
		System.out.println("path = " + path + "completeName = " + completeName);
		try {
			
			
			int byteread = 0;
			int bytesum = 0;
			
			InputStream inStream = new FileInputStream(file);
			FileOutputStream fos = new FileOutputStream(completeName);
			
			byte[] buffer = new byte[1444];
			int length;
			
			while((byteread = inStream.read(buffer))!=-1){
				bytesum += byteread;
				fos.write(buffer, 0, byteread);
			}
			inStream.close();
			
			
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    System.out.println("图片位置"+completeName);
	    System.out.println();
	    
	    
	    
	    return "T";
	}
}
