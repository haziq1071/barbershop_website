package com.example.suraubookingsystem;
import java.io.Serializable;

public class Lecture extends Space{

    int tablequantity;
    int chairquantity;

    //default
    public Lecture() {
        super();
    }

    public Lecture(int spaceid, String spacename, int spacecapacity,
            String spacestatus, String soundsystem, int tablequantity, int chairquantity){
        
        super(spaceid, spacename, spacecapacity, spacestatus, soundsystem);
        this.tablequantity = tablequantity;
        this.chairquantity = chairquantity;
    }
    //
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
