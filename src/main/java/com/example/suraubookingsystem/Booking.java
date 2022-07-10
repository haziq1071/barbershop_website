package com.example.suraubookingsystem;
import java.io.Serializable;
import java.sql.Date;

public class Booking implements Serializable{
    private int bookingid;
    private String bookingdescription;
    private int spaceid;
    private Date eventdate;
    private Date bookingdate;
    private String bookingstatus;
    private int applicantid;
    private int staffid;
    private int approveid;
    public Booking() {
        super();
        // TODO Auto-generated constructor stub
    }
    public int getBookingid() {
        return bookingid;
    }
    public void setBookingid(int bookingid) {
        this.bookingid = bookingid;
    }
    public String getBookingdescription() {
        return bookingdescription;
    }
    public void setBookingdescription(String bookingdescription) {
        this.bookingdescription = bookingdescription;
    }
    public int getSpaceid() {
        return spaceid;
    }
    public void setSpaceid(int spaceid) {
        this.spaceid = spaceid;
    }
    public Date getEventdate() {
        return eventdate;
    }
    public void setEventdate(Date eventdate) {
        this.eventdate = eventdate;
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
    public int getApplicantid() {
        return applicantid;
    }
    public void setApplicantid(int applicantid) {
        this.applicantid = applicantid;
    }
    public int getStaffid() {
        return staffid;
    }
    public void setStaffid(int staffid) {
        this.staffid = staffid;
    }
    public int getApproveid() {
        return approveid;
    }
    public void setApproveid(int approveid) {
        this.approveid = approveid;
    }
}
