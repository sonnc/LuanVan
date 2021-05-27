package app.soap;

import app.qlcv.entities.TkUser;
import com.opensymphony.xwork2.ActionSupport;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

public class DownloadAction extends ActionSupport implements SessionAware, ServletRequestAware {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private Map<String, Object> session;
    private ObjectFile objectFile;
    private String filePath;

    public DownloadAction() {
    }
    
    public String DownloadReport(){

//        String userid = (String) request.getParameter("userid");
//        String nameTemplate = (String) request.getParameter("nameTemplate");
//        String fileType = (String) request.getParameter("fileType");
//        String ip1 = (String) request.getParameter("ip1");
//        String ip2 = (String) request.getParameter("ip2");
//        String ip3 = (String) request.getParameter("ip3");
//        String sp1 = (String) request.getParameter("sp1");
//        String sp2 = (String) request.getParameter("sp2");
//        String sp3 = (String) request.getParameter("sp3");
        String serviceName = "http://localhost:8080/ReportWS/services/MainReport";

        try {
            TkUser user = (TkUser)session.get("user");
            objectFile.setUserid(String.valueOf(user.getId()));
//            ObjectFile objectFile = new ObjectFile(userid, nameTemplate, fileType, ip1, ip2, ip3, sp1, sp2, sp3);
            SOAPClientSAAJ wsClient = new SOAPClientSAAJ();
            String part = wsClient.main(response, objectFile);
            filePath = part;
        } catch (Exception e) {
        }
        return SUCCESS;
    }

    @Override
    public void setSession(Map<String, Object> map
    ) {
        this.session = map;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr
    ) {
        this.request = hsr;
    }

    public ObjectFile getObjectFile() {
        return objectFile;
    }

    public void setObjectFile(ObjectFile objectFile) {
        this.objectFile = objectFile;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
    
    
}
