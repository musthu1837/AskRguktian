/* global repalyvalues */

$(document).ready(function (){
     $("#about").click(function (){
        $("#aboutcard").toggle("slow");
     });
     var toggle2=1;
     var toggle=1;
     $($($($($("#fluidcard").children(".content"))).children(".description")).children("[name='maincomment']")).click(function(event){
         //window.console.log(total);
         var id = $($($(event.target).parent()).children()[4]);
         if(toggle == 1){
             $.post(
                 '../../process/cdcomments.jsp',
                 {
                     id : id[0].id,
                     require : "commentscount"
                 },
                 function (count){     
                     $("#requestscount").html(count);
                     $.post(
                         '../../process/cdcomments.jsp',
                         {
                             id : id[0].id,
                             require : "comments"
                         },
                         function (responseText){                             
                              var values= responseText.split("%");
                              
                              for(var i=0;i<count;i++){   
                                  var ivalues= values[i].split("$"); 
                                  var ele = $("<div class='comment' id='"+ivalues[0]+"' style='margin-left:20px;border-bottom:1px solid lightgrey'><div class='content'><a class='author'>"+ivalues[3]+"</a><div class='metadata'><span>"+ivalues[2]+"</span></div><div class='text'>"+ivalues[1]+"</div><br/></div></div>")
                                  $($($(event.target).parent()).children()[4]).append(ele);
                              }                             
                             $(event.target).parent().append($("<form class='ui form'><div class='field'><textarea rows='5' placeholder='Add comment..'></textarea name='commentvalue'><br/><br/><button type='submit' class='ui mini disabled primary button'>Comment</button></div></form>"));
                                  $($($(event.target).parent()).children()[5]).children(".field").children("textarea").keyup(function(){

                                      var commentvalues = $($($($(event.target).parent()).children()[5]).children(".field").children("textarea")).val();                                             
                                      if(commentvalues.length == 0){
                                          $($($(event.target).parent()).children()[5]).children(".field").children("button").attr("class","ui mini disabled primary button");
                                      }
                                      else{
                                          $($($(event.target).parent()).children()[5]).children(".field").children("button").attr("class","ui mini primary button");
                                      }
                             });                                       
                             $($($($(event.target).parent()).children()[5])).submit(function(event){
                                 $("#logout").length == 0 ? window.location.href="../../logout.jsp":window.console.log("");
                                 event.preventDefault();
                                 $.post('../../process/cdcomments.jsp',{
                                     id : id[0].id,
                                     user: $("#username").html(),
                                     comment: $($($($(event.target).parent()).children()[5]).children(".field").children("textarea")).val(),
                                     require : "add"
                                 },
                                 function(responseText){
                                     var ele = $("<div class='comment' style='margin-left:20px;margin-bottom:1px solid lightgrey'><div class='content'><a class='author'>"+$("#username").html()+"</a><div class='metadata'><span>just now</span></div><div class='text'>"+$($($($(event.target).parent()).children()[5]).children(".field").children("textarea")).val()+"</div><br/></div></div>")
                                     $($($(event.target).parent()).children()[4]).prepend(ele);               
                                     var total = Number($(event.target).prev().prev().prev().prev().prev().children("div").html());
                                     total++;   
                                     $(event.target).prev().prev().prev().prev().prev().children("div").html(total);
                                     $($($($(event.target).parent()).children()[5]).children(".field").children("textarea")).val("");
                                     $($($($(event.target).parent()).children()[5]).children(".field").children("button")).attr("class","ui mini disabled primary button"); 
                                 });
                             });                                        
                     });                             
             }); 
              $($($(event.target).parent()).children()[4]).slideDown("slow");
              toggle=0;
         }
         else{
             $($($(event.target).parent()).children()[4]).children().remove();
             $($($(event.target).parent()).children()[5]).remove();
             $($($(event.target).parent()).children()[4]).slideUp("slow");
             toggle=1;
         }

     });

     $($($($($("#fluidcard").children(".content"))).children(".description")).children("[name='mainlike']")).click(function(event){
        //window.console.log($("#logout").length);
         $("#logout").length == 0 ? window.location.href="../../logout.jsp":window.console.log("");
         if($(event.target).attr("class") == "thumbs up icon"){
             window.console.log($($(event.target).parent().parent().children()[4]).attr("id"));
             window.console.log($($("#username")[0]).html());
             if($(event.target).css("color") == "rgba(0, 0, 0, 0.6)"){
                 $.post(
                         '../../process/cdcomments.jsp',
                     {   require:"like",
                         likes:$(event.target).next().html(),
                         questionid:$($(event.target).parent().parent().children()[4]).attr("id"),
                         username:$($("#username")[0]).html()

                     },
                     function (responseText){
                          window.console.log(responseText);              
                     });
                // window.console.log($(event.target).css("color"));
                $(event.target).next().html(Number($(event.target).next().html())+1);
                 $(event.target).css("color","blue");
             }
             else{
                 $.post(
                         '../../process/cdcomments.jsp',
                     {   require:"dislike",
                         likes:$(event.target).next().html(),
                         questionid:$($(event.target).parent().parent().children()[4]).attr("id"),
                         username:$($("#username")[0]).html()

                     },
                     function (responseText){
                          window.console.log(responseText);              
                     });                            
                 $(event.target).css("color","rgba(0, 0, 0, 0.6)");
                 $(event.target).next().html(Number($(event.target).next().html())-1);
             }
         }

     });
     $($($($($("#fluidcard").children(".content"))).children(".description")).children("[name='maindislike']")).click(function(){
         window.console.log("dislike");         
     });            
     $("#questionform").children("div").children("textarea").keyup(function(){
         var quest = $("#questionform").children("div").children("textarea").val();
         if(quest.length == 0){
             $("#questionform").children("div").children("button").attr("class","ui medium icon right labeled disabled primary button")
         }
         else{
             $("#questionform").children("div").children("button").attr("class","ui medium icon right labeled primary button")
         }
     });
     $("#questionform").submit(function(event){
         $("#logout").length == 0 ? window.location.href="../../logout.jsp":window.console.log("");
         var quest = $("#questionform").children("div").children("textarea").val();
         event.preventDefault();
        $.post('../../process/cdcomments.jsp',
        {   username:$($("#username")[0]).html(),
            question:quest,
            require:"post"
        },
        function(responseText){
            window.console.log(responseText);
            window.location.href = "../CSE/cd.jsp";
        });
     });
 });