$(document).ready(function(){
    $(".form").validate({
        
        /*===form_cliente*/
        rules:{
            nome:{required:true},
            nome_categoria:{required:true},
            nome_diretorio:{required:true},
            telefone:{required:true},
            endereco:{required:true},
            titulo:{required:true},
            desc:{required:true},
            site:{required:true},
            logo:{required:true},            
            login:{required:true},            
            senha:{required:true},
            categoria_servico:{required:true},
            categoria_galeria:{required:true},
            imagem_galeria:{required:true},
            img_slider:{required:true},
            img_servico:{required:true},
            imagem_categoria:{required:true}
                        
        },
        messages:{
            nome:{required:"Por favor, preencha com nome"},
            nome_categoria:{required:"Por favor, preencha com nome"},
            nome_diretorio:{required:"Por favor, preencha com nome do diretorio"},
            telefone:{required:"Por favor, preencha com telefone"},
            endereco:{required:"Por favor, preencha com o endereco"},
            titulo:{required:"Por favor, preencha com o titulo"},
            desc:{required:"Por favor, preencha com a descricao"},
            site:{required:"Por favor, preencha com o site"},
            logo:{required:"Por favor, insira uma logomarca"},
            login:{required:"Por favor, insira o login"},
            senha:{required:"Por favor, insira a senha"},
            categoria_servico:{required:"Por favor, selecione o servico"},
            logo_cliente:{required:"Insira a logo"},
            logo_pagInicial:{required:"Insira a logo"},
            logo_parceiro:{required:"Insira a logo"},
            img_servico:{required:"Insira a imagem do servico"},
            img_slider:{required:"Insira a imagem para o slider"},
            imagem_categoria:{required:"Insira a imagem da categoria"},
            categoria_galeria:{required:"Por favor, selecione a categoria"},            
            imagem_galeria:{required:"Insira a imagem para a galeria"},            
            logomarca:{required:"Insira a logomarca"}
            
            
        }
        
    });
    
    $(".form_categoria").validate({
        rules:{
            nome_categoria:{required:true},
            nome_diretorio:{required:true},
            imagem_categoria:{required:true},
            categoria_servico:{required:true}
        },
        messages:{
            nome_categoria:{required:"Por favor, preencha com nome"},
            nome_diretorio:{required:"Por favor, preencha com nome do diretorio"},
            imagem_categoria:{required:"Insira a imagem da categoria"}
        }
    });
    
    $(".form_alter_categoria").validate({
        rules:{
            nome_categoria:{required:true},
            nome_diretorio:{required:true},
            imagem_categoria:{required:true},
            categoria_servico:{required:true}
        },
        messages:{
            nome_categoria:{required:"Por favor, preencha com nome"},
            nome_diretorio:{required:"Por favor, preencha com nome do diretorio"},
            imagem_categoria:{required:"Insira a imagem da categoria"}
        }
    });
    $(".form_insert_galeria").validate({
        rules:{
            categoria_galeria:{required:true},
            imagem_galeria:{required:true}
        },
        messages:{
            categoria_galeria:{required:"Por favor, preencha com nome"},
            imagem_galeria:{required:"Insira a imagem para galeria"}
        }
    });
    
});