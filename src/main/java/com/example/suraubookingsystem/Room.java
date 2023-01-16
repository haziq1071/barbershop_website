package com.example.suraubookingsystem;
import java.io.Serializable;
public class Room implements Serializable{

	private int roomid;
    private String roomname;
    private int roomcapacity;
    private String roomstatus;
    private String roomsoundsystem;
    private int tablequantity;
    private int chairquantity;

    //default
    public Room() {

    }
/*
    public Room(int roomid, String roomname, int roomcapacity,
            String roomstatus, String roomsoundsystem, int tablequantity, int chairquantity){
        
        this.roomid = roomid;
        this.roomname = roomname;
        this.roomcapacity = roomcapacity;
        this.roomstatus = roomstatus;
        this.roomsoundsystem = roomsoundsystem;
        this.tablequantity = tablequantity;
        this.chairquantity = chairquantity;
    }*/
    //
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

    public String getRoomsoundsystem() {
        return roomsoundsystem;
    }

    public void setRoomsoundsystem(String roomsoundsystem) {
        this.roomsoundsystem = roomsoundsystem;
    }
    public int getTablequantity() {
        return tablequantity;
    }

    public void setTablequantity(int tablequantity) {
        this.tablequantity = tablequantity;
    }

    public int getChairquantity() {
        return chairquantity;
    }

    public void setChairquantity(int chairquantity) {
        this.chairquantity = chairquantity;
    }


}
