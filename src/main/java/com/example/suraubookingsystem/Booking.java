package com.example.suraubookingsystem;
import java.io.Serializable;
import java.sql.Date;

public class Booking implements Serializable{
    public int bookingid;
    public Date bookingdate;
    public String bookingstatus;
    public Date eventdate;
    public String eventtime;
    public String eventdescription;
    public String eventspace;/*
    public int spaceid;
    public int roomid;
    public int staffid;
    public int applicantid;*/

    public Booking() {

    }
    /*
    public Booking(int bookingid, String bookingdescription, Date bookingdate, String bookingtime, String bookingstatus, Date eventdate, int spaceid, int roomid, int staffid, int applicantid) {
        this.bookingid = bookingid;
        this.bookingdescription = bookingdescription;
        this.bookingdate = bookingdate;
        this.bookingtime = bookingtime;
        this.bookingstatus = bookingstatus;
        this.eventdate = eventdate;
        this.spaceid = spaceid;
        this.roomid = roomid;
        this.staffid = staffid;
        this.applicantid = applicantid;

    }*/

    public int getBookingid() {
        return bookingid;
    }
    public void setBookingid(int bookingid) {
        this.bookingid = bookingid;
    }
    public Date getBookingdate() {
        return bookingdate;
    }
    public void setBookingdate(Date bookingdate) {
        this.bookingdate = bookingdate;
    }
    public String getBookingstatus() {
        return bookingstatus;
    }
    public void setBookingstatus(String bookingstatus) {
        this.bookingstatus = bookingstatus;
    }
    public Date getEventdate() {
        return eventdate;
    }
    public void setEventdate(Date eventdate) {
        this.eventdate = eventdate;
    }
    public String getEventtime() {
        return eventtime;
    }
    public void setEventtime(String eventtime) {
        this.eventtime = eventtime;
    }
    public String getEventdescription() {
        return eventdescription;
    }
    public void setEventdescription(String eventdescription) {
        this.eventdescription = eventdescription;
    }
    public String getEventspace() {
        return eventspace;
    }
    public void setEventspace(String eventspace) {
        this.eventspace = eventspace;
    }/*
    public int getSpaceid() {
        return spaceid;
    }
    public void setSpaceid(int spaceid) {
        this.spaceid = spaceid;
    }
    public int getRoomid() {
        return roomid;
    }
    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }
    public int getStaffid() {
        return staffid;
    }
    public void setStaffid(int staffid) {
        this.staffid = staffid;
    }
    public int getApplicantid() {
        return applicantid;
    }
    public void setApplicantid(int applicantid) {
        this.applicantid = applicantid;
    }*/

}
