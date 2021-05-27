package sonnc.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import sonnc.main.ReadConfig;

public class OracleConnUtils {

	private static final Logger logger = LogManager.getLogger(OracleConnUtils.class);

	public static Connection getOracleConnection() throws ClassNotFoundException, SQLException {
		ReadConfig rc = new ReadConfig();
		String serverport = "";
		String userName = "";
		String password = "";
		try {
			serverport = rc.loadConfig().getProperty("serverport");
			userName = rc.loadConfig().getProperty("username");
			password = rc.loadConfig().getProperty("password");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return getOracleConnection(serverport, userName, password);
	}

	public static Connection getOracleConnection(String serverport, String userName, String password)
			throws ClassNotFoundException, SQLException {

		 Class.forName("com.mysql.jdbc.Driver");
		 System.out.println(serverport+userName+password);
		 Connection conn = DriverManager.getConnection(serverport, userName,
		 password);
		return conn;
	}
}