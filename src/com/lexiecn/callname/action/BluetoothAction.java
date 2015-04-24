package com.lexiecn.callname.action;
import java.util.ArrayList;
import java.util.List;

import com.lexiecn.callname.bean.LoginForm;
import com.lexiecn.callname.po.Attendance;
import com.lexiecn.callname.po.User;
import com.lexiecn.callname.service.AttendanceService;
import com.xxdw.platform.common.KeyValue;
import com.xxdw.platform.common.Pojo;
import com.xxdw.platform.controller.Action2;

public class BluetoothAction extends Action2 {
    private static final String TOP 	= "top";
    private static final String LEFT 	= "left";
    private static final String MAIN 	= "main";
    
	private LoginForm		formBean;
	
	public void setFormBean(LoginForm formBean) {
		this.formBean = formBean;
	}
	public LoginForm getFormBean() {
		return formBean;
	}
	    
	public String top() {
		request.setAttribute("user", this.getUser());
		return TOP;
	}
	
	public String left() {
		List<KeyValue<Integer, String>> list = new ArrayList<KeyValue<Integer, String>>();
		list.add(new KeyValue<Integer, String>(1, "植被数据列表与计算"));
		list.add(new KeyValue<Integer, String>(2, "植被数据综合查询"));
		list.add(new KeyValue<Integer, String>(3, "植被数据分析"));
		list.add(new KeyValue<Integer, String>(4, "植被数据统计与报表"));
		request.setAttribute("listClasses", list);
		//request.setAttribute("mapClasses", KeyValue.toMap(list));
		return LEFT;
	}
	
	public String main() {
		List<Bluetooth> list = new ArrayList<Bluetooth>();
		
		list.add(new Bluetooth("ID", "序号", "地域", "园区", "植被图片", "经度", "纬度", "俯仰角"));
		list.add(new Bluetooth("1", "1", "南靖", "南瓜园", "uploads/vege1.png", "117.221837", "24.504122", "-50.8"));
		list.add(new Bluetooth("2", "2", "南靖", "南瓜园", "uploads/vege2.png", "117.221815", "24.504021", "-45.8"));
		list.add(new Bluetooth("3", "3", "南靖", "南瓜园", "uploads/vege3.png", "117.221798", "24.503997", "-46.3"));
		list.add(new Bluetooth("4", "4", "南靖", "南瓜园", "uploads/vege4.png", "117.221923", "24.504092", "-44.9"));
		list.add(new Bluetooth("5", "5", "杏林", "葡萄园", "uploads/vege5.png", "117.998405", "24.558977", "65.8"));
		list.add(new Bluetooth("6", "6", "杏林", "葡萄园", "uploads/vege6.png", "117.998385", "24.558066", "60.6"));
		
		request.setAttribute("listBluetooth", list);		
		return MAIN;
	}
	
	public static class Bluetooth extends Pojo {
		private String sequence;
		private String id; 	    
		private String site;
	    private String name;
	    private String url;
	    private String longitude;
	    private String latitude;
	    private String pitchAngle;
	    public Bluetooth() {}
	    public Bluetooth(String id,String sequence,String site,String name,String url,
	    		String longitude,String latitude,String pitchAngle) {
	    	this.id = id; 	    
	    	this.sequence = sequence;
	    	this.site = site;
	    	this.name = name;
	    	this.url = url;
	    	this.longitude = longitude;
	    	this.latitude = latitude;
	    	this.pitchAngle = pitchAngle;
	    }
	    public String getSequence() {
			return sequence;
		}
		public void setSequence(String sequence) {
			this.sequence = sequence;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getSite() {
			return site;
		}
		public void setSite(String site) {
			this.site = site;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getUrl() {
			return url;
		}
		public void setUrl(String url) {
			this.url = url;
		}
		public String getLongitude() {
			return longitude;
		}
		public void setLongitude(String longitude) {
			this.longitude = longitude;
		}
		public String getLatitude() {
			return latitude;
		}
		public void setLatitude(String latitude) {
			this.latitude = latitude;
		}
		public String getPitchAngle() {
			return pitchAngle;
		}
		public void setPitchAngle(String pitchAngle) {
			this.pitchAngle = pitchAngle;
		}
	}
}
