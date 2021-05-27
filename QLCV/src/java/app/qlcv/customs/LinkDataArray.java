/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.customs;

/**
 *
 * @author sonng
 */
public class LinkDataArray {
//    {"from":1,"to":2,"dash":[10,3],"thickness":10,"points":[60,-10,78,-10,89,-10,89,-10,100,-10,110,-10]},
//{"from":1,"to":3,"dash":[20,4],"color":"green","text":"label","points":[0,30,0,40,0,50,0,50,0,60,0,70]},
//{"from":3,"to":4,"color":"red","text":"a red label","fromSpot":"RightSide","points":[60,100,70,100,80,100,80,125,80,150,80,160]},

    private String from;
    private String to;
    private String dash; // net dut nhieu hay it
    private String color;
    private String text;
    private String dir; //0: la duong thang, 1: mui ten tu trai sang phai; 2: mui ten tu phai sang trai

    public LinkDataArray() {
    }

    public LinkDataArray(String from, String to, String dash, String color, String text, String dir) {
        this.from = from;
        this.to = to;
        this.dash = dash;
        this.color = color;
        this.text = text;
        this.dir = dir;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getDash() {
        return dash;
    }

    public void setDash(String dash) {
        this.dash = dash;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }
    
    

}
