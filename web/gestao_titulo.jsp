<%@page import="model.domain.Titulo"%>
<%@page import="model.application.AplCadastrarTitulo"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include  file="includes/head.jsp"%>
        <title>Passa Tempo | Gestão de Titulo</title>
    </head>
    <body>
        <header class="layout-cabecalho">
            <%@include  file="includes/header.jsp"%>
        </header>

        <section class="layout-formulario">
            <div class="container table-responsive">
                <h1 class="titulo-formulario">Gestão de Titulos</h1>
                <% 
                    AplCadastrarTitulo apl = new AplCadastrarTitulo();
                    List<Titulo> lista = apl.buscarTodos();
                    
                    //if(lista.size() > 0) {
                %>
                <table data-toggle="table" class="table table-striped condensed table-hover" >
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nome titulo</th>
                            <th>Atores</th>
                            <th>Diretor</th>
                            <th>Ano</th>
                            <th>Sinopse</th>
                            <th>Categoria</th>
                            <th>Classe</th>
                            <th>Ação</th>
                        </tr>
                    </thead>

                    <tbody>
                        <% for(Titulo titulo : lista) { %>
                        <tr>
                            <td><%=titulo.getId()%></td>
                            <td><%=titulo.getTitulo()%></td>
                            <td><%=titulo.getAtores()%></td>
                            <td><%=titulo.getDiretor().getNome()%></td>
                            <td><%=titulo.getAno()%></td>
                            <td><%=titulo.getSinopse()%></td>
                            <td><%=titulo.getCategoria()%></td>
                            <td><%=titulo.getClasse()%></td>
                            <td>
                                <button type="button" class=" botao botao--alterar">
                                    edit
                                </button>
                                <button type="button" class="botao botao--deletar"
                                    data-toggle="modal"
                                    data-target="#modalExcluir"
                                    data-id="<%=titulo.getId()%>"
                                    data-nome="titulo"
                                    data-route="/CrtCadastrarTitulo?operacao=excluirtitulo&id=">delete
                                </button>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                
                <a href="${pageContext.request.contextPath}/cadastro_titulo.jsp"><button type="button" class="botao botao--adicionar">Adicionar</button></a>
                
            </div>
        </section>
                
        <%@include  file="includes/modais/modal_excluir.jsp"%>
        <%@include  file="includes/scriptsJs.jsp"%>
    </body>
</html>
