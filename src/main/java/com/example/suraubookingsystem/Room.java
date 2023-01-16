package com.example.suraubookingsystem;
import java.io.Serializable;

public class Room implements Serializable{

	public int roomid;
    public String roomname;
    public int roomcapacity;
    public String roomstatus;
    public String roomsoundsystem;
    public int tablequantity;
    public int chairquantity;

    //default
    public Room() {

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
