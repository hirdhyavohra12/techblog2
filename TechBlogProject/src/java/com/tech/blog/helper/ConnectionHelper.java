package com.tech.blog.helper;

import java.sql.*;

public class ConnectionHelper {

    private static Connection con;

    public static Connection getConnection() {
        try {
            if (con == null) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "Hvcreations@1228");
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return con;
    }

}
