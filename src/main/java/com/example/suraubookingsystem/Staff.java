package com.example.suraubookingsystem;

import java.io.Serializable;
import java.sql.Date;

public class Staff implements Serializable{
	
	public int staffid; 
	public String staffrole; 
	public String staffname;
	public String staffic;
	public String staffaddress; 
	public String staffphone;
	public String staffemail; 
	public Date staffdateofbirth;
	public String staffusername;
	public String staffpassword; 
	public int supervisorid;
	
	public Staff() {
    }

	public int getStaffid() {
		return staffid;
	}

	public void setStaffid(int staffid) {
		this.staffid = staffid;
	}

	public String getStaffrole() {
		return staffrole;
	}

	public void setStaffrole(String staffrole) {
		this.staffrole = staffrole;
	}

	public String getStaffname() {
		return staffname;
	}

	public void setStaffname(String staffname) {
		this.staffname = staffname;
	}

	public String getStaffic() {
		return staffic;
	}

	public void setStaffic(String staffic) {
		this.staffic = staffic;
	}

	public String getStaffaddress() {
		return staffaddress;
	}

	public void setStaffaddress(String staffaddress) {
		this.staffaddress = staffaddress;
	}

	public String getStaffphone() {
		return staffphone;
	}

	public void setStaffphone(String staffphone) {
		this.staffphone = staffphone;
	}

	public String getStaffemail() {
		return staffemail;
	}

	public void setStaffemail(String staffemail) {
		this.staffemail = staffemail;
	}

	public Date getStaffdateofbirth() {
		return staffdateofbirth;
	}

	public void setStaffdateofbirth(Date staffdateofbirth) {
		this.staffdateofbirth = staffdateofbirth;
	}

	public String getStaffusername() {
		return staffusername;
	}

	public void setStaffusername(String staffusername) {
		this.staffusername = staffusername;
	}

	public String getStaffpassword() {
		return staffpassword;
	}

	public void setStaffpassword(String staffpassword) {
		this.staffpassword = staffpassword;
	}

	public int getSupervisorid() {
		return supervisorid;
	}

	public void setSupervisorid(int supervisorid) {
		this.supervisorid = supervisorid;
	}
}

