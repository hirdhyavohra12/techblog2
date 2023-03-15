
package com.tech.blog.dao;

import java.sql.*;

public class Contact2 {
    private Connection con;
    public Contact2(Connection con){
        this.con=con;
    }
    
    public boolean saveContact(String names,String emails,String querys){
        
        boolean b=false;
        try{
            String q="insert into contact(name,email,query) values(?,?,?);";
            PreparedStatement psmt=this.con.prepareStatement(q);
            psmt.setString(1, names);
            psmt.setString(2,emails);
            psmt.setString(3,querys);
            psmt.executeUpdate();
            b=true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return b;
    }
    
}
