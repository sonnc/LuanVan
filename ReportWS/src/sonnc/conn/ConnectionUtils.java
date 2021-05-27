package sonnc.conn;

import java.sql.Connection;
import java.sql.SQLException;
 
public class ConnectionUtils {
 
    public static Connection getConnection() throws SQLException,
            ClassNotFoundException {
        return MySQLConnUtils.getMySQLConnection();
    }

}

