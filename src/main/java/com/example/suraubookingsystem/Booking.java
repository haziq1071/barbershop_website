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
    //public int approveid;
    /*
    public int spaceid;
    public int roomid;
    public int staffid;
    public int applicantid;*/

    public Booking() {

    }
//public Booking(int bookingid, Date bookingdate, String bookingstatus, Date eventdate, String eventtime, String eventdescription, int approveid) {
    public Booking(int bookingid, Date bookingdate, String bookingstatus, Date eventdate, String eventtime, String eventdescription) {
        this.bookingid = bookingid;
        this.bookingdate = bookingdate;
        this.bookingstatus = bookingstatus;
        this.eventdate = eventdate;
        this.eventtime = eventtime;
        this.eventdescription = eventdescription;
        //this.approveid = approveid;
        
    }

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
    /*
    public int getApproveid() {
        return approveid;
    }
    public void setApproveid(int approveid) {
        this.approveid = approveid;
    }*/
    /*
    public int getServiceid() {
        return serviceid;
    }
    public void setServiceid(int spaceid) {
        this.serviceid = serviceid;
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
