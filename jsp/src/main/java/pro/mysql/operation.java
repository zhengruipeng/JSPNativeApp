package pro.mysql;
import java.sql.*;

public class operation {
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/database essential?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

    static final String USER = "root";
    static final String PWD = "";

    static private Connection conn = null;
    static private Statement stmt = null;
    static private ResultSet rs = null;

    static public void connect() throws ClassNotFoundException {
        try{
            Class.forName(JDBC_DRIVER);
            System.out.println("连接数据库...");
            conn = DriverManager.getConnection(DB_URL,USER,PWD);
        }catch(SQLException se){
            // 处理 JDBC 错误
            se.printStackTrace();
        }catch(Exception e){
            // 处理 Class.forName 错误
            e.printStackTrace();
        }
    }
    static public ResultSet select(String sql) throws SQLException {
        try{
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            return rs;
        }catch(SQLException se){
            // 处理 JDBC 错误
            se.printStackTrace();
            return null;
        }
    }
    static public int update(String sql) {
        int temp = 0;
        try {
            stmt = conn.createStatement();
            temp = stmt.executeUpdate(sql);

        } catch (SQLException se) {
            se.printStackTrace();
            System.out.println("sql语句执行错误！");
        }
        return temp;
    }

    static public boolean closeAllStatus() throws SQLException {
        try{
            if(rs != null) rs.close();
            if(stmt != null) stmt.close();
            if(conn != null) conn.close();
            return true;
        }catch (SQLException e){
            e.printStackTrace();
            return false;
        }
    }
}
