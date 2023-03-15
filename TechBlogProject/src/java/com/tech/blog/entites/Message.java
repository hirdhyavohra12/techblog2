
package com.tech.blog.entites;


public class Message {
    private String content;
    private String type;
    private String cssClass;
    
    public Message(String content,String type,String cssClass)
    {
        this.content=content;
        this.type=type;
        this.cssClass=cssClass;
    }
    
    public void setContent(String content)
    {
        this.content=content;
    }
    public void setType(String type)
    {
        this.type=type;
    }
    public void setCSSClass(String cssClass)
    {
        this.cssClass=cssClass;
    }
    
    public String getContent()
    {
        return content;
    }
    public String getType()
    {
        return type;
    }
    public String getCSSClass()
    {
        return cssClass;
    }
}
