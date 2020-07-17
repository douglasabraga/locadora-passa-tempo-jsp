<%@page import="model.domain.Diretor"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include  file="includes/head.jsp"%>
        <title>Passa Tempo | Cadastro de Diretor</title>
    </head>
    <body>
        <header class="layout-cabecalho">
            <%@include  file="includes/header.jsp"%>
        </header>

        <section class="layout-cadastro">
            <div class="container">

                <form method="post" action="CrtCadastrarDiretor" >

                    <h1 class="titulo-formulario">Cadastrar Diretor</h1>
                    
                    <input type="hidden" name="operacao" value="incluirdiretor">
                    
                    <div class="grupo-entrada">
                        <label for="txt_nome">Nome do Diretor</label>
                        <input type="text" name="txt_nome" class="campo" required>
                    </div>

                    <input type="submit" value="Cadastrar" class="btn btn-primary btn-lg">
                </form>
            </div>

        </section>
        
    </body>
</html>
