<%-- 
    Document   : index
    Created on : Oct 8, 2018, 5:16:36 PM
    Author     : RGUKT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(session.getAttribute("username") == null)    
        response.sendRedirect("login.jsp");
%>
<html>
    <head>
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.3/semantic.min.css"/>
        <title>Home
        </title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="./js/index.js">
        </script>
        <script>
            $(document).ready(function (){
               // window.console.log("dfjsdfjdi");
                $("#logout").click(function (){
                    alert("you have been logged out!!");
                });
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
    <div>
        <div class='ui top fixed labeled mini icon menu' style="height:60px">
            <a class='active item'>
                <i aria-hidden='true' class='gamepad icon'></i>
                Games
            </a>
            <p><% 
                    out.println("<p style='margin-left:40px;margin-top:10px;font-size:25px;font-family:san-serif;'>Welcome "+session.getAttribute("fname")+" "+session.getAttribute("lname")+" <i class='smile outline icon' style='color:#99ff99'></i></p>");
                %>
            </p>
            <div class="ui right floated labeled mini icon menu">               
                <div class='ui huge icon input' style="width:300px;margin-right: 10px;height: 40px;margin-top: 10px;margin-left: 10px">
                    <input type='text' placeholder='Search...' />
                    <i aria-hidden='true' class='search icon' style="color: #0066ff"></i>
                </div>
                <a class='item' href="logout.jsp" style="border-right: 1px solid #f0f0f5" id="logout">
                    <i aria-hidden='true' class='user circle icon' style="color: #0066ff"></i>  
                    <b>Logout</b>
                </a>
                <a class='item' id="about">
                    <i aria-hidden='true' class='question circle icon' style="color: #0066ff"></i>
                    <b>About</b>
                </a>
            </div>
        </div>
        <br/><br/>
        <div class='ui segment'><br/><br/>
            <img src='./images/mainlogo.png' class='ui medium centered image' /><br/><br/><br/>
            <img src='./images/logo3.jpg' class='ui medium centered image' /><br/>
            <br/><br/>
        </div>
        <div class='ui left fixed vertical labeled tiny icon menu' style='width: 70px'>
            <a class='active item' style="width: 50px;height: 60px;" href="user.jsp">
                <i aria-hidden='true' class='home icon' style="color: #0066ff"></i>
                <b>Home</b>
            </a>

            <a id="EEE" class='item' style="width: 50px" title="Electrical engineering">
                <i aria-hidden='true' class='lightbulb outline icon' style="color: #0066ff"></i>
                <b>EEE</b>
                <div id="EEEMenu" class="ui left pointing primary label" style="background-color: white; position: fixed;top: 20px;left: 65px;border: 2px solid #ccd9ff;display: none">
                    <div class="item" style="width:120px">First Year</div>
                    <div class="item" style="width:120px">Second Year</div> 
                    <div class="item" style="width:120px">Third Year</div> 
                    <div class="item" style="width:120px">Four Year</div> 
                </div>                
            </a>
            <a id="ECE" class='item' style="width: 50px" title="Electronics & Communication engineering">
                <i aria-hidden='true' class='microchip icon' style="color: #0066ff"></i>
                <b>ECE</b>
                <div id="ECEMenu" class="ui left pointing primary label" style="background-color: white;display: block; position: fixed;top: 82px;left: 65px;border: 2px solid #ccd9ff;;display: none">
                    <div class="item" style="width:120px">First Year</div>
                    <div class="item" style="width:120px">Second Year</div> 
                    <div class="item" style="width:120px">Third Year</div> 
                    <div class="item" style="width:120px">Four Year</div> 
                </div>                 
            </a>
            <a id="CSE" class='item' style="width: 50px" title="Computer Science & engineering">
                <i aria-hidden='true' class='computer icon' style="color: #0066ff"></i>
                <b>CSE</b>
                <div id="CSEMenu" class="ui left pointing primary label" style="background-color: white;display: block; position: fixed;top: 144px;left: 65px;border: 2px solid #ccd9ff;;display: none">
                    <div class="item" style="width:120px">First Year</div>
                    <div class="item" style="width:120px">Second Year</div> 
                    <div class="item" style="width:120px">Third Year</div> 
                    <div class="item" style="width:120px">Four Year</div> 
                </div>                 
            </a>
            <a id="MECH" class='item' style="width: 50px" title="Mechanical engineering">
                <i aria-hidden='true' class='car icon' style="color: #0066ff"></i>
                <b>MECH</b>
                <div id="MECHMenu" class="ui left pointing primary label" style="background-color: white;display: block; position: fixed;top: 206px;left: 65px;border: 2px solid #ccd9ff;;display: none">
                    <div class="item" style="width:120px">First Year</div>
                    <div class="item" style="width:120px">Second Year</div> 
                    <div class="item" style="width:120px">Third Year</div> 
                    <div class="item" style="width:120px">Four Year</div> 
                </div>                 
            </a>
            <a id="CVL" class='item' style="width: 50px" title="Civil engineering">
                <i aria-hidden='true' class='building icon' style="color: #0066ff"></i>
                <b>CE</b>
                <div id="CVLMenu" class="ui left pointing primary label" style="background-color: white;display: block; position: fixed;top: 260px;left: 65px;border: 2px solid #ccd9ff;;display: none">
                    <div class="item" style="width:120px">First Year</div>
                    <div class="item" style="width:120px">Second Year</div> 
                    <div class="item" style="width:120px">Third Year</div> 
                    <div class="item" style="width:120px">Four Year</div> 
                </div>                 
            </a>
            <a id="CE" class='item' style="width: 50px" title="Chemical engineering">
                <i aria-hidden='true' class='theme icon' style="color: #0066ff"></i>
                <b>CHE</b>
                <div id="CEMenu" class="ui left pointing primary label" style="background-color: white;display: block; position: fixed;top: 330px;left: 65px;border: 2px solid #ccd9ff;;display: none">
                    <div class="item" style="width:120px">First Year</div>
                    <div class="item" style="width:120px">Second Year</div> 
                    <div class="item" style="width:120px">Third Year</div> 
                    <div class="item" style="width:120px">Four Year</div> 
                </div>                 
            </a>
            <a id="MME" class='item' style="width: 50px" title="Materials & Metallurgical engineering">
                <i aria-hidden='true' class='dot circle icon' style="color: #0066ff"></i>
                <b>MME</b>
                <div id="MMEMenu" class="ui left pointing primary label" style="background-color: white;display: block; position: fixed;top: 392px;left: 65px;border: 2px solid #ccd9ff;;display: none">
                    <div class="item" style="width:120px">First Year</div>
                    <div class="item" style="width:120px">Second Year</div> 
                    <div class="item" style="width:120px">Third Year</div> 
                    <div class="item" style="width:120px">Four Year</div> 
                </div>                 
            </a>
            <a class='item' style="width: 50px">
            </a>
        </div>
        <div class="ui bottom fixed menu">
            <center>
            <div class="item" style="margin-left: 400px">
                <b>Copyright © 2018 Copyright - RGUKT Basar. All rights reserved.</b>
            </div>
            </center>
        </div>
    </div>
   <div class="ui card" id="aboutcard" style="display: none;width: 700px;height: 450px;position: fixed;background-color: #f2f2f2;top:80px;left:290px;border-radius: 10px">
       <div class="content">
           <div class="header"> About Developers <i id="aboutcancel" class="cancel icon" style="float: right;cursor: pointer"></i></div>
            <div class="description" style="margin-top: 20px">
                <div class="ui cards">
                    <div class='ui mini card' style="width:200px">
                        <img src='./images/Muneer.jpg' class='ui image' width="500" height="200" style="border-radius: 15px"/>
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
                        <img src='./images/Muneer.jpg' class='ui image' width="500" height="200" style="border-radius: 15px"/>
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
                        <img src='./images/Muneer.jpg' class='ui image' width="500" height="200" style="border-radius: 15px"/>
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
    </body>
</html>