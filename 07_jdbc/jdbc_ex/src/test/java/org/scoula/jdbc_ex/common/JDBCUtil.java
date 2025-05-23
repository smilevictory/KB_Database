package org.scoula.jdbc_ex.common;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCUtil {

    static Connection conn = null;
    public static Connection getConnection() {

        if (conn != null) return conn;


        try {
            Properties prop = new Properties();
            prop.load(JDBCUtil.class.getResourceAsStream("application.properties"));



            String driver = prop.getProperty("driver");
            String url = prop.getProperty("url");
            String id = prop.getProperty("id");
            String password = prop.getProperty("password");

            Class.forName(driver);
            conn = DriverManager.getConnection(url,id,password);


        } catch (Exception e){
            e.printStackTrace();
        }
        return conn;
    }

    // 연결을 닫을때 사용하는 메서드
    public static void close(){
        try {
            if(conn != null){
                conn.close();
                conn = null;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

