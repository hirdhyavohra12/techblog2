
package com.tech.blog.dao;
import java.sql.*;
public class LikeDao {
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    public boolean insertLike(int pid,int uid){
        boolean f=false;
        try{
            String q="insert into likepost(pid,uid) values(?,?);";
            PreparedStatement psmt=this.con.prepareStatement(q);
            psmt.setInt(1, pid);
            psmt.setInt(2, uid);
            psmt.executeUpdate();
            f=true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    public int countLikesOnPost(int pid){
        int count=0;
        String q="select count(*) from likepost where pid=?;";
        try{
            
        PreparedStatement psmt=this.con.prepareStatement(q);
        psmt.setInt(1,pid);
        ResultSet rs=psmt.executeQuery();
        if(rs.next()){
            count=rs.getInt("count(*)");
        }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return count;
        
    }
    
    public boolean isLikedByUser(int pid,int uid){
        boolean b=false;
        
        try{
            String q="select * from likepost where pid=? and uid=? ;";
            PreparedStatement psmt=this.con.prepareStatement(q);
            psmt.setInt(1,pid);
            psmt.setInt(2,uid);
            ResultSet rs=psmt.executeQuery();
            if(rs.next()){
                b=true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return b;
    }
    
    public boolean deleteLike(int pid,int uid){
        boolean b=false;
        try{
            String q="delete from likepost where pid=? and uid=?;";
            PreparedStatement psmt=this.con.prepareStatement(q);
            psmt.setInt(1, pid);
            psmt.setInt(2, uid);
            psmt.executeUpdate();
            b=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return b;
    }
    
}
