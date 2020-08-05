<%@page import="model.domain.Classe"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include  file="includes/head.jsp"%>
        <title>Passa Tempo | Cadastro da Classe</title>
    </head>
    <body>
        <header class="layout-cabecalho">
            <%@include  file="includes/header.jsp"%>
        </header>

        <section class="layout-cadastro">
            <div class="container">

                <form method="post" action="CrtCadastrarClasse" >

                    <h1 class="titulo-formulario">Cadastrar Classe</h1>
                    
                    <input type="hidden" name="operacao" value="incluirclasse">
                    
                    <div class="grupo-entrada">
                        <label for="txt_nome">Nome</label>
                        <input type="text" name="txt_nome" class="campo" required>
                    </div>
                    
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="grupo-entrada">
                                <label for="number_valor">Valor</label>
                                <input type="number" name="number_valor" min="0.00" step="0.01" class="campo" required>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="grupo-entrada">
                                <label for="number_prazo">Prazo Devolução</label>
                                <input type="number"  name="number_prazo"  class="campo" required>
                            </div>
                        </div>
                    </div>
                    
                    <input type="submit" value="Cadastrar" class="btn btn-primary btn-lg">
                
                </form>
            </div>

        </section>
        
    </body>
</html>
