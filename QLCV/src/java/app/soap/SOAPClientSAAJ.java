package app.soap;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletResponse;
import javax.xml.soap.MessageFactory;
import javax.xml.soap.MimeHeaders;
import javax.xml.soap.SOAPBody;
import javax.xml.soap.SOAPConnection;
import javax.xml.soap.SOAPConnectionFactory;
import javax.xml.soap.SOAPElement;
import javax.xml.soap.SOAPEnvelope;
import javax.xml.soap.SOAPException;
import javax.xml.soap.SOAPMessage;
import javax.xml.soap.SOAPPart;

import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class SOAPClientSAAJ {

    public String main(HttpServletResponse response, ObjectFile object) throws IOException {

        String soapEndpointUrl = "http://localhost:8080/ReportWS/services/MainReport";

        String soapAction = "mainReportJasperWS";
        
        String pathfile = callSoapWebService(soapEndpointUrl, soapAction, object);
//        if (pathfile != null) {
//            Path path = Paths.get(pathfile);
//            byte[] data = Files.readAllBytes(path);
//
//            response.setContentType("application/msword");
//            response.setHeader("Content-Disposition", "attachment;filename=" + path.getFileName());
//            response.setContentLength(data.length);
//            InputStream inputStream = new BufferedInputStream(new ByteArrayInputStream(data));
//
//            OutputStream outStream = response.getOutputStream();
//            byte[] buffer = new byte[4096];
//            int bytesRead = -1;
//            while ((bytesRead = inputStream.read(buffer)) != -1) {
//                outStream.write(buffer, 0, bytesRead);
//            }
//            inputStream.close();
//            outStream.close();
//        }
        return pathfile;
    }

    public void createSoapEnvelope(SOAPMessage soapMessage, ObjectFile object) throws SOAPException {
        SOAPPart soapPart = soapMessage.getSOAPPart();

        String myNamespace = "mainReportWS";
        String myNamespaceURI = "http://main.sonnc";

        SOAPEnvelope envelope = soapPart.getEnvelope();
        envelope.addNamespaceDeclaration(myNamespace, myNamespaceURI);

        SOAPBody soapBody = envelope.getBody();
        SOAPElement soapBodyElem = soapBody.addChildElement("mainReportJasperWS", myNamespace);
        SOAPElement soapBodyElem1 = soapBodyElem.addChildElement("userid", myNamespace);
        soapBodyElem1.addTextNode(object.getUserid());
        SOAPElement soapBodyElem2 = soapBodyElem.addChildElement("nameTemplate", myNamespace);
        soapBodyElem2.addTextNode(object.getNameTemplate());
        SOAPElement soapBodyElem3 = soapBodyElem.addChildElement("fileType", myNamespace);
        soapBodyElem3.addTextNode(object.getFileType());
        SOAPElement soapBodyElem4 = soapBodyElem.addChildElement("ip1", myNamespace);
        soapBodyElem4.addTextNode(object.getIp1());
        SOAPElement soapBodyElem5 = soapBodyElem.addChildElement("ip2", myNamespace);
        soapBodyElem5.addTextNode(object.getIp2());
        SOAPElement soapBodyElem51 = soapBodyElem.addChildElement("ip3", myNamespace);
        soapBodyElem51.addTextNode(object.getIp3());
        SOAPElement soapBodyElem6 = soapBodyElem.addChildElement("sp1", myNamespace);
        soapBodyElem6.addTextNode(object.getSp1());
        SOAPElement soapBodyElem7 = soapBodyElem.addChildElement("sp2", myNamespace);
        soapBodyElem7.addTextNode(object.getSp2());
        SOAPElement soapBodyElem8 = soapBodyElem.addChildElement("sp3", myNamespace);
        soapBodyElem8.addTextNode(object.getSp3());

    }

    public String callSoapWebService(String soapEndpointUrl, String soapAction, ObjectFile object) {
        String someMsgContent = null;
        try {
            // Create SOAP Connection
            SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();
            SOAPConnection soapConnection = soapConnectionFactory.createConnection();
            // Send SOAP Message to SOAP Server
            SOAPMessage soapResponse = soapConnection.call(createSOAPRequest(soapAction, object), soapEndpointUrl);

            // Print the SOAP Response
            soapResponse.writeTo(System.out);

            SOAPBody soapBody = soapResponse.getSOAPBody();
            NodeList nodes = soapBody.getElementsByTagName("mainReportJasperWSReturn");
            Node node = nodes.item(0);
            someMsgContent = node != null ? node.getTextContent() : "";

            soapConnection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("\n");
        System.out.println(someMsgContent);
        return someMsgContent;
    }

    public SOAPMessage createSOAPRequest(String soapAction, ObjectFile object) throws Exception {
        MessageFactory messageFactory = MessageFactory.newInstance();
        SOAPMessage soapMessage = messageFactory.createMessage();

        createSoapEnvelope(soapMessage, object);
        MimeHeaders headers = soapMessage.getMimeHeaders();
        headers.addHeader("mainReportJasperWS", soapAction);

        soapMessage.saveChanges();

        soapMessage.writeTo(System.out);

        return soapMessage;
    }

}
