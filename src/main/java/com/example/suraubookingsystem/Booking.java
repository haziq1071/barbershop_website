package com.example.suraubookingsystem;
import java.io.Serializable;
import java.sql.Date;

public class Booking implements Serializable{
    private int bookingid;
    private String bookingdescription;
    private Date eventdate;
    private Date bookingdate;
    private String bookingstatus;
    private int approveid;
    private Date bookingapprovaldate;

    public Booking() {

    }

    public Booking(int bookingid, String bookingdescription, Date eventdate, Date bookingdate, String bookingstatus, int approveid, Date bookingapprovaldate) {
        this.bookingid = bookingid;
        this.bookingdescription = bookingdescription;
        this.eventdate = eventdate;
        this.bookingdate = bookingdate;
        this.bookingstatus = bookingstatus;
        this.approveid = approveid;
        this.bookingapprovaldate = bookingapprovaldate;

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
    public int getApproveid() {
        return approveid;
    }
    public void setApproveid(int approveid) {
        this.approveid = approveid;
    }

    public Date getBookingapprovaldate() {
        return bookingapprovaldate;
    }

    public void setBookingapprovaldate(Date bookingapprovaldate) {
        this.bookingapprovaldate = bookingapprovaldate;
    }

}
