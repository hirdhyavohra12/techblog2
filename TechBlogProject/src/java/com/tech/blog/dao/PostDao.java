package com.tech.blog.dao;

import com.tech.blog.entites.Category;
import com.tech.blog.entites.Post;
import java.sql.Connection;
import java.util.ArrayList;
import java.sql.*;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getCategory() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            String q = "select * from categories";
            Statement stmt = this.con.createStatement();
            ResultSet re = stmt.executeQuery(q);
            while (re.next()) {
                int cid = re.getInt("cid");
                String name = re.getString("name");
                String description = re.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean savePost(Post p) {
        boolean f = false;
        try {

            String q = "insert into post(pTitle,pContent,pCode,catID,userId) values(?,?,?,?,?)";
            PreparedStatement psmt = con.prepareStatement(q);
            psmt.setString(1, p.getpTitle());
            psmt.setString(2, p.getpContent());
            psmt.setString(3, p.getpCode());
            psmt.setInt(4, p.getCatID());
            psmt.setInt(5, p.getUserId());
            psmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    // Get all Posts
    public List<Post> getAllPosts() {
        List<Post> l = new ArrayList<>();
        try {
            PreparedStatement psmt = con.prepareStatement("select * from post order by pid desc");
            ResultSet rs = psmt.executeQuery();
            while (rs.next()) {
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");
                int catid = rs.getInt("catID");
                int userid = rs.getInt("userId");
                Post p = new Post(pid, pTitle, pContent, pCode, catid, userid);
                l.add(p);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return l;
    }

    // Get the post according to the category
    public List<Post> getPostByCatId(int catId) {
        List<Post> l = new ArrayList<>();
        try {
            PreparedStatement psmt = con.prepareStatement("select * from post where catID=?");
            psmt.setInt(1, catId);
            ResultSet rs = psmt.executeQuery();
            while (rs.next()) {
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");

                int userid = rs.getInt("userId");
                Post p = new Post(pid, pTitle, pContent, pCode, catId, userid);
                l.add(p);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return l;

    }

    public Post getPostByPid(int pid) {
        Post p = null;
        String q = "select * from post where pid=?";
        try {
            PreparedStatement psmt = this.con.prepareStatement(q);
            psmt.setInt(1, pid);
            ResultSet rs=psmt.executeQuery();
            if(rs.next())
            {
                 int pid2 = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");

                int userid = rs.getInt("userId");
                int cid=rs.getInt("catID");
                p = new Post(pid, pTitle, pContent, pCode,cid, userid);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }
}
