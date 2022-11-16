/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package library;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DbConfig {

    public static Connection connect() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");        
        final String URL = "jdbc:mysql://localhost/library";
        final String USER = "root";
        final String PWD = "pass@word1";
        Connection con = DriverManager.getConnection(URL, USER, PWD);
        return con;
    }

    public static String generateStudentId() throws Exception {
        int lastid=getLastId();
        return String.format("Student%03d",lastid);
    }
    
    public static int getLastId() throws Exception {
        Connection con = connect();
        ResultSet rs = con.createStatement().executeQuery("select max(id) from students");
        rs.next();
        int lastid=rs.getInt(1);
        con.close();
        return lastid;
    }


    public static int countRecords(String table) throws Exception {
        Connection con = connect();
        ResultSet rs = con.createStatement().executeQuery("select count(*) from "+table);
        rs.next();
        int cnt = rs.getInt(1);
        con.close();
        return cnt;
    }


    public static String formatDate(String date) throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String target = new SimpleDateFormat("dd-MMM-yyyy").format(sdf.parse(date));
        return target;
    }
    
    public static String today() throws Exception {        
        String target = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        return target;
    }
}
