<%@page import="model.domain.Ator"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include  file="includes/head.jsp"%>
        <title>Passa Tempo | Cadastro de Ator</title>
    </head>
    <body>
        <header class="layout-cabecalho">
            <%@include  file="includes/header.jsp"%>
        </header>

        <section class="layout-cadastro">
            <div class="container">

                <form method="post" action="CrtCadastrarAtor" >

                    <h1 class="titulo-formulario">Cadastrar Ator</h1>
                    
                    <input type="hidden" name="operacao" value="incluirator">
                    
                    <div class="grupo-entrada">
                        <label for="txt_nome">Nome do Autor</label>
                        <input type="text" name="txt_nome" class="campo" required>
                    </div>

                    <input type="submit" value="Cadastrar" class="botao  botao--principal">
                </form>
            </div>

        </section>
        
    </body>
</html>
