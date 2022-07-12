package Config;
import java.sql.*;

public class DBConnection {
    public Connection open() {
        Connection con; // Object connection ke Database
        
        try {
            Class.forName("com.mysql.jdbc.Driver"); // Import JDBC Driver MySQL
            String url = "jdbc:mysql://127.0.0.1:3306/outfit_studio"; // URL dari Host Database
            con = DriverManager.getConnection(url, "root", ""); // Host, username, password
            return con;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}
