/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.sys;

import app.qlcv.entities.SysCodeSet;
import app.qlcv.entities.SysCodeValue;
import app.qlcv.entities.TkUser;
import app.qlcv.utils.SystemMethod;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author sonng
 */
public class CodeValueAction extends ActionSupport implements SessionAware, ServletRequestAware {

    private HttpServletRequest request;
    private Map<String, Object> session;
    private CodeValueController controller;
    private List<SysCodeSet> lstCodeSet;
    private SysCodeSet sysCodeSet;
    private SysCodeValue sysCodeValue;
    private List<SysCodeValue> lstCodeValues;
    private SystemMethod systemMethod;

    public CodeValueAction() {
        controller = new CodeValueController();
        systemMethod = new SystemMethod();
    }

    public String getAllCodeSet() {
        lstCodeSet = controller.getAllCodeSet();
        return SUCCESS;
    }

    public String eventCodeSet() {
        String event = request.getParameter("event");
        int id = Integer.parseInt(request.getParameter("id"));
        if ("view".equals(event) || "prepareEdit".equals(event)) {
            //Lay thong tin code set
            sysCodeSet = controller.getCodeSetById(id);
            lstCodeValues = controller.getAllCodeValueByCodeSetId(id);
            return "view".equals(event) ? "VIEW_CODESET_CODEVALUE" : "EDIT_CODESET_CODEVALUE";
            // lay thong tin code value
        } else if ("edit".equals(event)) {
            TkUser user = (TkUser) session.get("user");
            int countInput = Integer.parseInt(request.getParameter("countItemInput"));
            sysCodeSet = controller.getCodeSetById(id);

            List<SysCodeValue> lstCodeValue = new ArrayList<>();
            for (int i = 0; i < countInput; i++) {
                SysCodeValue scv = new SysCodeValue();
                boolean isCreate = false;
                if (request.getParameter("createListCodeValue[" + i + "][idCV]") == null
                        || "".equals(request.getParameter("createListCodeValue[" + i + "][idCV]"))) {
                    isCreate = true;
                }
                if (isCreate) {
                    scv.setCreateBy(user.getLoginId());
                    scv.setCreationDate(systemMethod.getSysDateToSqlDate());
                    scv.setVersionTime(0);
                    scv.setSysCodeSet(sysCodeSet);
                } else {
                    scv = controller.getCodeValueById(Integer.parseInt(request.getParameter("createListCodeValue[" + i + "][idCV]")));
                }
                scv.setDisplayOrder(Integer.parseInt(request.getParameter("createListCodeValue[" + i + "][displayOrder]")));
                scv.setCode(request.getParameter("createListCodeValue[" + i + "][code]"));
                scv.setCodeValue(request.getParameter("createListCodeValue[" + i + "][codeValue]"));
                scv.setLocalCodeValue(request.getParameter("createListCodeValue[" + i + "][localCodeValue]"));
                scv.setLastUpdateBy(user.getLoginId());
                scv.setLastUpdateDate(systemMethod.getSysDateToSqlDate());
                scv.setStatus("ACTIVE");
                scv.setVersionTime(scv.getVersionTime() + 1);
                lstCodeValue.add(scv);
            }
            if (controller.editCodeValueByList(id, lstCodeValue)) {
                sysCodeSet = controller.getCodeSetById(id);
                lstCodeValues = controller.getAllCodeValueByCodeSetId(id);
                return "VIEW_CODESET_CODEVALUE";
            }
        } else if ("delete".equals(event) || "reactive".equals(event)) {
            sysCodeSet = controller.getCodeSetById(id);
            if ("delete".equals(event)) {
                sysCodeSet.setStatus("INACTIVE");
            } else {
                sysCodeSet.setStatus("ACTIVE");
            }
            if (controller.editCodeSetById(sysCodeSet)) {
                lstCodeSet = controller.getAllCodeSet();
                return SUCCESS;
            }
        } else if ("create".equals(event)) {
//            createListCodeValue[0][sysCodeValue.code]
            TkUser user = (TkUser) session.get("user");
            sysCodeSet.setCreateBy(user.getLoginId());
            sysCodeSet.setLastUpdateBy(user.getLoginId());
            sysCodeSet.setCreationDate(systemMethod.getSysDateToSqlDate());
            sysCodeSet.setLastUpdateDate(systemMethod.getSysDateToSqlDate());
            sysCodeSet.setVersionTime(0);
            sysCodeSet.setStatus("ACTIVE");

            int countInput = Integer.parseInt(request.getParameter("countItemInput"));
            List<SysCodeValue> lstCodeValues = new ArrayList<>();
            for (int i = 0; i < countInput; i++) {
                SysCodeValue scv = new SysCodeValue();
                scv.setDisplayOrder(Integer.parseInt(request.getParameter("createListCodeValue[" + i + "][sysCodeValue.displayOrder]")));
                scv.setCode(request.getParameter("createListCodeValue[" + i + "][sysCodeValue.code]"));
                scv.setCodeValue(request.getParameter("createListCodeValue[" + i + "][sysCodeValue.codeValue]"));
                scv.setLocalCodeValue(request.getParameter("createListCodeValue[" + i + "][sysCodeValue.localCodeValue]"));
                scv.setCreateBy(user.getLoginId());
                scv.setLastUpdateBy(user.getLoginId());
                scv.setCreationDate(systemMethod.getSysDateToSqlDate());
                scv.setLastUpdateDate(systemMethod.getSysDateToSqlDate());
                scv.setStatus("ACTIVE");
                scv.setVersionTime(0);
                lstCodeValues.add(scv);
            }
            if (controller.createNewCodeSetAndCodeValue(sysCodeSet, lstCodeValues)) {
                getAllCodeSet();
                return SUCCESS;
            };
        }
        return SUCCESS;
    }

    // SETTER AND GETTER
    public SysCodeValue getSysCodeValue() {
        return sysCodeValue;
    }

    public void setSysCodeValue(SysCodeValue sysCodeValue) {
        this.sysCodeValue = sysCodeValue;
    }

    public SysCodeSet getSysCodeSet() {
        return sysCodeSet;
    }

    public void setSysCodeSet(SysCodeSet sysCodeSet) {
        this.sysCodeSet = sysCodeSet;
    }

    public List<SysCodeValue> getLstCodeValues() {
        return lstCodeValues;
    }

    public void setLstCodeValues(List<SysCodeValue> lstCodeValues) {
        this.lstCodeValues = lstCodeValues;
    }

    public List<SysCodeSet> getLstCodeSet() {
        return lstCodeSet;
    }

    public void setLstCodeSet(List<SysCodeSet> lstCodeSet) {
        this.lstCodeSet = lstCodeSet;
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
}
