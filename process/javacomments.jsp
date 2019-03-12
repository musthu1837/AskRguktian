<%-- 
    Document   : forgot.jsp
    Created on : Oct 23, 2018, 5:47:13 PM
    Author     : M
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{  
        Class.forName("com.mysql.jdbc.Driver");  
        Connection con=DriverManager.getConnection(  
        "jdbc:mysql://localhost:3306/askrguktian","root","");
        if(request.getParameter("require").equals("comments")){
            PreparedStatement stmt=con.prepareStatement("select * from comments where questionid = ? order by postedtime desc");
            stmt.setString(1,request.getParameter("id"));
            ResultSet rs = stmt.executeQuery();
            String s="";
            if(rs.next()){
                rs.previous();
                while(rs.next()){
                    String time="";
                    long seconds = TimeUnit.MILLISECONDS.toSeconds(System.currentTimeMillis());
                    long ctime =seconds-Long.parseLong(rs.getString(3));
                        if(ctime>60){
                            if(ctime/60>60){
                                if(ctime/60/60>24){
                                   time=(ctime/60/60/24)+" days ago";
                                }   
                                else{
                                    time=(ctime/60/60)+" hours ago";
                                }
                            }
                            else{
                                time=(ctime/60)+" minutes ago";
                            }

                        }
                        else{
                            time = "just now";
                        }
                    s+=rs.getString(1)+"$"+rs.getString(2)+"$"+time+"$"+rs.getString(4)+"$"+rs.getString(5)+"$"+rs.getString(6)+"$"+rs.getString(7);
                    s+="%";
                }
                response.setContentType("text/plain");
                response.getWriter().write(s);
            }       
            else{
                response.setContentType("text/plain");
                response.getWriter().write("failure");             
            }
        }
        else if(request.getParameter("require").equals("commentscount")){
            PreparedStatement stmt=con.prepareStatement("select count(id) from comments where questionid = ?");
            stmt.setString(1,request.getParameter("id"));
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                response.setContentType("text/plain");
                response.getWriter().write(rs.getString(1));             
            }       
            else{
                response.setContentType("text/plain");
                response.getWriter().write("failure");             
            }            
        }
        else if(request.getParameter("require").equals("add")){
            PreparedStatement stmt=con.prepareStatement("insert into comments (comment,username,questionid,likes,dislikes,postedtime) values (?,?,?,?,?,?)");
            stmt.setString(1,request.getParameter("comment"));
            stmt.setString(2,request.getParameter("user"));
            stmt.setInt(3,Integer.parseInt(request.getParameter("id")));
            stmt.setInt(4,0);
            stmt.setInt(5,0);
            stmt.setString(6, TimeUnit.MILLISECONDS.toSeconds(System.currentTimeMillis())+"");
            int i =stmt.executeUpdate();
            response.setContentType("text/plain");
            response.getWriter().write("sucess");            
        }
        else if(request.getParameter("require").equals("like")){
            long likes = Integer.parseInt(request.getParameter("likes"))+1;
            PreparedStatement stmt=con.prepareStatement("insert into likes (username,questionid) values (?,?)");
            stmt.setString(1,request.getParameter("username"));
            stmt.setString(2,request.getParameter("questionid"));
            int i =stmt.executeUpdate();
            PreparedStatement stmt1=con.prepareStatement("update questions set likes=? where id=?");
            stmt1.setLong(1,likes);
            stmt1.setString(2,request.getParameter("questionid"));  
            int i2 =stmt1.executeUpdate();
            response.setContentType("text/plain");           
            response.getWriter().write("sucess");            
        }
        else if(request.getParameter("require").equals("dislike")){
            long likes = Integer.parseInt(request.getParameter("likes"))-1;
            PreparedStatement stmt=con.prepareStatement("delete from likes where username=? and questionid=?");
            stmt.setString(1,request.getParameter("username"));
            stmt.setInt(2,Integer.parseInt(request.getParameter("questionid")));
            int i =stmt.executeUpdate();
            PreparedStatement stmt1=con.prepareStatement("update questions set likes=? where id=?");
            stmt1.setLong(1,likes);
            stmt1.setInt(2,Integer.parseInt(request.getParameter("questionid")));  
            int i2 =stmt1.executeUpdate();          
            response.setContentType("text/plain");
            response.getWriter().write("delete from likes where username="+request.getParameter("username")+" and id="+Integer.parseInt(request.getParameter("questionid")));            
        } 
        else if(request.getParameter("require").equals("post")){
            Date now = new Date();
            String pattern = "yyyy-MM-dd";
            SimpleDateFormat formatter = new SimpleDateFormat(pattern);
            String mysqlDateString = formatter.format(now);            
            PreparedStatement stmt=con.prepareStatement("insert into questions (question,username,comments,postedtime,scode,likes,dislikes,posteddate) values (?,?,?,?,?,?,?,?)");
            stmt.setString(1,request.getParameter("question"));
            stmt.setString(2,request.getParameter("username"));            
            stmt.setInt(3,0);
            stmt.setString(4,TimeUnit.MILLISECONDS.toSeconds(System.currentTimeMillis())+"" );
            stmt.setString(5,"JAVA");
            stmt.setInt(6,0);
            stmt.setInt(7,0);
            stmt.setString(8,mysqlDateString );
            int i =stmt.executeUpdate();
            response.setContentType("text/plain");
            response.getWriter().write("sucess");            
        }
        else if(request.getParameter("require").equals("replay")){
            PreparedStatement stmt1=con.prepareStatement("select count(id) from replay where commentid = ?");
            stmt1.setString(1,request.getParameter("id"));
            ResultSet rs1 = stmt1.executeQuery();
            PreparedStatement stmt=con.prepareStatement("select likes from comments where id= ?");
            stmt.setString(1,request.getParameter("id"));
            ResultSet rs = stmt.executeQuery();            
            PreparedStatement stmt2=con.prepareStatement("select * from replay where commentid = ? order by postedtime desc");
            stmt2.setString(1,request.getParameter("id"));
            ResultSet rs2 = stmt2.executeQuery();
            String s= "";
            if(rs1.next() && rs.next()){
                rs2.previous();
                s+=rs1.getString(1)+"$"+rs.getString(1)+"\n";
                while(rs2.next()){
                    String time="";
                    long seconds = TimeUnit.MILLISECONDS.toSeconds(System.currentTimeMillis());
                    long ctime =seconds-Long.parseLong(rs2.getString(3));
                        if(ctime>60){
                            if(ctime/60>60){
                                if(ctime/60/60>24){
                                   time=(ctime/60/60/24)+" days ago";
                                }   
                                else{
                                    time=(ctime/60/60)+" hours ago";
                                }
                            }
                            else{
                                time=(ctime/60)+" minutes ago";
                            }

                        }
                        else{
                            time = "just now";
                        }                    
                    s+=rs2.getString(1)+"$"+rs2.getString(2)+"$"+time+"$"+rs2.getString(4)+"$";
                    s+="\n";
                    
                }
            response.setContentType("text/plain");
            response.getWriter().write(s);               
            }
            else{
                response.setContentType("text/plain");
                response.getWriter().write("Noresultdfjdkj");                  
            }
        }
        con.close();
    }
    catch(Exception e){ 
        response.setContentType("text/plain");
        response.getWriter().write(e+"");           
    }     
%>