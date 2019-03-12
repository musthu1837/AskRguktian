<%-- 
    Document   : newjsp
    Created on : Oct 25, 2018, 8:55:59 PM
    Author     : RGUKT
--%>

<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>CSE</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.3/semantic.min.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
         <script src="../../js/daa.js">

        </script>
        <script>
            $(document).ready(function (){
                $("#about").click(function (){
                   $("#aboutcard").toggle("slow");
                });
                $("#aboutcancel").click(function (){
                   $("#aboutcard").toggle("slow");
                });
            });           
        </script>        
    </head>
    <body>
        <div style="margin-left: 150px;margin-top: 90px">
            <div class='ui top fixed labeled mini icon menu' style="height:60px">
                <a class='active item'>
                    <i aria-hidden='true' class='gamepad icon'></i>
                    Games
                </a>
                <p style='margin-left:40px;margin-top:10px;font-size:25px;font-family:san-serif;'>Design & Analysis of Algorithms</p>
                <div class="ui right floated labeled mini icon menu">               
                    <div class='ui huge icon input' style="width:300px;margin-right: 10px;height: 40px;margin-top: 10px;margin-left: 10px">
                        <input type='text' placeholder='Search...' />
                        <i aria-hidden='true' class='search icon' style="color: #0066ff"></i>
                    </div>
                    <%
                        if(session.getAttribute("fname") == null){
                            out.print("<a class='item' href='../../signup.jsp'><i aria-hidden='true' class='user add icon' style='color: #0066ff'></i><b>Sign UP</b></a>");
                            out.print("<a class='item' href='../../login.jsp' style='border-right: 1px solid #f0f0f5'><i aria-hidden='true' class='user circle icon' style='color: #0066ff'></i><b>Login</b></a>");
                        }
                    %>
                    <%
                        if(session.getAttribute("fname") != null){
                            out.print("<a class='item' href='../../logout.jsp' style='border-right: 1px solid #f0f0f5' id='logout'><i aria-hidden='true' class='user circle icon' style='color: #0066ff'></i><b>Logout</b></a>");
                        }
                    %>  
                    <a class='item' id="about">
                        <i aria-hidden='true' class='question circle icon' style="color: #0066ff"></i>
                        <b>About</b>
                    </a>
                </div>
            </div>
            <div class='ui left fixed vertical labeled tiny icon menu' style='width: 70px'>
                <a class='active item' style="width: 50px;height: 60px;" href="../../">
                    <i aria-hidden='true' class='home icon' style="color: #0066ff"></i>
                    <b>Home</b>
                </a>

                <a id="EEE" class='item' style="width: 50px" title="Electrical engineering">
                    <i aria-hidden='true' class='lightbulb outline icon' style="color: #0066ff"></i>
                    <b>EEE</b>               
                </a>
                <a id="ECE" class='item' style="width: 50px" title="Electronics & Communication engineering">
                    <i aria-hidden='true' class='microchip icon' style="color: #0066ff"></i>
                    <b>ECE</b>             
                </a>
                <a href="./" id="CSE" class='item' style="width: 50px" title="Computer Science & engineering">
                    <i aria-hidden='true' class='computer icon' style="color: #0066ff"></i>
                    <b>CSE</b>                
                </a>
                <a id="MECH" class='item' style="width: 50px" title="Mechanical engineering">
                    <i aria-hidden='true' class='cogs icon' style="color: #0066ff"></i>
                    <b>MECH</b>                
                </a>
                <a id="CVL" class='item' style="width: 50px" title="Civil engineering">
                    <i aria-hidden='true' class='building outline icon' style="color: #0066ff"></i>
                    <b>CE</b>                
                </a>
                <a id="CE" class='item' style="width: 50px" title="Chemical engineering">
                    <i aria-hidden='true' class='flask icon' style="color: #0066ff"></i>
                    <b>CHE</b>                
                </a>
                <a id="MME" class='item' style="width: 50px" title="Materials & Metallurgical engineering">
                    <i aria-hidden='true' class='dot circle icon' style="color: #0066ff"></i>
                    <b>MME</b>                
                </a>
                <a class='item' style="width: 50px">
                </a>
            </div>
            <div class='ui divided two column grid' style="margin-top: -50px">
              <div class='stretched row'>
                <div class='ten wide column'>
                    <div class='ui fluid card' style="margin-top: 0px" id="fluidcard">
                    <%  
                            try{  
                                Class.forName("com.mysql.jdbc.Driver");  
                                Connection con=DriverManager.getConnection(  
                                "jdbc:mysql://localhost:3306/askrguktian","root","");       
                                PreparedStatement stmt=con.prepareStatement("select * from questions where scode=? order by postedtime desc");
                                stmt.setString(1,"DAA");
                                ResultSet rs = stmt.executeQuery();
                                String s ="";
                                long seconds = TimeUnit.MILLISECONDS.toSeconds(System.currentTimeMillis());
                                if(rs.next()){  
                                    rs.previous();
                                    while(rs.next()){
                                        long ctime =seconds-Long.parseLong(rs.getString(5));
                                        PreparedStatement stmt1=con.prepareStatement("select count(id) from comments where questionid = ?");
                                        stmt1.setString(1,rs.getString(1));
                                        ResultSet rs1 = stmt1.executeQuery();
                                        PreparedStatement stmt2=con.prepareStatement("select * from likes where questionid = ? and username=?");
                                        stmt2.setString(1,rs.getString(1));
                                        stmt2.setString(2, session.getAttribute("username")+"");
                                        ResultSet rs2 = stmt2.executeQuery();                                        
                                        rs1.next();
                                        out.print("<div class='content' style='max-height:auto' ><div class='header'><a id="+rs.getString(2)+">"+rs.getString(2)+"</a><div class='ui label' style='float: right'><a href='./'>CSE</a></div><div class='ui label' style='float: right'><a href='./daa.jsp'>DAA</a></div></div>");
                                        out.print("<div class='meta' style='margin-top:0px'>posted by <a><u>"+rs.getString(3)+"</u></a></div>");
                                        out.print("<div class='description'>");
                                            out.print("<div class='ui label' name='maincomment' style='cursor:pointer'>Comments<div class='detail'>"+rs1.getString(1)+"</div></div>");                   
                                            if(rs2.next())
                                                out.print("<div class='ui label' name='mainlike' style='cursor:pointer'><i class='thumbs up icon' style='color:blue'></i><div class='detail'>"+rs.getString(7)+"</div></div>");
                                            else
                                                out.print("<div class='ui label' name='mainlike' style='cursor:pointer'><i class='thumbs up icon'></i><div class='detail'>"+rs.getString(7)+"</div></div>");
                                            out.print("<div class='ui label' name='maindislike' style='cursor:pointer;display:none'><i class='thumbs down icon'></i><div class='detail'>"+rs.getString(8)+"</div></div>");
                                            if(ctime>60){
                                                if(ctime/60>60){
                                                    if(ctime/60/60>24){
                                                        out.print("<div class='ui label'>"+ctime/60/60/24+" days ago<div class='detail'><i class='time icon'></i></div></div>");
                                                    }   
                                                    else{
                                                        out.print("<div class='ui label'>"+ctime/60/60+" hours ago<div class='detail'><i class='time icon'></i></div></div>");
                                                    }
                                                }
                                                else{
                                                    out.print("<div class='ui label'>"+ctime/60+" minutes ago<div class='detail'><i class='time icon'></i></div></div>");
                                                }
                                                
                                            }
                                            else{out.print("<div class='ui label'>just now <div class='detail'><i class='time icon'></i></div></div>");                                              
                                            }
                                                out.print("<div class='ui comments' id='"+rs.getString(1)+"' style='border-left:2px solid grey;display:none;margin-left:30px;max-height:300px; overflow-y: scroll'>");                                                   
                                                out.print("</div>");                                                
                                            out.print("</div>");                                               
                                        out.print("</div>");                                          
                                    }
                                    response.getWriter().write(s);
                                }       
                                else{
                                    response.getWriter().write("no result");
                                    con.close();
                                }
                            }
                            catch(Exception e){ 
                                response.setContentType("text/plain");
                                response.getWriter().write("unable");
                            }
                    %>                        
                    <div class="content">
                        <form class="ui form" id="questionform">
                            <div class="field">
                                <textarea placeholder="Question ..." cols="7" id="answer"></textarea><br/><br/>
                                <button type="submit" class="ui medium icon right labeled disabled primary button">
                                    Post
                                    <i class="send icon"> </i>
                                </button>
                            </div>                            
                        </form>
                    </div>
                    </div>
                    <div class="extra content">
                        found 
                        <%
                           try{  
                                Class.forName("com.mysql.jdbc.Driver");  
                                Connection con=DriverManager.getConnection(  
                                "jdbc:mysql://localhost:3306/askrguktian","root","");       
                                PreparedStatement stmt=con.prepareStatement("select count(id) from questions where scode=?");
                                stmt.setString(1,"DAA");
                                ResultSet rs = stmt.executeQuery();
                                if(rs.next()){  
                                    out.print(rs.getString(1));
                                }
                           }    
                            catch(Exception e){
                                  out.print(e);
                             }                           
                        %> requests.
                    </div>
                </div>
                <div class='five wide column'>
                    <div class='ui fluid card' style="max-height: 500px; overflow-y: scroll">
                        <div class="content">
                            <div class="header">
                                Recents...
                                <i style='float: right;color:orange' class="time icon"></i>                                
                            </div>
                            <div class="meta">Subject wise (CSE)</div>
                        </div>                                                    
                        <%
                           try{  
                                Class.forName("com.mysql.jdbc.Driver");  
                                Connection con=DriverManager.getConnection(  
                                "jdbc:mysql://localhost:3306/askrguktian","root","");       
                                Statement stmt=con.createStatement();
                                ResultSet rs = stmt.executeQuery("select * from questions where postedtime in (select max(postedtime) from questions GROUP by scode);");
                                while(rs.next()){
                                    String time="";
                                    long seconds = TimeUnit.MILLISECONDS.toSeconds(System.currentTimeMillis());
                                    long ctime =seconds-Long.parseLong(rs.getString(5));
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
                                    out.print("<div class='content'>");
                                        out.print("<div class='header' style='display: inline-block'><a style='color:black'>"+rs.getString(2)+"</a></div><br/>");
                                        out.print("<div class='ui label' style='float:right;margin-top:5px'>"+rs.getString(6));
                                        out.print("</div>");
                                        out.print("<div class='ui label' style='float:right;margin-top:5px'>"+time);
                                            out.print("<div class='detail'><i class='time icon'></i></div>");
                                        out.print("</div>");
                                    out.print("</div>");
                                }
                           }    
                            catch(Exception e){
                                  out.print(e);
                             }                           
                        %>
                    </div>
                    <div class='ui fluid card' style="max-height: 500px; overflow-y: scroll">
                        <div class="content">
                            <div class="header">
                                Most liked question..
                                <i style='float: right;color: orange' class="thumbs up icon"></i>
                            </div>
                            <div class="meta">Subject wise (CSE)</div>
                        </div>
                        <%
                           try{  
                                Class.forName("com.mysql.jdbc.Driver");  
                                Connection con=DriverManager.getConnection(  
                                "jdbc:mysql://localhost:3306/askrguktian","root","");       
                                Statement stmt=con.createStatement();
                                ResultSet rs = stmt.executeQuery("SELECT * FROM questions as a,(select scode,max(likes) as maximum from questions GROUP BY scode) as b WHERE a.scode=b.scode and b.maximum=a.likes");
                                while(rs.next()){                                   
                                    out.print("<div class='content'>");
                                        out.print("<div class='header' style='display: inline-block'><a style='color:black'>"+rs.getString(2)+"</a></div><br/>");
                                        out.print("<div class='ui label' style='float:right;margin-top:5px'>"+rs.getString(6));
                                        out.print("</div>");
                                        out.print("<div class='ui label' style='float:right;margin-top:5px'>Likes");
                                            out.print("<div class='detail'>"+rs.getString(7)+"</div>");
                                        out.print("</div>");
                                    out.print("</div>");
                                }
                           }    
                            catch(Exception e){
                                  out.print(e);
                             }                           
                        %>
                    </div>                        
                </div>
              </div>
            </div><br/><br/><br/><br/>
            <div class="ui card" id="aboutcard" style="display: none;width: 700px;height: 450px;position: fixed;background-color: #f2f2f2;top:80px;left:290px;border-radius: 10px">
                <div class="content">
                    <div class="header"> About Developers <i id="aboutcancel" class="cancel icon" style="float: right;cursor: pointer"></i></div>
                     <div class="description" style="margin-top: 20px">
                         <div class="ui cards">
                             <div class='ui mini card' style="width:200px">
                                 <img src='../../images/Muneer.jpg' class='ui image' width="500" height="200" style="border-radius: 15px"/>
                              <div class='content'>
                                <div class='header'>Musthafa</div>
                                <div class='meta'>Developer</div>
                                <div class='description'>

                                </div>
                              </div>
                              <div class='extra content'>
                                <a>
                                    9640932548
                                    <i style="float:right" aria-hidden='true' class='phone square icon'></i>
                                </a>
                              </div>
                            </div>
                             <div class='ui mini card' style="width:200px">
                                 <img src='../../images/Muneer.jpg' class='ui image' width="500" height="200" style="border-radius: 15px"/>
                              <div class='content'>
                                <div class='header'>Musthafa</div>
                                <div class='meta'>Developer</div>
                                <div class='description'>

                                </div>
                              </div>
                              <div class='extra content'>
                                <a>
                                    9640932548
                                    <i style="float:right" aria-hidden='true' class='phone square icon'></i>
                                </a>
                              </div>
                            </div> 
                             <div class='ui mini card' style="width:200px">
                                 <img src='../../images/Muneer.jpg' class='ui image' width="500" height="200" style="border-radius: 15px"/>
                              <div class='content'>
                                <div class='header'>Musthafa</div>
                                <div class='meta'>Developer</div>
                                <div class='description'>

                                </div>
                              </div>
                              <div class='extra content'>
                                <a>
                                    9640932548
                                    <i style="float:right" aria-hidden='true' class='phone square icon'></i>
                                </a>
                              </div>
                            </div> 
                         </div>
                     </div>
                 </div>
                <div class="extra content">
                    You can mail suggestions to <span style="float: right;font-weight: bold">musthu1837@gmail.com</span> <i class="mail icon" style="float: right"></i> 
                </div>
             </div>
            <div class="ui bottom fixed menu">
                <center>
                <div class="item" style="margin-left: 400px">
                    <b>Copyright © 2018 Copyright - RGUKT Basar. All rights reserved.</b>
                </div>
                </center>
                <p id="username" style="display: none"><%out.print(session.getAttribute("username"));%></p>
            </div>
        </div>
    </body>
</html>
