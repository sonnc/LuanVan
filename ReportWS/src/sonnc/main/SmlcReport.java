package sonnc.main;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.xml.ws.WebServiceException;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfImportedPage;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStructTreeController.returnType;
import com.itextpdf.text.pdf.PdfWriter;

import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JRPropertiesMap;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.HtmlExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRPdfExporterParameter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.export.JRXmlExporter;
import net.sf.jasperreports.engine.export.JRXmlExporterParameter;
import net.sf.jasperreports.engine.export.ooxml.JRDocxExporter;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.export.ExporterInput;
import net.sf.jasperreports.export.OutputStreamExporterOutput;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimplePdfExporterConfiguration;
import net.sf.jasperreports.view.JasperViewer;
import sonnc.conn.ConnectionUtils;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class SmlcReport {
	private static final Logger logger = LogManager.getLogger(SmlcReport.class);

	/**
	 * PhÆ°Æ¡ng thá»©c nÃ y cho phÃ©p xá»­ lÃ½ file jasper.
	 * 
	 * @throws IOException
	 * @param nameTemplate    tÃªn máº«u
	 * @param lstNameTemplate chá»‰ dÃ¹ng cho cas
	 */
	public String ProcessReport(int userid, String nameTemplate, String fileType, int ip1, int ip2, int ip3, String sp1,
			String sp2, String sp3) {

		logger.info("Read config file.");
		ReadConfig rc = new ReadConfig();
		String sourcePath;
		String finalPath = "";

		Date date = Calendar.getInstance().getTime();
		DateFormat dateFormat = new SimpleDateFormat("yyyymmdd-hhmmss");
		DateFormat dateFormatLog = new SimpleDateFormat("yyyy-mm-dd");
		String strDate = dateFormat.format(date);
		String strDateLog = dateFormatLog.format(date);
		Properties prop = new Properties();
		try {
			prop = rc.loadConfig();
		} catch (IOException e1) {
		}
		try {
			sourcePath = prop.getProperty("path_tempate");
			logger.info("sourcePath = " + sourcePath);
			finalPath = prop.getProperty("path_final");
			logger.info("finalPath = " + finalPath);
			List<String> lstFile = new FindFile().findFile(sourcePath, nameTemplate);

			// template
			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("user_id", userid);
			parameters.put("ip1", ip1);
			parameters.put("ip2", ip2);
			parameters.put("ip3", ip3);
			parameters.put("sp1", sp1);
			parameters.put("sp2", sp2);
			parameters.put("sp3", sp3);

			List lst = new ArrayList();
			for (int i = 0; i < lstFile.size(); i++) {
				JasperReport jasperReport = null;
				try {
					jasperReport = JasperCompileManager.compileReport(sourcePath + lstFile.get(i));
					logger.debug("Compile success, file: " + lstFile.get(i));
				} catch (Exception e) {
					logger.error("Compile error, file: " + lstFile.get(i));
					logger.error("ERROR", e);
					return "Compile error, file: " + lstFile.get(i);
				}
				Connection conn = ConnectionUtils.getConnection();
				JasperPrint print = null;
				try {
					print = JasperFillManager.fillReport(jasperReport, parameters, conn);
					lst.add(print);
					logger.info("Fill report success, file: " + lstFile.get(i));
				} catch (Exception e) {
					e.printStackTrace();
					logger.error("Fill report error, file: " + lstFile.get(i));
					logger.error(e.getMessage());
					return "Fill report error, file: " + lstFile.get(i);
				} finally {
					conn.close();
				}
			}

			switch (fileType) {
			case "DOCX":
				try {
					JRDocxExporter exporterDocx = new JRDocxExporter();
					exporterDocx.setParameter(JRExporterParameter.JASPER_PRINT_LIST, lst);
					exporterDocx.setParameter(JRExporterParameter.START_PAGE_INDEX, 0);
					exporterDocx.setParameter(JRExporterParameter.OUTPUT_FILE_NAME,
							finalPath + nameTemplate + "-" + strDate + "_final.docx");
					exporterDocx.exportReport();
				} catch (Exception e) {
					logger.error("Error when export to file DOCX");
					logger.error(e.getMessage());
					return "Error when export to file DOCX";
				}
				break;
			case "PDF":
				try {
					JRPdfExporter exporter = new JRPdfExporter();
					exporter.setParameter(JRPdfExporterParameter.JASPER_PRINT_LIST, lst);
					exporter.setParameter(JRPdfExporterParameter.START_PAGE_INDEX, 0);
					exporter.setParameter(JRPdfExporterParameter.OUTPUT_FILE_NAME,
							finalPath + nameTemplate + "-" + strDate + "_final.pdf");
					exporter.exportReport();
				} catch (Exception e) {
					logger.error("Error when export to file PDF");
					logger.error(e.getMessage());
					e.printStackTrace();
					return "Error when export to file PDF";
				}
				break;

			case "XLS":
				try {
					JRXlsExporter exporter = new JRXlsExporter();
					exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
					exporter.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE, Boolean.TRUE);
					exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.TRUE);
					exporter.setParameter(JRExporterParameter.JASPER_PRINT_LIST, lst);
					exporter.setParameter(JRXlsExporterParameter.MAXIMUM_ROWS_PER_SHEET, 1000);
					exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, true);
					exporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME,
							finalPath + nameTemplate + "-" + strDate + "_final.xls");
					exporter.exportReport();
				} catch (Exception e) {
					logger.error("Cann't export to XLXS file.");
					logger.error("ERROR", e);
				}
				break;

			case "XML":
				try {
					JRExporter exporter = new JRXmlExporter();
					exporter.setParameter(JRXmlExporterParameter.JASPER_PRINT_LIST, lst);
					exporter.setParameter(JRXmlExporterParameter.OUTPUT_FILE_NAME,
							finalPath + nameTemplate + "-" + strDate + "_final.xml");
					exporter.exportReport();
				} catch (Exception e) {
					logger.error("Cann't export to XML file.");
					logger.error("ERROR", e);
				}
				break;
			}
		} catch (Exception e) {
			logger.error("There was an error when run program in system.");
			logger.error("ERROR", e);
			e.printStackTrace();
			return "There was an error when run program in system.";
		}

		return finalPath + nameTemplate + "-" + strDate + "_final." + fileType.toLowerCase();
	}
}
