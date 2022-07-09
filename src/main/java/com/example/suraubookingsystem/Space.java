package com.example.suraubookingsystem;
import java.io.Serializable;
import javax.servlet.http.Part;

public class Space implements Serializable{
    private int spaceid;
    private String spacename;
    private int spacecapacity;
    private String spacestatus;
    private String soundsystem;
    private int tablequantity;
    private int chairquantity;

    public Space() {
        super();
        // TODO Auto-generated constructor stub
    }

    public int getSpaceid() {
        return spaceid;
    }

    public void setSpaceid(int spaceid) {
        this.spaceid = spaceid;
    }

    public String getSpacename() {
        return spacename;
    }

    public void setSpacename(String spacename) {
        this.spacename = spacename;
    }

    public int getSpacecapacity() {
        return spacecapacity;
    }

    public void setSpacecapacity(int spacecapacity) {
        this.spacecapacity = spacecapacity;
    }

    public String getSpacestatus() {
        return spacestatus;
    }

    public void setSpacestatus(String spacestatus) {
        this.spacestatus = spacestatus;
    }

    public String getSoundsystem() {
        return soundsystem;
    }

    public void setSoundsystem(String soundsystem) {
        this.soundsystem = soundsystem;
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
