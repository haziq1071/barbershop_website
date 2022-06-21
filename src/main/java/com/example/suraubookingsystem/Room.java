package com.example.suraubookingsystem;

import javax.servlet.http.Part;

public class Room implements java.io.Serializable{
	private int roomid;
	private String roomname;
	private int roomcapacity;
	private String roomstatus;
	private String soundsystem;

	public Room() {
		// TODO Auto-generated constructor stub
	}

	public Room(int roomid, String roomname, int roomcapacity, String roomstatus, String soundsystem) {
		super();
		this.roomid = roomid;
		this.roomname = roomname;
		this.roomcapacity = roomcapacity;
		this.roomstatus = roomstatus;
		this.soundsystem = soundsystem;
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
