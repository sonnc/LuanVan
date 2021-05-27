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
public class MappingFormula {
    private String formula;
    private String valueTotal;

    public MappingFormula() {
    }

    public MappingFormula(String formula, String valueTotal) {
        this.formula = formula;
        this.valueTotal = valueTotal;
    }

    public String getFormula() {
        return formula;
    }

    public void setFormula(String formula) {
        this.formula = formula;
    }

    public String getValueTotal() {
        return valueTotal;
    }

    public void setValueTotal(String valueTotal) {
        this.valueTotal = valueTotal;
    }
    
    
}
