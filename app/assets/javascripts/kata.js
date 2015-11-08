$(function(){
  $("#language").on('click',function(e){
    $("body").toggleClass("body-background");
    $("body").toggleClass("coding-background");
    e.preventDefault();
    var language = ($(e.target).attr("value"));
    var data = {language: language};

    $.ajax({
    type:"POST",
    url:'/coding-challenges',
    dataType: 'json',
    data: data
    }).done(function(response){
      // console.log(response);
      $(".language_selection").fadeOut(300,function(){
        $(this).css({display:"none"});
        //animation complete
      }); 
      var interval = setTimeout(function(){
        $(HandlebarsTemplates['kata/ace'](response))
        .appendTo("body").hide().fadeIn(3500, function(){});
      }, 300);

    });
  });
  $("body").on("click", "#codesubmit", function(e){
    $("#message").empty();
    var data = {answer: editor.getValue()};
    $.ajax({
      type: "POST",
      url: "/submit-answer",
      dataType: 'json',
      data: data
    }).done(function(response){
      if(response.errors){
        $(HandlebarsTemplates['kata/errors'](response))
        .appendTo("#message").hide().slideDown("slow", function(){
        });
      }
      //ending the if statement
      else{
        //review the code and think about the next step
      }
    });
  });
  $("body").on("click", "#cleanup", function(e){
      $("#editor").text("");
  });
});