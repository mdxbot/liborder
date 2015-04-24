package com.lexiecn.callname.dao;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.lexiecn.callname.po.Attendance;
import com.xxdw.platform.common.KeyValue;

public class AttendanceDao implements FilenameFilter {

	private static final int FIXED_COLUMN_NUM = 4;
	private static final String EXT_NAME = ".csv";
	private static String sRollDir = null;
	private static List<KeyValue<Integer, String>> sListClasses = null;
	private static AttendanceDao userDao = null;
	private AttendanceDao() {}
	
	public static AttendanceDao getInstance() {
		if(userDao == null) {
			userDao = new AttendanceDao();
		}
		return userDao;
	}
	
	public static void setRollDir(String strRollDir) {
		sRollDir = strRollDir;
		sListClasses = new ArrayList<KeyValue<Integer, String>>();
		try {
			File rollDir = new File(sRollDir);
			File[] files = rollDir.listFiles(getInstance());
			for (int i = 0, j = 0; i < files.length; i++) {
				if (files[i].isFile()) {
					String name = files[i].getName().substring(0, files[i].getName().length() - EXT_NAME.length());
					sListClasses.add(new KeyValue<Integer, String>(j++, name));
				}
			}
		} catch (NullPointerException e) {
		}
	}

	//-----------------------------------------------------------
	public int getClassesNum() {
		return sListClasses == null ? 0 : sListClasses.size();
	}
	
	public List<KeyValue<Integer, String>> getAllClasses() {
		return sListClasses;
	}

	public List<Attendance> findAllByClassId(int id) {
		if (sListClasses == null) return null;
		List<Attendance> list = new ArrayList<Attendance>();
		
		String filename = sListClasses.get(id).getValue();
		FileInputStream fis = null;
		InputStreamReader isr = null;
		BufferedReader reader = null;
		
		try {
			File f = new File(sRollDir + "\\" + filename + EXT_NAME);
			String encoding = learnEncoding(f);
			fis = new FileInputStream(f);
			isr = new InputStreamReader(fis, encoding);
			reader = new BufferedReader(isr);
			
			String line = reader.readLine();
			Attendance atte = new Attendance();
			if (! parseHeader(line, atte)) return list;
			list.add(atte);
			
			int itemNum = FIXED_COLUMN_NUM + atte.getMarksNum();
			line = reader.readLine();
			while (line != null) {
				String[] items = line.split(",");
				if (itemNum < FIXED_COLUMN_NUM || (items.length != itemNum && items.length != itemNum - 1)) {
					System.out.println("invalid csv file: " + filename);
					break;
				}
				
				atte = new Attendance();
				atte.setSequence(items[0]);
				atte.setStatus(items[1]);
				atte.setId(items[2]);
				atte.setName(items[3]);
				
				String[] marks = new String[itemNum - FIXED_COLUMN_NUM];
				if (items.length > FIXED_COLUMN_NUM) {
					System.arraycopy(items, FIXED_COLUMN_NUM, marks, 0, items.length - FIXED_COLUMN_NUM);
				}
				if (itemNum > items.length) {
					marks[itemNum - FIXED_COLUMN_NUM - 1] = "0";
				}
				
				atte.setMarks(marks);
				list.add(atte);
				
				line = reader.readLine();
			};
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (reader != null) reader.close();
				if (isr != null) isr.close();
				if (fis != null) fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	public boolean saveAllByClassId(int id, List<Attendance> list) {
		String filename = sListClasses.get(id).getValue();
		FileOutputStream fos = null;
		OutputStreamWriter osr = null;
		PrintWriter writer = null;
		
		try {
			File f = new File(sRollDir + "\\" + filename + EXT_NAME);
			fos = new FileOutputStream(f);
			osr = new OutputStreamWriter( fos, "GBK");
			writer = new PrintWriter(osr);
			
			for(Attendance atte : list) {
				String line = atte.getSequence() + "," + atte.getStatus() + "," + atte.getId() + "," + atte.getName();
				for(String mark : atte.getMarks()) {
					line += "," + mark;
				}
				writer.println(line);
			}			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (writer != null) writer.close();
				if (osr != null) osr.close();
				if (fos != null) fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return true;
	}

	@Override
	public boolean accept(File dir, String name) {
		name = name.toLowerCase();
		return name.endsWith(EXT_NAME);
	}
	
	//-------------------------------------------------------
	private boolean parseHeader(String line, Attendance atte) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		String today = sdf.format(new java.util.Date());
		
		String[] items = line.split(",");
		boolean bColumnAdded = false;
		int itemNum = items.length; 
		if (itemNum < FIXED_COLUMN_NUM) return false;
		if (itemNum == FIXED_COLUMN_NUM) {
			bColumnAdded = true;
		}
		else {
			int i;
			for (i = FIXED_COLUMN_NUM; i < itemNum; i++) {
				if (items[i].equals(today)) {
					break;
				}
			}
			if (i == itemNum) {
				bColumnAdded = true;
			}
		}
		
		atte.setSequence(items[0]);
		atte.setStatus(items[1]);
		atte.setId(items[2]);
		atte.setName(items[3]);
		if (itemNum >= FIXED_COLUMN_NUM) {
			int markItemNum = itemNum - FIXED_COLUMN_NUM;
			if (bColumnAdded) markItemNum++;
			
			String[] marks = new String[markItemNum];
			if (itemNum > FIXED_COLUMN_NUM) {
				System.arraycopy(items, FIXED_COLUMN_NUM, marks, 0, itemNum - FIXED_COLUMN_NUM);
			}
			if (bColumnAdded) {
				marks[markItemNum - 1] = today;
			}
			atte.setMarks(marks);
		}
		
		return true;
	}
	
	// 识别文件编码,没有BOM表示GBK
	// BOM是“Byte Order Mark”的缩写, FEFF表明Big-Endian, FFFE表明Little-Endian。
	// UTF-8不需要BOM来表明字节顺序，但可以用BOM来表明编码方式。BOM的UTF-8编码是: EF BB BF
	public static String learnEncoding(File f) {
		
		String encode = "GBK";
		FileInputStream fis = null;
		try{
			byte[] head = new byte[3];
			
			fis = new FileInputStream(f);
			fis.read(head);
			if(head[0]==-17 && head[1]==-69 && head[2] ==-65)
				encode = "UTF-8";
			else if (head[0] == -1 && head[1] == -2 )
				encode = "UTF-16";
			else if (head[0] == -2 && head[1] == -1 )
				encode = "UNICODE";
		} catch (IOException e) {
			if (fis != null)
				try {
					fis.close();
				} catch (IOException e1) {}
		}
		
		return encode;
	}
}
