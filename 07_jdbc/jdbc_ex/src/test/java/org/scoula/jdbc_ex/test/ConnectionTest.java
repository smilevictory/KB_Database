package org.scoula.jdbc_ex.test;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.scoula.jdbc_ex.common.JDBCUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;

public class ConnectionTest {

    @Test
    @DisplayName("db 접속 테스트")
    public void testConnection() throws ClassNotFoundException,SQLException{
        Connection conn = null;
        PreparedStatement PS = null;
        Class.forName("com.mysql.cj.jdbc.Driver");

        String url = "jdbc:mysql://127.0.0.1:3306/jdbc_ex";
        String id = "scoula";
        String password="1234";

        conn = DriverManager.getConnection(url, id, password);

        Assertions.assertNotNull(conn);
    }
    @Test
    public void testConnection2() throws ClassNotFoundException {
        Connection conn = JDBCUtil.getConnection();
        Assertions.assertNull(conn);
        JDBCUtil.close();

    }
}
