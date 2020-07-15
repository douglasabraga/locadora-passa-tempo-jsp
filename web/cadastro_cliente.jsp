<%@page import="model.application.AplCadastrarCliente"%>
<%@page import="model.domain.Dependente"%>
<%@page import="model.domain.Socio"%>
<%@page import="model.domain.Cliente"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include  file="includes/head.jsp"%>
        <title>Passa Tempo | Cadastro de Sócio</title>
    </head>
    <body>
        <header class="layout-cabecalho">
            <%@include  file="includes/header.jsp"%>
        </header>

        <section class="layout-cadastro">
            <div class="container">

                <form method="post" action="CrtCadastrarCliente" >

                    <h1 class="titulo-formulario">Cadastrar Sócio</h1>
                    
                    <input type="hidden" name="operacao" value="incluirsocio">
                    
                    <div class="grupo-entrada">
                        <label for="nome">Nome</label>
                        <input type="text" name="nome" class="campo" >
                    </div>

                    <div class="row">

                        <div class="col-sm-8">
                            <div class="grupo-entrada">
                                <label for="endereco">Endereço</label>
                                <input type="text" name="endereco" class="campo" >
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="grupo-entrada">
                                <label for="data">Data de Nascimento</label>
                                <input type="date" name="data" id="data-nascimento" class="campo" >
                            </div>
                        </div>

                    </div>

                    <div class="row">

                        <div class="col-sm-4">
                            <div class="grupo-entrada">
                                <label for="telefone">Telefone</label>
                                <input type="text" name="telefone" id="telefone" class="campo" required>
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="grupo-entrada">
                                <label for="cpf">CPF</label>
                                <input type="text" name="cpf" class="campo" required>
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="grupo-entrada">
                                <label for="sexo">Sexo</label>
                                <select id="sexo" name="sexo" class="campo" required>
                                    <option value="masculino">Masculino</option>
                                    <option value="feminio">Feminino</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <input type="submit" value="Cadastrar Sócio" class="botao  botao--principal">

                </form>
            </div>

        </section>
        
    </body>
</html>
