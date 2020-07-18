<%@page import="model.application.AplCadastrarItem"%>
<%@page import="model.application.AplCadastrarCliente"%>
<%@page import="model.domain.Item"%>
<%@page import="model.domain.Cliente"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include  file="includes/head.jsp"%>
        <title>Passa Tempo | Gestão de Locações</title>
    </head>
    
<%
    AplCadastrarCliente aplCliente = new AplCadastrarCliente();
    AplCadastrarItem aplItem = new AplCadastrarItem();
%>
    
    <body>
        <header class="layout-cabecalho">
            <%@include  file="includes/header.jsp"%>
        </header>

        <section class="layout-cadastro">
            <div class="container">

                <form method="post" action="CrtCadastrarLocacao" >

                    <h1 class="titulo-formulario">Cadastrar Locação</h1>
                    
                    <input type="hidden" name="operacao" value="incluirlocacao">
                    
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="grupo-entrada">
                                <label for="cliente">Cliente</label>
                                <select id="cliente" name="cliente" class="campo" required>
                                    <% for(Cliente cliente : aplCliente.getAll()){ %>
                                        <option  class="dropdown-item" value="<%=cliente.getId()%>"><%=cliente.getNome()%></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-6">                            
                            <div class="grupo-entrada">
                                <label for="item">Item</label>
                                <select id="item" name="item" class="campo" required>
                                    <% for(Item item : aplItem.getAll()){ %>
                                        <option  class="dropdown-item" value="<%=item.getId()%>"><%=item.getNumSerie()%></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>                        
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="grupo-entrada">
                                <label for="dtDevPrev">Data Dev. Prevista</label>
                                <input type="date" name="dtDevPrev" id="dtDevPrev" class="campo" required>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="grupo-entrada">
                                <label for="valor">Valor</label>
                                <input type="number" name="valor" id="valor" class="campo" required>
                            </div>
                        </div>
                    </div>
                    <input type="submit" value="Cadastrar" class="btn btn-primary btn-lg">
                </form>
            </div>
        </section>
        
    </body>
</html>
