<%@page import="model.application.AplCadastrarAtor"%>
<%@page import="model.application.AplCadastrarDiretor"%>
<%@page import="model.application.AplCadastrarClasse"%>
<%@page import="model.domain.Ator"%>
<%@page import="model.domain.Classe"%>
<%@page import="model.domain.Diretor"%>
<%@page import="model.domain.Titulo"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include  file="includes/head.jsp"%>
        <title>Passa Tempo | Cadastro de Ator</title>
    </head>
<%
    AplCadastrarClasse aplClasse = new AplCadastrarClasse();
    AplCadastrarDiretor aplDiretor = new AplCadastrarDiretor();
    AplCadastrarAtor aplAtor = new AplCadastrarAtor();
%>

    <body>
        <header class="layout-cabecalho">
            <%@include  file="includes/header.jsp"%>
        </header>

        <section class="layout-cadastro">
            <div class="container">

                <form method="post" action="CrtCadastrarTitulo">

                    <h1 class="titulo-formulario">Cadastrar Titulo</h1>
                    
                    <input type="hidden" name="operacao" value="incluirtitulo">
                    
                    <div class="grupo-entrada">
                        <label for="titulo">Nome titulo</label>
                        <input type="text" name="titulo" class="campo" required>
                    </div>
                    <div class="grupo-entrada">
                        <label for="ano">Ano</label>
                        <input type="text" name="ano" class="campo" required>
                    </div>
                    
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="grupo-entrada">
                                <label for="categoria">Categoria</label>
                                <input type="text" name="categoria" class="campo" required>
                            </div>
                        </div>   
                        <div class="col-sm-6">                  
                            <div class="grupo-entrada">
                                <label for="classe">Classe</label>
                                <select id="classe" name="classe" class="campo" required>
                                    <% for(Classe classe : aplClasse.getAll()){ %>
                                        <option  class="dropdown-item" value="<%=classe.getId()%>"><%=classe.getNome()%></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>  
                    </div>
                    <div class="grupo-entrada">
                        <label for="ator">Atores</label>
                        <select id="ator" name="ator" class="custom-select campo" multiple>
                            <% for(Ator ator : aplAtor.getAll()){ %>
                                <option value="<%=ator.getId()%>"><%=ator.getNome()%></option>
                            <% } %>
                        </select>
                    </div>

                    <div class="grupo-entrada">
                        <label for="diretor">Diretor</label>
                        <select id="diretor" name="diretor" class="campo" required>
                            <% for(Diretor diretor : aplDiretor.getAll()){ %>
                                <option value="<%=diretor.getId()%>"><%=diretor.getNome()%></option>
                            <% } %>
                        </select>
                    </div>

                    <div class="grupo-entrada">
                        <label for="sinopse">Sinopse</label>
                        <textarea class="form-control  campo" name="sinopse" rows="3"></textarea>
                    </div>
                    
                    <input type="submit" value="Cadastrar" class="btn btn-primary btn-lg">
                </form>
            </div>

        </section>
        
    </body>
</html>
