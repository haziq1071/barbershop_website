package com.example.suraubookingsystem;
import java.io.Serializable;
import javax.servlet.http.Part;
//test
public class Room implements Serializable{
	private int roomid;
	private String roomname;
	private int roomcapacity;
	private String roomstatus;
	private String soundsystem;

	public Room() {
		// TODO Auto-generated constructor stub
	}
	public int getRoomid() {
		return roomid;
	}
	public void setRoomid(int roomid) {
		this.roomid = roomid;
	}
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	public int getRoomcapacity() {
		return roomcapacity;
	}
	public void setRoomcapacity(int roomcapacity) {
		this.roomcapacity = roomcapacity;
	}
	public String getRoomstatus() {
		return roomstatus;
	}
	public void setRoomstatus(String roomstatus) {
		this.roomstatus = roomstatus;
	}
	public String getSoundsystem() {
		return soundsystem;
	}
	public void setSoundsystem(String soundsystem) {
		this.soundsystem = soundsystem;
	}
	
	
}
