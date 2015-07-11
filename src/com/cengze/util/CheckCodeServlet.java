package com.cengze.util;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CheckCodeServlet")
public class CheckCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.禁止缓存图片
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "No-cache");
		response.setDateHeader("Expires", 0);
		
		response.setContentType("image/jpeg");
		//2.绘制图片
	    BufferedImage bufferImage = new BufferedImage(80, 20 , BufferedImage.TYPE_INT_RGB);
	    Graphics graphic = bufferImage.getGraphics();
	    graphic.setColor(Color.black);
	    graphic.drawRect(0, 0, 80, 20);
	    graphic.setColor(Color.red);
	    graphic.fillRect(0, 0, 80, 20) ;
	    Random random = new Random();
	    for(int i=0 ;i<100; i++){
	    	int x = random.nextInt(50);
	    	int y = random.nextInt(50);
	    	int x2 = random.nextInt(50);
	    	int y2 = random.nextInt(50);
	    	graphic.setColor(Color.gray);
	    	graphic.drawLine(x, y,x+x2,y+y2);
	    }
		//3.生成验证码
	    StringBuffer sb = new StringBuffer();
	    String s = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	    for(int i=0; i<4; i++) {
	    	char c = s.charAt(random.nextInt(s.length()));
	    	sb.append(c);
	    }
	    String str = String.valueOf(sb);
	    graphic.setColor(Color.getHSBColor(2.3f, 4.5f, 18f));
	    graphic.setFont(new Font("黑体",30,30));
	    graphic.drawString(str, 5, 20);
	    request.getSession().setAttribute("code", str);
	    ServletOutputStream sos = response.getOutputStream();
	    ImageIO.write(bufferImage, "jpeg", sos);
	    sos.close();
	}

}
