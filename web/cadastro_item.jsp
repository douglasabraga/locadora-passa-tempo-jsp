<%@page import="model.application.AplCadastrarTitulo"%>
<%@page import="model.domain.Titulo"%>
<%@page import="model.domain.Item"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include  file="includes/head.jsp"%>
        <title>Passa Tempo | Cadastro de Item</title>
    </head>
<%
    AplCadastrarTitulo aplTitulo = new AplCadastrarTitulo();
    //Item item = (Item)request.getAttribute("item");
%>

    <body>
        <header class="layout-cabecalho">
            <%@include  file="includes/header.jsp"%>
        </header>

        <section class="layout-cadastro">
            <div class="container">

                <form method="post" action="CrtCadastrarItem" >

                    <h1 class="titulo-formulario">Cadastrar Item</h1>
                    
                    <input type="hidden" name="operacao" value="incluiritem">
                    
                    <div class="grupo-entrada">
                        <label for="numero">Numero de Série</label>
                        <input type="number" min="0" name="numero" class="campo" required>
                    </div>

                    <div class="row">
                        
                        <div class="col-sm-6">
                            <div class="grupo-entrada">
                                <label for="data">Data de Aquisição</label>
                                <input type="date" name="data" class="campo" required>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="grupo-entrada">
                                <label for="tipo">Tipo</label>
                                <input type="text" name="tipo" class="campo" required>
                            </div>
                        </div>
                    </div>
                    <div class="grupo-entrada">
                        <label for="titulo">Titulo</label>
                        <select id="titulo" name="titulo" class="campo" required>
                            <% for(Titulo titulo : aplTitulo.getAll()){ %>
                                <option value="<%=titulo.getId()%>"><%=titulo.getTitulo()%></option>
                            <% } %>
                        </select>
                    </div>
                    
                    <input type="submit" value="Cadastrar" class="btn btn-primary btn-lg">
                </form>
            </div>

        </section>
        
    </body>
</html>
