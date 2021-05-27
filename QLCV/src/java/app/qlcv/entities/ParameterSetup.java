/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.entities;

/**
 *
 * @author sonng
 */
public class ParameterSetup {

    private int id;
    private String parameterName;
    private String dataType;
    private String status;
    private String queryContent;
    private String decription;
    

    public ParameterSetup() {
    }

    public ParameterSetup(int id, String parameterName, String dataType, String status, String queryContent, String decription) {
        this.id = id;
        this.parameterName = parameterName;
        this.dataType = dataType;
        this.status = status;
        this.queryContent = queryContent;
        this.decription = decription;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getParameterName() {
        return parameterName;
    }

    public void setParameterName(String parameterName) {
        this.parameterName = parameterName;
    }

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getQueryContent() {
        return queryContent;
    }

    public void setQueryContent(String queryContent) {
        this.queryContent = queryContent;
    }

    public String getDecription() {
        return decription;
    }

    public void setDecription(String decription) {
        this.decription = decription;
    }

    
    
}
