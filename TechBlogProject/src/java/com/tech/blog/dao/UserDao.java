// This java code is to interact with Database

package com.tech.blog.dao;
import com.tech.blog.entites.User;
import java.sql.*;
public class UserDao {
    private Connection con;
    
    public UserDao(Connection con)
    {
        this.con=con;
    }
    
    //Method to insert data in database
    
    public boolean SaveUser(User user)
    {
        boolean b=false;
        try
        {
            String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?);";
            PreparedStatement psmt=this.con.prepareStatement(query);
            psmt.setString(1,user.getName());
            psmt.setString(2,user.getEmail());
            psmt.setString(3,user.getPassword());
            psmt.setString(4,user.getGender());
            psmt.setString(5,user.getAbout());
            psmt.executeUpdate();
            b=true;
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return b;
    }
    
    
    //Method to fetch the data from the database and store it in user with respect to the inserted email and password
    
    public User getUserByEmailAndPassword(String email,String password)
    {
        User user=null;
        
        try
        {
         
            String q="select * from user where email=? and password=?;";
            PreparedStatement psmt=con.prepareStatement(q);
            psmt.setString(1, email);
            psmt.setString(2,password);
            ResultSet rs=psmt.executeQuery();
            if(rs.next())
            {
                user=new User();
//                fetch the data from the database according to the email id 
                String name=rs.getString("name");
//                Store the data in the object of user details
                user.setName(name);
                
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setProfile(rs.getString("profile"));
                
            }
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        return user;
    }
    
    
    public boolean UpdateUser(User user)
    {
        boolean f=false;
        try
        {
            String q="update user set name=? ,email=? , password=?, about=? where id=? ";
            PreparedStatement psmt=con.prepareStatement(q);
            
            psmt.setString(1, user.getName());
            psmt.setString(2, user.getEmail());
            psmt.setString(3, user.getPassword());
            psmt.setString(4, user.getAbout());
            psmt.setInt(5, user.getId());
            psmt.executeUpdate();
            f=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
    public User getUserbyUserid(int uid){
        User u=null;
       
        try{
             String q="select * from user where id=?";
        PreparedStatement psmt=this.con.prepareStatement(q);
        psmt.setInt(1, uid);     
        ResultSet rs=psmt.executeQuery();
        if(rs.next()){
            u=new User();
            String name=rs.getString("name");
//            u.setName(name);
                u.setName(rs.getString("name"));            
                u.setId(rs.getInt("id"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setGender(rs.getString("gender"));
                u.setAbout(rs.getString("about"));
                u.setProfile(rs.getString("profile"));
            
        }
        }catch(Exception e){
            e.printStackTrace();
        }    
        
return u;
    }
}
