$(document).ready(function(){
    $("#openMenu").click(function(){
        $(".menuSmall").fadeIn(200);
        $(".header").hide();
        $(".section").hide();
        $(".footer").hide();
        $(".copyright").hide();
    });
    $("#closeMenu").click(function(){
        $(".menuSmall").fadeOut(200);
        $(".header").show();
        $(".section").show();
        $(".footer").show();
        $(".copyright").show();
    });
    
    
    $(".link").click(function(){
        $(".iframeSmall").fadeIn();
        $(".header").hide();
        $(".section").hide();
        $(".footer").hide();
        $(".copyright").hide();
    });

    $(".btnServiceSmall").click(function(){
        $(".header").hide();
        $(".section").hide();
        $(".footer").hide();
        $(".copyright").hide();
    });
    
/*========================SUB-MENU========================*/    
    $("#li_empresa").mouseover(function(){
        $("#sub_menu_empresa").slideDown(100);
    });
    $("#li_empresa").mouseleave(function(){
        $("#sub_menu_empresa").slideUp(200);
    });
    
    $("#li_servico").mouseover(function(){
        $("#sub_menu_servico").slideDown(100);
    });
    $("#li_servico").mouseleave(function(){
        $("#sub_menu_servico").slideUp(200);
    });
    
/*========================SLIDER========================*/
$(".imgSlider").cycle();
});       
/*========================GALERIA========================*/
$(".btnGaleria").click(function(){
    $(".galeriaImg").slideDown();
    
});
$("#closeGaleria").click(function(){
    $(".galeriaImg").hide(); 
});

$(window).resize(function(){
    if($(window).width()>=992){
        $(".menuSmall").hide();
        $(".header").show();
        $(".section").show();
        $(".footer").show();}
    
    if($(window).width()<=992){
        $("#galeriaImg").hide();
    }
});

