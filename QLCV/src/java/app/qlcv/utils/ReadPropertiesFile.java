/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.qlcv.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 *
 * @author sonng
 */
public class ReadPropertiesFile {

    public Properties ReadFile(String language) {
        Properties properties = new Properties();
        InputStream inputStream = null;
        try {
            String pathFile = null;
            if (language == null) {
                pathFile = "/resources/app_en.properties";
            } else {
                pathFile = "/resources/app_" + language.toLowerCase() + ".properties";
            }
            inputStream = ReadPropertiesFile.class.getClassLoader()
                    .getResourceAsStream(pathFile);

            properties.load(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // close objects
            try {
                if (inputStream != null) {
                    inputStream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return properties;
    }

    public Properties ReadConfig(String fileName) {
        Properties properties = new Properties();
        InputStream inputStream = null;
        try {
            String pathFile = null;
            pathFile = "/resources/"+fileName;
            System.out.println(pathFile);

            inputStream = ReadPropertiesFile.class.getClassLoader()
                    .getResourceAsStream(pathFile);

            properties.load(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            // close objects
            try {
                if (inputStream != null) {
                    inputStream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return properties;
    }
}
