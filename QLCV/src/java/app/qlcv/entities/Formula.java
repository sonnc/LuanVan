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
public class Formula {

    private int id;
    private String formulaCaculation;
    private String status;
    private String description;
    

    public Formula() {
    }

    public Formula(int id, String formulaCaculation, String status, String description) {
        this.id = id;
        this.formulaCaculation = formulaCaculation;
        this.status = status;
        this.description = description;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFormulaCaculation() {
        return formulaCaculation;
    }

    public void setFormulaCaculation(String formulaCaculation) {
        this.formulaCaculation = formulaCaculation;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    
    
    
}
