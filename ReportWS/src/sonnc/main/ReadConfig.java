package sonnc.main;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ReadConfig {

	public Properties loadConfig() throws IOException {
		String pathFile = loadConfigFile().getProperty("path");
		InputStream inputStream = new FileInputStream(pathFile+"config.properties");
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
		
		return prop;

	}
	
	public Properties loadConfigFile() throws IOException {
		InputStream inputStream = null;
		Properties prop = new Properties();
		try {
			String propFileName = "configFile.properties";
			inputStream = getClass().getClassLoader().getResourceAsStream(propFileName);
			if (inputStream != null) {
				prop.load(inputStream);
			} else {
				throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
			}
			// get the property value and print it out
		} catch (Exception e) {
//			System.out.println("Exception: " + e);
		} finally {
			inputStream.close();
		}
		return prop;

	}
}
