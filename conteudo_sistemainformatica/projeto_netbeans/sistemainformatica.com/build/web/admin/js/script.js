$(document).ready(function () {

    /*===========================MENU-SMALL===========================*/
    $(".btnOpenMenu").click(function () {
        $(".menuSmall").fadeIn();
        $(".container-fluid").hide();
    });

    $(".btnCloseMenu").click(function () {
        $(".menuSmall").fadeOut();
        $(".container-fluid").show();
    });



    /*===========================ADMINISTRATIVO-MOBILE===========================*/
    $("#liMenuSmall_empresa").click(function () {
        $("#container_adminSmall").show();
        $("#empresa_adminSmall").show();
        $(".menuSmall").hide();
    });
    $(".btnCloseContainer").click(function () {
        $("#container_adminSmall").hide();
        $("#empresa_adminSmall").fadeOut();
        $(".container-fluid").show();
    });
    /*============================================================*/

    $("#liMenuSmall_servico").click(function () {
        $("#container_adminSmall").show();
        $("#servico_adminSmall").show();
        $(".menuSmall").hide();
    });
    $(".btnCloseContainer").click(function () {
        $("#container_adminSmall").hide();
        $("#servico_adminSmall").fadeOut();
        $(".container-fluid").show();
    });
    /*============================================================*/

    $("#liMenuSmall_cliente").click(function () {
        $("#container_adminSmall").show();
        $("#cliente_adminSmall").show();
        $(".menuSmall").hide();
    });
    $(".btnCloseContainer").click(function () {
        $("#container_adminSmall").hide();
        $("#cliente_adminSmall").fadeOut();
        $(".container-fluid").show();
    });
    /*============================================================*/

    $("#liMenuSmall_parceiro").click(function () {
        $("#container_adminSmall").show();
        $("#parceiro_adminSmall").show();
        $(".menuSmall").hide();
    });
    $(".btnCloseContainer").click(function () {
        $("#container_adminSmall").hide();
        $("#parceiro_adminSmall").fadeOut();
        $(".container-fluid").show();
    });
    /*============================================================*/

    $("#liMenuSmall_contato").click(function () {
        $("#container_adminSmall").show();
        $("#contato_adminSmall").show();
        $(".menuSmall").hide();
    });
    $(".btnCloseContainer").click(function () {
        $("#container_adminSmall").hide();
        $("#contato_adminSmall").fadeOut();
        $(".container-fluid").show();
    });
    
    
    /*============================================================*/

    $("#liMenuSmall_administrativo").click(function () {
        $("#container_adminSmall").show();
        $("#administrativo_adminSmall").show();
        $(".menuSmall").hide();
    });
    $(".btnCloseContainer").click(function () {
        $("#container_adminSmall").hide();
        $("#administrativo_adminSmall").fadeOut();
        $(".container-fluid").show();
    });



    /*===========================ADMINISTRATIVO-DESKTOP===========================*/
    $("#liMenu_pagInicial").click(function () {
        $("#pagInicial_admin").fadeIn();
        $("#empresa_admin").hide();
        $("#servico_admin").hide();
        $("#cliente_admin").hide();
        $("#parceiro_admin").hide();
        $("#contato_admin").hide();
        $("#administrativo_admin").hide();
    });
    /*==================================================*/
    $("#liMenu_empresa").click(function () {
        $("#pagInicial_admin").hide();
        $("#empresa_admin").fadeIn();
        $("#servico_admin").hide();
        $("#cliente_admin").hide();
        $("#parceiro_admin").hide();
        $("#contato_admin").hide();
        $("#administrativo_admin").hide();
    });

    /*==================================================*/
    $("#liMenu_servico").click(function () {
        $("#pagInicial_admin").hide();
        $("#empresa_admin").hide();
        $("#servico_admin").fadeIn();
        $("#cliente_admin").hide();
        $("#parceiro_admin").hide();
        $("#contato_admin").hide();
        $("#administrativo_admin").hide();
    });

    /*==================================================*/
    $("#liMenu_cliente").click(function () {
        $("#pagInicial_admin").hide();
        $("#empresa_admin").hide();
        $("#servico_admin").hide();
        $("#cliente_admin").fadeIn();
        $("#parceiro_admin").hide();
        $("#contato_admin").hide();
        $("#administrativo_admin").hide();
    });

    /*==================================================*/
    $("#liMenu_parceiro").click(function () {
        $("#pagInicial_admin").hide();
        $("#empresa_admin").hide();
        $("#servico_admin").hide();
        $("#cliente_admin").hide();
        $("#parceiro_admin").fadeIn();
        $("#contato_admin").hide();
        $("#administrativo_admin").hide();
    });

    /*==================================================*/
    $("#liMenu_contato").click(function () {
        $("#pagInicial_admin").hide();
        $("#empresa_admin").hide();
        $("#servico_admin").hide();
        $("#cliente_admin").hide();
        $("#parceiro_admin").hide();
        $("#contato_admin").fadeIn();
        $("#administrativo_admin").hide();
    });
    
    
    /*==================================================*/
    $("#liMenu_administrativo").click(function () {
        $("#pagInicial_admin").hide();
        $("#empresa_admin").hide();
        $("#servico_admin").hide();
        $("#cliente_admin").hide();
        $("#parceiro_admin").hide();
        $("#contato_admin").hide();
        $("#administrativo_admin").fadeIn();
    });

    /*==========================MASK TELEFONE==========================*/
   $("#telefoneFixo").mask("(99)9999-9999");	
   $("#telefoneCelular").mask("(99)99999-9999");	

});




$(window).resize(function () {
    if ($(window).width() >= 992) {
        $(".menuSmall").hide();
        $("#container_adminSmall").hide();
        $(".container-fluid").show();
    }

});