$(document).ready(function(){
/*======================DESCRICAO-SMALL======================*/
	$("#btnHistoricoEmpresaSmall").click(function(){
		$("#historicoEmpresaSmall").fadeIn();
		$(".container-fluid").hide();
	});

	$("#btnVisaoEmpresaSmall").click(function(){
		$("#visaoEmpresaSmall").fadeIn();
		$(".container-fluid").hide();
	});

	$("#btnMissaoEmpresaSmall").click(function(){
		$("#missaoEmpresaSmall").fadeIn();
		$(".container-fluid").hide();
	});

	$("#btnValoresEmpresaSmall").click(function(){
		$("#valoresEmpresaSmall").fadeIn();
		$(".container-fluid").hide();
	});

	$("#btnEquipeEmpresaSmall").click(function(){
		$("#equipeEmpresaSmall").fadeIn();
		$(".container-fluid").hide();
	});



	$(".btnCloseDescricao").click(function(){
		$(".descricaoEmpresaSmall").hide();
		$(".container-fluid").show();
	});


/*======================DESCRICAO-LONG======================*/
	$("#btnHistoricoEmpresa").click(function(){
		$("#btnHistoricoEmpresa").css("background","#101d42");
		$("#btnHistoricoEmpresa").css("color","white");
                
                $("#btnVisaoEmpresa").css("background","white");
		$("#btnVisaoEmpresa").css("color","#252422");
                $("#btnMissaoEmpresa").css("background","white");
		$("#btnMissaoEmpresa").css("color","#252422");
                $("#btnValoresEmpresa").css("background","white");
		$("#btnValoresEmpresa").css("color","#252422");
                $("#btnEquipeEmpresa").css("background","white");
		$("#btnEquipeEmpresa").css("color","#252422");
                
		$("#historicoEmpresa").show();
		$("#visaoEmpresa").hide();
		$("#missaoEmpresa").hide();
		$("#valoresEmpresa").hide();
		$("#equipeEmpresa").hide();
	});

	$("#btnVisaoEmpresa").click(function(){
		$("#btnVisaoEmpresa").css("background","#101d42");
		$("#btnVisaoEmpresa").css("color","white");
                
                $("#btnHistoricoEmpresa").css("background","white");
		$("#btnHistoricoEmpresa").css("color","#252422");
                $("#btnMissaoEmpresa").css("background","white");
		$("#btnMissaoEmpresa").css("color","#252422");
                $("#btnValoresEmpresa").css("background","white");
		$("#btnValoresEmpresa").css("color","#252422");
                $("#btnEquipeEmpresa").css("background","white");
		$("#btnEquipeEmpresa").css("color","#252422");
                
		$("#historicoEmpresa").hide();
		$("#visaoEmpresa").show();
		$("#missaoEmpresa").hide();
		$("#valoresEmpresa").hide();
		$("#equipeEmpresa").hide();
	});

	$("#btnMissaoEmpresa").click(function(){
		$("#btnMissaoEmpresa").css("background","#101d42");
		$("#btnMissaoEmpresa").css("color","white");
                
                $("#btnHistoricoEmpresa").css("background","white");
		$("#btnHistoricoEmpresa").css("color","#252422");
                $("#btnVisaoEmpresa").css("background","white");
		$("#btnVisaoEmpresa").css("color","#252422");
                $("#btnValoresEmpresa").css("background","white");
		$("#btnValoresEmpresa").css("color","#252422");
                $("#btnEquipeEmpresa").css("background","white");
		$("#btnEquipeEmpresa").css("color","#252422");
                
		$("#historicoEmpresa").hide();
		$("#visaoEmpresa").hide();
		$("#missaoEmpresa").show();
		$("#valoresEmpresa").hide();
		$("#equipeEmpresa").hide();
	});

	$("#btnValoresEmpresa").click(function(){
		$("#btnValoresEmpresa").css("background","#101d42");
		$("#btnValoresEmpresa").css("color","white");
                
                $("#btnHistoricoEmpresa").css("background","white");
		$("#btnHistoricoEmpresa").css("color","#252422");
                $("#btnVisaoEmpresa").css("background","white");
		$("#btnVisaoEmpresa").css("color","#252422");
                $("#btnMissaoEmpresa").css("background","white");
		$("#btnMissaoEmpresa").css("color","#252422");
                $("#btnEquipeEmpresa").css("background","white");
		$("#btnEquipeEmpresa").css("color","#252422");
                
		$("#historicoEmpresa").hide();
		$("#visaoEmpresa").hide();
		$("#missaoEmpresa").hide();
		$("#valoresEmpresa").show();
		$("#equipeEmpresa").hide();
	});

	$("#btnEquipeEmpresa").click(function(){
		$("#btnEquipeEmpresa").css("background","#101d42");
		$("#btnEquipeEmpresa").css("color","white");
                
                $("#btnHistoricoEmpresa").css("background","white");
		$("#btnHistoricoEmpresa").css("color","#252422");
                $("#btnVisaoEmpresa").css("background","white");
		$("#btnVisaoEmpresa").css("color","#252422");
                $("#btnMissaoEmpresa").css("background","white");
		$("#btnMissaoEmpresa").css("color","#252422");
                $("#btnValoresEmpresa").css("background","white");
		$("#btnValoresEmpresa").css("color","#252422");
                
		$("#historicoEmpresa").hide();
		$("#visaoEmpresa").hide();
		$("#missaoEmpresa").hide();
		$("#valoresEmpresa").hide();
		$("#equipeEmpresa").show();
	});

});

$(window).resize(function(){
	if($(window).width() >= 992){
		$(".descricaoEmpresaSmall").hide();
		$(".container-fluid").show();
	}
});