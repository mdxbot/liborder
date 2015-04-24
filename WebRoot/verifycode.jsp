<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.awt.*" %>
<%@ page import="java.awt.image.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.imageio.*"%>
<%
  response.setHeader("pragma","no-cache");
  response.setHeader("cache-control","no-cache");
  response.setHeader("expires","0");
  
  // 在内存中创建图象 
  int width=52, height=18; 
  BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB); 

  // 获取图形上下文 
  Graphics g = image.getGraphics(); 

  // 设定背景色 
  g.setColor(new Color(0xDCDCEC)); 
  g.fillRect(0, 0, width, height); 

  //画边框 
  g.setColor(Color.black); 
  g.drawRect(0,0,width-1,height-1); 

  // 取随机产生的认证码(4位数字) 
  String chose="0123456789";
  char ran[]={'0','0','0','0'};
  Random rand=new Random();
  for(int i=0;i<4;i++){
    ran[i]=chose.charAt(rand.nextInt(chose.length()));
  }
  String randstr=String.valueOf(ran);
  // 将认证码存入SESSION 
  session.setAttribute("verifycode",randstr);

  // 将认证码显示到图象中 
  try{
	  g.setColor(Color.black); 
	  String numberStr = randstr; 
	
	  g.setFont(new Font("Atlantic Inline",Font.PLAIN,18)); 
	  String Str = numberStr.substring(0,1); 
	  g.drawString(Str,4,17); 
	
	  Str = numberStr.substring(1,2); 
	  g.drawString(Str,15,15); 
	  Str = numberStr.substring(2,3); 
	  g.drawString(Str,26,17); 
	
	  Str = numberStr.substring(3,4); 
	  g.drawString(Str,37,15); 
  }
  catch(Exception e){}
  
  // 随机产生88个干扰点，使图象中的认证码不易被其它程序探测到 
  Random random = new Random(); 
  for (int i=0;i<20;i++) { 
    int x = random.nextInt(width); 
    int y = random.nextInt(height); 
    g.drawOval(x,y,0,0); 
  } 
  // 图象生效 
  g.dispose(); 
  // 输出图象到页面 
  ImageIO.write(image, "JPEG", response.getOutputStream()); 
  out.clear();
  out = pageContext.pushBody();
%>