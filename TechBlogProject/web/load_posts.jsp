<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="com.tech.blog.dao.LikeDao" %>
<%@page import="com.tech.blog.entites.Post" %>
<%@page import="com.tech.blog.entites.User" %>
<%@page import="com.tech.blog.helper.ConnectionHelper" %>
<%@page import="java.util.*" %>


<div class="row">

    <%
        User uu=(User)session.getAttribute("current_user");
        Thread.sleep(1000);
    List<Post> post=null;
        int cid=Integer.parseInt(request.getParameter("catID"));         
    PostDao p=new PostDao(ConnectionHelper.getConnection());
    if(cid==0)
    {
     post=p.getAllPosts();
    }
    else
    {
        post=p.getPostByCatId(cid);
    }
    
    if(post.size()==0)
    {
    out.println("<h2 class='display-3 text-center'>No post in this Category till now...</h2>");
    return;
    }

    for(Post ps:post)
    {


    %>

    <div class="col-md-6  mt-2">
        <div class="card">
            <div class="card-body">
                <img class="card-image-top" src="images/idea2.jpg" style="height:150px ;width:300px">
                <b> <%= ps.getpTitle() %></b>
                <p> <%= ps.getpContent() %></p>
            </div>
            <div class="card-footer text-center bg-dark">
                
                <a href="show_blog_page.jsp?pid=<%=ps.getPid()%>" class="btn btn-small btn-secondary">Read more</a>
                
            </div>
        </div>

    </div>

    <%
    
    
    }

    %>
    
    

</div>