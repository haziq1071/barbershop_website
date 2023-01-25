package com.example.suraubookingsystem;
import java.io.Serializable;

public class Space implements Serializable{

    public int spaceid;
    public String spacename;
    public int spacecapacity;
    public String spacestatus;
    public String soundsystem;
    public int tablequantity;
    public int chairquantity;

    //default
    public Space() {

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
