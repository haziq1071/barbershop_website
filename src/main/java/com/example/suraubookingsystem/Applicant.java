package com.example.suraubookingsystem;
import java.io.Serializable;
import java.sql.Date;
public class Applicant implements Serializable {
    public int applicantid;
    public String applicantname;
    public String applicantic;
    public Date applicantdateofbirth;
    public String applicantaddress;
    public String applicantemail;
    public String applicantphone;
    public String applicantusername;
    public String applicantpassword;

    public Applicant() {
    }
    public int getApplicantid() {
        return applicantid;
    }

    public void setApplicantid(int applicantid) {
        this.applicantid = applicantid;
    }

    public String getApplicantname() {
        return applicantname;
    }

    public void setApplicantname(String applicantname) {
        this.applicantname = applicantname;
    }

    public String getApplicantic() {
        return applicantic;
    }

    public void setApplicantic(String applicantic) {
        this.applicantic = applicantic;
    }

    public Date getApplicantdateofbirth() {
        return applicantdateofbirth;
    }

    public void setApplicantdateofbirth(Date applicantdateofbirth) {
        this.applicantdateofbirth = applicantdateofbirth;
    }

    public String getApplicantaddress() {
        return applicantaddress;
    }

    public void setApplicantaddress(String applicantaddress) {
        this.applicantaddress = applicantaddress;
    }

    public String getApplicantemail() {
        return applicantemail;
    }

    public void setApplicantemail(String applicantemail) {
        this.applicantemail = applicantemail;
    }

    public String getApplicantphone() {
        return applicantphone;
    }

    public void setApplicantphone(String applicantphone) {
        this.applicantphone = applicantphone;
    }

    public String getApplicantusername() {
        return applicantusername;
    }

    public void setApplicantusername(String applicantusername) {
        this.applicantusername = applicantusername;
    }

    public String getApplicantpassword() {
        return applicantpassword;
    }

    public void setApplicantpassword(String applicantpassword) {
        this.applicantpassword = applicantpassword;
    }
}
