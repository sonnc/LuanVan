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
public class NodeDataArray {
//    "key":1, "loc":"0 0", "text":"Alpha", "details":"some information about Alpha and its importance"
    
    private String key;
    private String loc;
    private String text;
    private String details;
    private String color;
    private String thickness; // do day cua vien
    private String figure; // loai hinh: elcip, hinh chu nhat, hinh vuong, ...
    private String fill; // do mau vao hinh
    private String isGroup;
    private int level;

    public NodeDataArray() {
    }

    public NodeDataArray(String key, String loc, String text, String details, String color, String thickness, String figure, String fill, String isGroup) {
        this.key = key;
        this.loc = loc;
        this.text = text;
        this.details = details;
        this.color = color;
        this.thickness = thickness;
        this.figure = figure;
        this.fill = fill;
        this.isGroup = isGroup;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getLoc() {
        return loc;
    }

    public void setLoc(String loc) {
        this.loc = loc;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getThickness() {
        return thickness;
    }

    public void setThickness(String thickness) {
        this.thickness = thickness;
    }

    public String getFigure() {
        return figure;
    }

    public void setFigure(String figure) {
        this.figure = figure;
    }

    public String getFill() {
        return fill;
    }

    public void setFill(String fill) {
        this.fill = fill;
    }

    public String getIsGroup() {
        return isGroup;
    }

    public void setIsGroup(String isGroup) {
        this.isGroup = isGroup;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }
    
    
    
}
