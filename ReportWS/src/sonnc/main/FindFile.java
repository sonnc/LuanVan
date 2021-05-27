package sonnc.main;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class FindFile {

	private static final Logger logger = LogManager.getLogger(FindFile.class);
	public List<String> findFile(String source, String name) {

		File dir = new File(source);
		String[] children = dir.list();

		List<String> lstFile = new ArrayList<>();
		if (children == null) {
//			System.out.println("Either dir does not exist or is not a directory");
		} else {
			for (int i = 0; i < children.length; i++) {
				String filename = children[i];
				
			    String[] splitString = filename.split("[_]", 2);
				
				if ((splitString[0].equals(name)) && filename.contains(name+"_Main") && filename.contains("jrxml")) {
					lstFile.add(filename);
				}
				if (filename.equals(name + ".jrxml")) {
					lstFile.add(filename);
					break;
				}
			}
		}
		// thực hiện sắp xếp các mẫu báo cáo theo quy chuẩn
		Collections.sort(lstFile);

		return lstFile;
	}
	
}
