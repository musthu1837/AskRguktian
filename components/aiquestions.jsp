<%-- 
    Document   : aiquestions
    Created on : Oct 27, 2018, 3:29:13 PM
    Author     : RGUKT
--%>

<%@page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
        try{  
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection(  
            "jdbc:mysql://localhost:3306/askrguktian","root","");       
            PreparedStatement stmt=con.prepareStatement("select * from questions where scode=?");
            stmt.setString(1,"AI");
            ResultSet rs = stmt.executeQuery();
            String s ="";
            if(rs.next()){  
                rs.previous();
                while(rs.next()){
                    s+= rs.getString(2)+"$"+rs.getString(4)+"$"+rs.getString(6)+"$"+rs.getString(7);
                    s+="\n";
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
