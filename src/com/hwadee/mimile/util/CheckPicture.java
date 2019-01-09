package com.hwadee.mimile.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;

import org.apache.struts2.ServletActionContext;

import com.hwadee.mimile.pojo.User;

public class CheckPicture {
		
	public User user=new User();
		private int width = 100;
		private int height = 40;
		private int num = 4;
		private String passwd = "abcdefghijklmnopqrstuvwxyz23456789";
		
		private Color getRandomColor(int i , int j){
			if (i>j) {
				int temp = i;
				i = j;
				j = temp;
			}
			if (j>225) {
				j = 225;
			}
			if (i<0) {
				i = 0;
			}
			int r = i + (int)(Math.random()*(j-i));
			int g = i + (int)(Math.random()*(j-i));
			int b = i + (int)(Math.random()*(j-i));
			
			return new Color(r, g, b);
		}
		
		
		
		private void drawString(Graphics graphics,int width,int height,String randStr){
			Random random = new Random();
			
			int degree = random.nextInt(60);
			
			if (degree>30) {
				degree = 30-degree;
			}
			graphics.setColor(getRandomColor(0, 50));
			Graphics2D g2 = (Graphics2D)graphics.create();
			g2.translate(width+random.nextInt(5), height+random.nextInt(5));
			g2.rotate(degree*Math.PI/180);
			g2.drawString(randStr, 0, 0);
		}
		
		
		
		private void drawLine(Graphics graphics,int count){
			Random random = new Random();
			
			for(int j=0;j<count;j++){
				graphics.setColor(getRandomColor(180, 200));
				
				int x1=(int) (Math.random()*width);
				int y1 = (int) (Math.random()*height);
				int x2 = (int) (Math.random()*width);
				int y2 =( int) (Math.random()*height);
				
				graphics.drawLine(x1, y1, x2, y2);
			}
		}
		
			

			
		
		
		
		public void getImage() throws IOException{
			
			BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
			Graphics graphics = image.getGraphics();
			graphics.setColor(getRandomColor(200,255));
			graphics.fillRect(0, 0, width, height);
			
			graphics.setColor(Color.BLUE);
			graphics.drawRect(0, 0, width-1, height-1);
			
			int len = passwd.length();
			graphics.setFont(new Font("楷体", Font.HANGING_BASELINE, 20));
			
			Random random = new Random();
			 
			String check = "";
			
			for(int i=0;i<num;i++){
				String randStr = String.valueOf(passwd.charAt(random.nextInt(len)));
				check+=randStr;
				int width = this.width/this.num;
				int x = width*i;
				int y = this.height/2 + random.nextInt(this.height/3);
				drawString(graphics, x, y, randStr);
			}
			
			drawLine(graphics, 10);
			graphics.dispose();
			
			
			
			ServletActionContext.getRequest().getSession().setAttribute("check", check);
			System.out.println("checkpicture.java.getImage图片中的 值为："+check);
			ImageIO.write(image, "JPG", ServletActionContext.getResponse().getOutputStream());
		}
		public String verification()
		{
			String verification=ServletActionContext.getRequest().getParameter("verification");
			String check=ServletActionContext.getRequest().getSession().getAttribute("check").toString();
			System.out.println("checkpicture.java.verification后台得到用户输入的值为:"+verification);
			
			String phoneID=ServletActionContext.getRequest().getParameter("phoneID");
			String password=ServletActionContext.getRequest().getParameter("password");
			ServletActionContext.getRequest().getSession().setAttribute("phoneID", phoneID);
			ServletActionContext.getRequest().getSession().setAttribute("password", password);
			System.out.println(phoneID);
			System.out.println(password);
			if(check.equals(verification))
			{
				ServletActionContext.getRequest().getSession().setAttribute("ltx", "true");
				return "true";
			}
			else {
				ServletActionContext.getRequest().getSession().setAttribute("ltx", "false");
				return "false";
			}
		}
			
			public String loginCheck()
			{
				
				String verification=ServletActionContext.getRequest().getParameter("verification");
				String check=ServletActionContext.getRequest().getSession().getAttribute("check").toString();
				System.out.println("checkpicture.java.verification后台得到用户输入的值为:"+verification);
				
				if(check.equals(verification))
				{
					System.out.println("true");
					ServletActionContext.getRequest().getSession().setAttribute("lll", "true");
					return "true";
				}
				else {
					System.out.println("false");
					ServletActionContext.getRequest().getSession().setAttribute("lll", "false");
					return "false";
				}
	}
		
			

	}

	

