/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.sys;

import app.qlcv.customs.MappingFormula;
import app.qlcv.entities.Formula;
import app.qlcv.entities.ParameterSetup;
import app.qlcv.utils.SystemMethod;
import com.opensymphony.xwork2.ActionSupport;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author sonng
 */
public class CalculationFormulaAction extends ActionSupport implements SessionAware, ServletRequestAware {

    private HttpServletRequest request;
    private Map<String, Object> session;
    private CodeValueController controller;
    private SystemMethod systemMethod;
    private ParameterSetup parameterSetup;
    private CalculationFormulaController calculationFormulaController;
    private List<ParameterSetup> lstParameterSetup;
    private List<Formula> lstFormula = new ArrayList<>();
    private Formula formula;
    private List<ParameterSetup> lstParameterSetupsCompaire = new ArrayList<>();
    private List<MappingFormula> lstMappingFormulas = new ArrayList<>();

    public CalculationFormulaAction() {
        controller = new CodeValueController();
        systemMethod = new SystemMethod();
        calculationFormulaController = new CalculationFormulaController();
    }

    public String createNewParameter() {
        int countInput = Integer.parseInt(request.getParameter("countItemInput"));
        List<ParameterSetup> lstCodeValues = new ArrayList<>();
        for (int i = 0; i < countInput; i++) {
            ParameterSetup p = new ParameterSetup();
            p.setParameterName(request.getParameter("createListParameter[" + i + "][parameterSetup.parameterName]"));
            p.setDecription(request.getParameter("createListParameter[" + i + "][parameterSetup.decription]"));
            p.setQueryContent(request.getParameter("createListParameter[" + i + "][parameterSetup.queryContent]"));
            p.setStatus("ACTIVE");
            lstCodeValues.add(p);
        }
        calculationFormulaController.createNewParameter(lstCodeValues);
        lstParameterSetup = new ArrayList<>();
        lstParameterSetup = calculationFormulaController.getAllParameter();
        return SUCCESS;
    }

    public String getAllParameter() {
        lstParameterSetup = new ArrayList<>();
        lstParameterSetup = calculationFormulaController.getAllParameter();
        return SUCCESS;
    }

    public String prepareCreateFormula() {
        lstParameterSetup = new ArrayList<>();
        lstParameterSetup = calculationFormulaController.getAllParameter();
        return SUCCESS;
    }

    public String createFormula() {
        formula.setStatus("ACTIVE");
        calculationFormulaController.createFormula(formula);
        lstFormula = calculationFormulaController.getAllFormula();
        return SUCCESS;
    }

    public String getAllFormula() {
        lstFormula = calculationFormulaController.getAllFormula();
        return SUCCESS;
    }

    public String prepareCompaireFormula() {
        String a = request.getParameter("selectCompaire");
        String[] formulaString = null;
        for (Map.Entry<String, String[]> entry : request.getParameterMap().entrySet()) {
            if (entry.getValue().length > 0 && entry.getKey().contains("selectCompaire")) {
                formulaString = entry.getValue();
                break;
            }
        }
        List<Integer> lstFormulaId = new ArrayList<>();
        for (int i = 0; i < formulaString.length; i++) {
            String string = formulaString[i];
            lstFormulaId.add(Integer.parseInt(string));
        }

        List<Formula> lstFormulas = new ArrayList<>();
        for (int i = 0; i < lstFormulaId.size(); i++) {
            Integer get = lstFormulaId.get(i);
            Formula f = new Formula();
            f = calculationFormulaController.GetFormulaById(get);
            lstFormulas.add(f);
        }

        List<ParameterSetup> lstParameterSetups = new ArrayList<>();
        lstParameterSetups = calculationFormulaController.getAllParameter();

        HashMap<String, ParameterSetup> hashMap = new HashMap<>();
        for (int i = 0; i < lstFormulas.size(); i++) {
            for (int j = 0; j < lstParameterSetups.size(); j++) {
                if (lstFormulas.get(i).getFormulaCaculation().contains(lstParameterSetups.get(j).getParameterName())) {
                    if (hashMap.get(lstParameterSetups.get(j).getParameterName()) == null) {
                        hashMap.put(lstParameterSetups.get(j).getParameterName(), lstParameterSetups.get(j));
                    }
                }
            }

        }

        for (Map.Entry<String, ParameterSetup> entry : hashMap.entrySet()) {
            lstParameterSetupsCompaire.add(entry.getValue());
        }

        session.put("lstParameterSetupsCompaire", lstParameterSetupsCompaire);
        session.put("lstFormulasCompaire", lstFormulas);

        return SUCCESS;
    }

    public String compaireFormula() {
        HashMap<String, String> hashMap = new HashMap<>();
        List<ParameterSetup> lstParameterSetups = new ArrayList<>();
        lstParameterSetups = (List<ParameterSetup>) session.get("lstParameterSetupsCompaire");
        for (int i = 0; i < lstParameterSetups.size(); i++) {
            ParameterSetup get = lstParameterSetups.get(i);
            hashMap.put(get.getParameterName(), request.getParameter(get.getParameterName()));
        }

        List<Formula> lstFormulas = new ArrayList<>();
        lstFormulas = (List<Formula>) session.get("lstFormulasCompaire");
        
        String maxvalue = "";
        String minvalue = "";
        double maxvalueDouble = 0.0;
        double minvalueDouble = 0.0;
        String formularMax = "";        
        String formularMin = "";
        
        NumberFormat nf = NumberFormat.getInstance(new Locale("en", "US"));
        for (int i = 0; i < lstFormulas.size(); i++) {
            Formula get = lstFormulas.get(i);
            String formular = get.getFormulaCaculation();

            MappingFormula mp = new MappingFormula();
            mp.setFormula(formular);

            for (Map.Entry<String, String> entry : hashMap.entrySet()) {
                String key = entry.getKey();
                String value = entry.getValue();
                formular = formular.replaceAll(key, value);
            }
            CaculationFormula cf = new CaculationFormula();
            double value = Double.parseDouble(cf.generalFormulaForCompaire(formular)) ;
            if(maxvalueDouble == 0.0){
                maxvalueDouble = value;
                 maxvalue = nf.format(value);
                formularMax = get.getFormulaCaculation();
            }
            if(minvalueDouble == 0.0){
                minvalueDouble = value;
                minvalue = nf.format(value);
                formularMin = get.getFormulaCaculation();
            }
            if(value > maxvalueDouble){
                maxvalue = nf.format(value);
                formularMax = get.getFormulaCaculation();
            }
            if(value < minvalueDouble){
                minvalue = nf.format(value);
                formularMin = get.getFormulaCaculation();
            }
            
            String val = nf.format(value);
            mp.setValueTotal(val);
            lstMappingFormulas.add(mp);
        }
        
        
        session.put("maxAmount", maxvalue);
        session.put("minAmount", minvalue);
        session.put("formularMax", formularMax);
        session.put("formularMin", formularMin);
        
        return SUCCESS;
    }

    public HttpServletRequest getRequest() {
        return request;
    }

    public void setRequest(HttpServletRequest request) {
        this.request = request;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session = map;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
        this.request = hsr;
    }

    public ParameterSetup getParameterSetup() {
        return parameterSetup;
    }

    public void setParameterSetup(ParameterSetup parameterSetup) {
        this.parameterSetup = parameterSetup;
    }

    public List<ParameterSetup> getLstParameterSetup() {
        return lstParameterSetup;
    }

    public void setLstParameterSetup(List<ParameterSetup> lstParameterSetup) {
        this.lstParameterSetup = lstParameterSetup;
    }

    public Formula getFormula() {
        return formula;
    }

    public void setFormula(Formula formula) {
        this.formula = formula;
    }

    public List<Formula> getLstFormula() {
        return lstFormula;
    }

    public void setLstFormula(List<Formula> lstFormula) {
        this.lstFormula = lstFormula;
    }

    public List<ParameterSetup> getLstParameterSetupsCompaire() {
        return lstParameterSetupsCompaire;
    }

    public void setLstParameterSetupsCompaire(List<ParameterSetup> lstParameterSetupsCompaire) {
        this.lstParameterSetupsCompaire = lstParameterSetupsCompaire;
    }

    public List<MappingFormula> getLstMappingFormulas() {
        return lstMappingFormulas;
    }

    public void setLstMappingFormulas(List<MappingFormula> lstMappingFormulas) {
        this.lstMappingFormulas = lstMappingFormulas;
    }

}
