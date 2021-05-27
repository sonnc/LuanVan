package sonnc.main;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import sonnc.main.*;

public class Cont {
//	private String CAS01_1 = "CAS01";// ALL
//	private String CAS01_2 = "CAS01_Main_1.jrxml CAS01_Main_2.jrxml"; // CAS MAIN1+MAIN2
//	private String CAS01_3 = "CAS01_Main_3.jrxml"; // MAIN3
//	private String CAS01_4 = "CAS01_Main_11.jrxml"; // AMIN4
//	private String CAS01_5 = "CAS01_Main_4.jrxml"; //
//	private String CAS01_6 = "CAS01_Main_6.jrxml"; // excutive
//	private String CAS01_7 = "CAS01_Main_7.jrxml CAS01_Main_8.jrxml"; //
//	private String CAS01_8 = "CAS01_Main_5.jrxml"; //screning
//	private String CAS01_9 = "CAS01_Main_9.jrxml";
//	private String CAS01_10 = "CAS01_Main_10.jrxml";
//	
//	private String CAS02_1 = "CAS02";// ALL
//	private String CAS02_2 = "CAS02_Main_1.jrxml CAS02_Main_2.jrxml "
//			+ "CAS02_Main_3.jrxml CAS02_Main_4.jrxml CAS02_Main_5.jrxml "
//			+ "CAS02_Main_6.jrxml CAS02_Main_7.jrxml"; // CAS MAIN1+MAIN2
//	private String CAS02_3 = "CAS02_Main_8.jrxml"; // MAIN3
//	private String CAS02_4 = "CAS02_Main_9.jrxml"; // AMIN4
//	private String CAS02_5 = "CAS02_Main_10.jrxml CAS02_Main_11.jrxml"; //
//	private String CAS02_6 = "CAS02_Main_16.jrxml";
//	//private String CAS02_7 = "CAS02_Main_13.1.jrxml CAS02_Main_13.2.jrxml";
//	private String CAS02_7 = "CAS02_Main_17.1.jrxml CAS02_Main_17.2.jrxml "
//			+ "CAS02_Main_17.3.jrxml CAS02_Main_17.4.jrxml CAS02_Main_17.5.jrxml";
//	private String CAS02_8 = "CAS02_Main_12.jrxml";
//	private String CAS02_9 = "CAS02_Main_14.jrxml";
//	private String CAS02_10 = "CAS02_Main_15.jrxml";
//	
//	
//
//	public List<String> LstContCAS01() {
//		List<String> lst = new ArrayList<>();
//		lst.add(CAS01_1);
//		lst.add(CAS01_2);
//		lst.add(CAS01_3);
//		lst.add(CAS01_4);
//		lst.add(CAS01_5);
//		lst.add(CAS01_6);
//		lst.add(CAS01_7);
//		lst.add(CAS01_8);
//		lst.add(CAS01_9);
//		lst.add(CAS01_10);
//		return lst;
//	}
//	
//	public List<String> LstContCAS01All() {
//		List<String> lst = new ArrayList<>();
//		lst.add("CAS01_Main_1.jrxml");
//		lst.add("CAS01_Main_2.jrxml");
//		lst.add("CAS01_Main_3.jrxml");
//		lst.add("CAS01_Main_11.jrxml");
//		lst.add("CAS01_Main_4.jrxml");
//		lst.add("CAS01_Main_6.jrxml");
//		lst.add("CAS01_Main_7.jrxml");
//		lst.add("CAS01_Main_8.jrxml");
//		lst.add("CAS01_Main_5.jrxml");
//		lst.add("CAS01_Main_9.jrxml");
//		lst.add("CAS01_Main_10.jrxml");
//		return lst;
//	}
//	
//	public List LstContCAS02() {
//		List<String> lst = new ArrayList<>();
//		lst.add(CAS02_1);
//		lst.add(CAS02_2);
//		lst.add(CAS02_3);
//		lst.add(CAS02_4);
//		lst.add(CAS02_5);
//		lst.add(CAS02_6);
//		lst.add(CAS02_7);
//		lst.add(CAS02_8);
//		lst.add(CAS02_9);
//		lst.add(CAS02_10);
//		return lst;
//	}
//
//	
//	public List<String> LstContCAS02All() {
//		List<String> lst = new ArrayList<>();
//		lst.add("CAS02_Main_1.jrxml");
//		lst.add("CAS02_Main_2.jrxml");
//		lst.add("CAS02_Main_3.jrxml");
//		lst.add("CAS02_Main_4.jrxml");
//		lst.add("CAS02_Main_5.jrxml");
//		lst.add("CAS02_Main_6.jrxml");
//		lst.add("CAS02_Main_7.jrxml");
//		lst.add("CAS02_Main_8.jrxml");
//		lst.add("CAS02_Main_9.jrxml");
//		lst.add("CAS02_Main_10.jrxml");
//		lst.add("CAS02_Main_11.jrxml");
//		lst.add("CAS02_Main_16.jrxml");
////		lst.add("CAS02_Main_13.1.jrxml");
////		lst.add("CAS02_Main_13.2.jrxml");
//		lst.add("CAS02_Main_17.1.jrxml");
//		lst.add("CAS02_Main_17.2.jrxml");
//		lst.add("CAS02_Main_17.3.jrxml");
//		lst.add("CAS02_Main_17.4.jrxml");
//		lst.add("CAS02_Main_17.5.jrxml");
//		lst.add("CAS02_Main_12.jrxml");
//		lst.add("CAS02_Main_14.jrxml");
//		lst.add("CAS02_Main_15.jrxml");
//		return lst;
//	}
	
	public List getFileFormConfig(String code, String listName){
		List lst = new ArrayList<>();
		try {
			lst = loadConfig(code, listName);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
	}
	
	public List loadConfig(String code, String listName) throws IOException {
		List<String> lstFile = new ArrayList<>();
		ReadConfig r = new ReadConfig();
		String pathFile = r.loadConfigFile().getProperty("path");
		InputStream inputStream = new FileInputStream(pathFile+"configCas.properties");
		Properties prop = new Properties();
		try {
//			String propFileName = pathFile+"config.properties";
//			inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);
			if (inputStream != null) {
				prop.load(inputStream);
			} else {
				throw new FileNotFoundException("property file config.properties not found in the classpath");
			}
			// get the property value and print it out
		} catch (Exception e) {
//			System.out.println("Exception: " + e);
		} finally {
			inputStream.close();
		}
		
		for(int i = 0; i< listName.length();i++){
			//vi tri = 0 tuong duong get all
			if (listName.charAt(0)=='1') {
				lstFile.add(prop.getProperty(code));
				break;
			}else{
				if (listName.charAt(i)=='1') {
					lstFile.add(prop.getProperty(code+"_"+i));
				}
			}
		}
		
		return lstFile;

	}
	
}
