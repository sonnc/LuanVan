/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.utils;

import static com.opensymphony.xwork2.Action.SUCCESS;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

/**
 *
 * @author acun
 */
public class SendSMS {

    private final String APIKey = "8D6A4C6EDAB1C14483AD046C7D020A";
    private final String SecretKey = "63381D4FE8EB34A29412BF2F530DCE";
    private final String url = "http://api.esms.vn/MainService.svc/xml/SendMultipleMessage_V4/";

    public boolean sendSMSCustomer(String phone, String sms) throws UnsupportedEncodingException, IOException {

        URL obj;
        try {
            obj = new URL(url);

            HttpURLConnection con = (HttpURLConnection) obj.openConnection();

            String customers = "";

            String[] lstPhone = phone.split(",");

            for (int i = 0; i < lstPhone.length; i++) {
                customers = customers + "<CUSTOMER>"
                        + "<PHONE>" + lstPhone[i].replace(" ", "") + "</PHONE>"
                        + "</CUSTOMER>";
            }

            //message tieng viet khong dau 160 ky tu   
//            String SampleXml = "<RQST>"
//                    + "<APIKEY>" + APIKey + "</APIKEY>"
//                    + "<SECRETKEY>" + SecretKey + "</SECRETKEY>"
//                    + "<ISFLASH>0</ISFLASH>"
//                    + "<UNICODE>0</UNICODE>"
//                    + "<SMSTYPE>7</SMSTYPE>"
//                    + "<CONTENT>" + message + "</CONTENT>"
//                    + "<CONTACTS>" + customers + "</CONTACTS>"
//                    + "</RQST>";
            //message tieng viet co dau 70 ky tu
            String SampleXml = "<RQST>"
                    + "<APIKEY>" + APIKey + "</APIKEY>"
                    + "<SECRETKEY>" + SecretKey + "</SECRETKEY>"
                    + "<ISFLASH>0</ISFLASH>"
                    + "<UNICODE>1</UNICODE>"
                    + "<CONTENT>" + URLEncoder.encode(sms, "UTF-8").replace("+", "%20") + "</CONTENT>"
                    + "<CONTACTS>" + customers + "</CONTACTS>"
                    + "</RQST>";

            String postData = SampleXml.trim();

            con.setDoOutput(true);
            con.setRequestMethod("POST");

            con.setFixedLengthStreamingMode(postData.getBytes().length);
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            //send the POST out
            PrintWriter out = new PrintWriter(con.getOutputStream());
            out.print(postData);
            out.close();

            int responseCode = con.getResponseCode();
            System.out.println("\nSending 'GET' request to URL : " + url);
            System.out.println("Response Code : " + responseCode);
            if (responseCode == 200) {
                //Check CodeResult from response
            }

            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            //print result
            System.out.println(response.toString());

        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }
        return true;
    }

}
