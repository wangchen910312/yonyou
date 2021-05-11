/* publish js */
$(document).ready(function(){
    $("div#container").click(function(){
       $("#btn_closeGnb").click();
    });

    //gnb close
    $("#btn_closeGnb").click(function(){
        $("#sidebar").animate({"width":"35px"},100);
        $("#sidebar").removeClass("active");
        $("#gnb>li").removeClass("active");
    });

    //gnb click
    $("#gnb>li>a").click(function(){
        if($("#btn_closeGnb").is(":hidden")){
            $("#sidebar").animate({"width":"229px"},200);
            $("#sidebar").addClass("active");
        }
        $("#gnb>li").removeClass("active");
        if($(this).siblings().children("ul").is(":hidden")){
            $(this).parent().addClass("active");
        }
    });
    $("#gnb>li ul.depth2_area>li>a").click(function(){
        $(this).parent().parent().children('li').removeClass("active");
        $(this).parent().parent().children('li').children('ul').slideUp(200);
        if($(this).siblings().is(":hidden")){
            $(this).parent().addClass("active");
            $(this).siblings().slideDown(200);
        }
    });
    $("#gnb>li ul.depth2_area>li>ul>.has_4depth>a").click(function(){
        $(this).parent().parent().children('li').removeClass("active");
        $(this).parent().parent().children('li').children('ul').slideUp(200);
        if($(this).siblings().is(":hidden")){
            $(this).parent().addClass("active");
            $(this).siblings().slideDown(200);
        }
    });

    //showHide_area
    $(".btn_showHide").click(function(){
        var $showHide_area = $(this).parents(".showHide_area");
        if($showHide_area.children(".table_form").is(":visible")){
            $showHide_area.children(".table_form").hide();
            $(this).addClass("selected");
        }else if($showHide_area.children(".table_grid").is(":visible")){
            $showHide_area.children(".table_grid").hide();
            $(this).addClass("selected");
        }else{
            $showHide_area.children(".table_form, .table_grid").show();
            $(this).removeClass("selected");
        }
    });
});
