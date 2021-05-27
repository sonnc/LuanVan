/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.sys;

import app.qlcv.entities.ParameterSetup;
import app.qlcv.entities.TkUser;
import java.util.ArrayList;
import java.util.List;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

/**
 *
 * @author sonng
 */
public class CaculationFormula {

    private CalculationFormulaController calculationFormulaController;

    public CaculationFormula() {
        calculationFormulaController = new CalculationFormulaController();
    }

    public String getSQLByParameter(String parameter) {
        ParameterSetup ps = new ParameterSetup();
        ps = calculationFormulaController.getSQLByParameter(parameter);
        return ps.getQueryContent();
    }

    public String generalFormula(String formula, List<ParameterSetup> lstParameter, TkUser user) {
        ScriptEngineManager mgr = new ScriptEngineManager();
        ScriptEngine engine = mgr.getEngineByName("JavaScript");

        for (int i = 0; i < lstParameter.size(); i++) {
            ParameterSetup get = lstParameter.get(i);
            String value = calculationFormulaController.getValueFromSQLParameter(get.getQueryContent(), user.getId());
            if (value != null) {
                formula = formula.replaceAll(get.getParameterName(), value);
            }
        }
        String valueReturn = "";
        try {
            valueReturn = String.valueOf( engine.eval(formula));
        } catch (Exception e) {
        }
        if(valueReturn==null || valueReturn.equals("")){
            valueReturn = "0";
        }
        return valueReturn;
    }

    public List<ParameterSetup> mappingParameterWithFormula(String formula) {
        List<ParameterSetup> lstParameter = new ArrayList<>();
        List<ParameterSetup> lstParameterWithFormula = new ArrayList<>();
        lstParameter = calculationFormulaController.getAllParameter();
        for (int i = 0; i < lstParameter.size(); i++) {
            ParameterSetup get = lstParameter.get(i);
            if (formula.contains(get.getParameterName())) {
                lstParameterWithFormula.add(get);
            }
        }
        return lstParameterWithFormula;
    }
    
    public String generalFormulaForCompaire(String formula) {
        ScriptEngineManager mgr = new ScriptEngineManager();
        ScriptEngine engine = mgr.getEngineByName("JavaScript");
        String valueReturn = "0";
        try {
            valueReturn = String.valueOf( engine.eval(formula));
        } catch (Exception e) {
        }
        return valueReturn;
    }


}
