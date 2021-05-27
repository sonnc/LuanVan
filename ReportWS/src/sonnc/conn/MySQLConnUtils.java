package sonnc.conn;

	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.SQLException;

import sonnc.main.ReadConfig;
	 
	public class MySQLConnUtils {
	 
	
	 public static Connection getMySQLConnection() throws SQLException,
	         ClassNotFoundException {
		 ReadConfig rc = new ReadConfig();
			String serverport = "";
			String database = "";
			String userName = "";
			String password = "";
			try {
				serverport = rc.loadConfig().getProperty("serverport");
				userName = rc.loadConfig().getProperty("username");
				password = rc.loadConfig().getProperty("password");
				database = rc.loadConfig().getProperty("database");
			} catch (Exception e) {
				e.printStackTrace();
			}

	 
	     return getMySQLConnection(serverport, database, userName, password);
	 }
	 
	 public static Connection getMySQLConnection(String hostName, String dbName,
	         String userName, String password) throws SQLException,
	         ClassNotFoundException {
	     Class.forName("com.mysql.cj.jdbc.Driver");
	     String connectionURL = "jdbc:mysql://" + hostName + "/" + dbName;
	 
	     Connection conn = DriverManager.getConnection(connectionURL, userName,
	             password);
	     return conn;
	 }
}
