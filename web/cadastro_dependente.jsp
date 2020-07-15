<%@page import="model.application.AplCadastrarCliente"%>
<%@page import="model.domain.Dependente"%>
<%@page import="model.domain.Socio"%>
<%@page import="model.domain.Cliente"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include  file="includes/head.jsp"%>
        <title>Passa Tempo | Cadastro de Dependente</title>
    </head>
<%
    AplCadastrarCliente aplCliente = new AplCadastrarCliente();
%>
    <body>
        <header class="layout-cabecalho">
            <%@include  file="includes/header.jsp"%>
        </header>

        <section class="layout-cadastro">
            <div class="container">

                <form method="post" action="CrtCadastrarCliente" >

                    <h1 class="titulo-formulario">Cadastrar Dependente</h1>
                    
                    <input type="hidden" name="operacao" value="incluirdependente">
                    
                    <div class="grupo-entrada">
                        <label for="classe">Sócios disponíveis</label>
                        <select id="socio" name="socio" class="campo" required>
                            <% for(Cliente socio : aplCliente.buscarSocios()){ %>
                                <option value="<%=socio.getId()%>"><%=socio.getNome()%></option>
                            <% } %>
                        </select>
                    </div>
                    
                    <div class="grupo-entrada">
                        <label for="nome">Nome</label>
                        <input type="text" name="nome" id="nome" class="campo" required>
                    </div>

                    <div class="row">

                        <div class="col-sm-6">
                            <div class="grupo-entrada">
                                <label for="data">Data de Nascimento</label>
                                <input type="date" name="data" id="data-nascimento" class="campo" required>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="grupo-entrada">
                                <label for="sexo">Sexo</label>
                                <select name="sexo" class="campo" required>
                                    <option value="masculino">Masculino</option>
                                    <option value="masculino">Feminino</option>
                                </select>
                            </div>
                        </div>

                    </div>

                    <input type="submit" value="Cadastrar Dependente" class="botao  botao--principal">
                
                </form>
            </div>

        </section>
        
    </body>
</html>
