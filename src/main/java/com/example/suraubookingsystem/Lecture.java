package com.example.suraubookingsystem;
import java.io.Serializable;

public class Lecture implements Serializable{

    private static final long serialVersionUID = 1L;
    private int spaceid;
    private int tablequantity;
    private int chairquantity;

    public Lecture() {}

    public int getSpaceid() {
        return spaceid;
    }

    public void setSpaceid(int spaceid) {
        this.spaceid = spaceid;
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
