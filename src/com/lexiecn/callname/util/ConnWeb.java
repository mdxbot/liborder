package com.lexiecn.callname.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.util.Date;
import java.util.concurrent.CountDownLatch;

public final class ConnWeb {
	
	private static final int TASK_NUM 			= 1;
	private static final int REQ_NUM_PER_TASK 	= 2500;
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		//HtmlPage htmlPage = new HtmlPage("localhost", 8080, "/callname/loginlogout_testPerformance.action", "UTF-8");
		//HtmlPage htmlPage = new HtmlPage("localhost", 8080, "/agriculture/loginlogout_testPerformance.action", "UTF-8");
		
		HtmlPage htmlPage = null;
		if (args.length == 1)
			htmlPage = new HtmlPage("localhost", 8080, "/" + args[0] + "/user_testPerformance.action", "UTF-8");
		else if (args.length == 2)
			htmlPage = new HtmlPage(args[0], 8080, "/" + args[1] + "/user_testPerformance.action", "UTF-8");
		else if (args.length == 3)
			htmlPage = new HtmlPage(args[0], Integer.parseInt(args[1]), "/" + args[2] + "/user_testPerformance.action", "UTF-8");
		else {
			System.out.println("parameter number must be 1~3");
			return;
		}
		
		ConnWeb cn = new ConnWeb();
		Date dateBegin = new java.util.Date();
		cn.start(htmlPage);
		Date dateEnd = new java.util.Date();
		long diff = dateEnd.getTime() - dateBegin.getTime();
		System.out.println("Timespan: " + diff);
	}
	
	private void start(HtmlPage htmlPage) {
		System.out.println("Begin test...!");
		CountDownLatch countDownLatch = new CountDownLatch(TASK_NUM) ;
		
		for (int i = 0; i < TASK_NUM; i++) {
			
			Runnable r = this.new Task(i, countDownLatch, htmlPage);
			Thread t = new Thread(r);
			t.start();
		}
		
		try {
			countDownLatch.await();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("All over!");
	}

	public class Task implements Runnable {

		private CountDownLatch countDownLatch ;
		private int which;
		private HtmlPage htmlPage;
		public Task(int which, CountDownLatch countDownLatch, HtmlPage htmlPage) {
			this.which 			= which;
			this.countDownLatch	= countDownLatch;
			this.htmlPage		= htmlPage;
		}
		
		@Override
		public void run() {
			try {
				for(int i = 0; i < REQ_NUM_PER_TASK; i++) {
					//String html = post(new HtmlPage("localhost", 8080, "/callname/loginlogout_testPerformance.action", "UTF-8"));
					//String html = post(new HtmlPage("localhost", 8080, "/agriculture/loginlogout_testPerformance.action", "UTF-8"));
					post(this.htmlPage);
					//System.out.println(html);
				}
				System.out.println("Thread " + this.which + "!");
			} finally {
				this.countDownLatch.countDown();
			}
		}
		
		/**
		 * 采用POST向WEB服务器提交数据，并获取返回页面
		 */
		public String post(HtmlPage hp){
			String para = "password=568998&username=cliff&authcode=abc"; 
			StringBuffer html = new StringBuffer();
			Socket socket = null;
			BufferedWriter writer = null;
			BufferedReader reader = null;
			try {
				// 建立一个Socket
				socket = new Socket(InetAddress.getByName(hp.getServer()), hp.getPort());
								
				StringBuffer command = new StringBuffer()
					.append("POST " + hp.getPath() + " HTTP/1.1\r\n" )	// GET or POST
					.append("Accept: */*\r\n")
					.append("Accept-Language: zh-cn\r\n")
					.append("Accept-Charset: utf-8,GBK\r\n")
					.append("Content-Type: application/x-www-form-urlencoded\r\n")
					.append("User-Agent: Mozilla/4.0\r\n")
					.append("HOST: " + hp.getServer() + (hp.getPort() == 80 ? "" : (":" + hp.getPort())) + "\r\n")
					//.append("Connection: Keep-Alive\r\n")
					.append("Connection: Close\r\n")
					.append("Content-Length: " + para.length() + "\r\n")	// 表单参数长度
					.append("\r\n" + para);									//表单参数内容,如username=cliff&password=123456;
				
				// 发送命令
				writer = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), hp.getCharset()));
				writer.write(command.toString());
				writer.flush();
				// 接收返回的结果
				reader = new BufferedReader(new InputStreamReader(socket.getInputStream(), hp.getCharset()));
				String line;
				while ((line = reader.readLine()) != null) {
					html.append(line).append("/r/n");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (reader != null)
						reader.close();
					if (writer != null)
						writer.close();
					if (socket != null)
						socket.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		
			return html.toString();
		}	
		
		/**
		 * GET方式抓取网页原代码
		 */
		public String get(HtmlPage hp){
			StringBuffer html = new StringBuffer();
			Socket socket = null;
			BufferedWriter writer = null;
			BufferedReader reader = null;
			try {
				// 建立一个Socket
				socket = new Socket(InetAddress.getByName(hp.getServer()), hp.getPort());
								
				StringBuffer command = new StringBuffer()
					.append("GET " + hp.getPath() + " HTTP/1.1\r\n")
					.append("HOST: localhost:8080\r\n")
					.append("Connection: Close\r\n")
					.append("\r\n");
				
				// 发送命令
				writer = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), hp.getCharset()));
				writer.write(command.toString());
				writer.flush();
				// 接收返回的结果
				reader = new BufferedReader(new InputStreamReader(socket.getInputStream(), hp.getCharset()));
				String line;
				while ((line = reader.readLine()) != null) {
					html.append(line).append("/r/n");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (reader != null)
						reader.close();
					if (writer != null)
						writer.close();
					if (socket != null)
						socket.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		
			return html.toString();
		}		

	}

	static class HtmlPage {
		private String server;
		private int port = 80;
		private String path;
		private String charset = "UTF-8";
		public HtmlPage() {
			super();
		}
		public HtmlPage(String server, String path) {
			super();
			this.server = server;
			this.path = path;
		}
		public HtmlPage(String server, String path, String charset) {
			super();
			this.server = server;
			this.path = path;
			this.charset = charset;
		}
		public HtmlPage(String server, int port, String path, String charset) {
			super();
			this.server = server;
			this.port = port;
			this.path = path;
			this.charset = charset;
		}
		public String getServer() {
			return server;
		}
		public void setServer(String server) {
			this.server = server;
		}
		public int getPort() {
			return port;
		}
		public void setPort(int port) {
			this.port = port;
		}
		public String getPath() {
			return path;
		}
		public void setPath(String path) {
			this.path = path;
		}
		public String getCharset() {
			return charset;
		}
		public void setCharset(String charset) {
			this.charset = charset;
		}
	} // HtmlPage
}
