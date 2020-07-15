<%@page import="model.domain.Ator"%>
<%@page import="model.application.AplCadastrarAtor"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include  file="includes/head.jsp"%>
        <title>Passa Tempo | Gestão de Ator</title>
    </head>
    <body>
        <header class="layout-cabecalho">
            <%@include  file="includes/header.jsp"%>
        </header>

        <section class="layout-formulario">
            <div class="container table-responsive">
                <h1 class="titulo-formulario">Gestão de Atores</h1>
                <% 
                    AplCadastrarAtor apl = new AplCadastrarAtor();
                    List<Ator> lista = apl.buscarTodos();
                    
                    //if(lista.size() > 0) {
                %>
                <table data-toggle="table" class="table table-striped condensed table-hover" >
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nome</th>
                            <th>Ação</th>
                        </tr>
                    </thead>

                    <tbody>
                        <% for(Ator ator : lista) { %>
                        <tr>
                            <td><%=ator.getId()%></td>
                            <td><%=ator.getNome()%></td>
                            <td> 
                                <button type="button" class=" botao botao--alterar">
                                    edit
                                </button>
                                <button type="button" class="botao botao--deletar"
                                    data-toggle="modal"
                                    data-target="#modalExcluir"
                                    data-id="<%=ator.getId()%>"
                                    data-nome="ator"
                                    data-route="/CrtCadastrarAtor?operacao=excluirator&id=">delete
                                </button>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                
                <a href="${pageContext.request.contextPath}/cadastro_ator.jsp"><button type="button" class="botao botao--adicionar">Adicionar</button></a>
                    
            </div>
        </section>
          <!-- Modal Excluir-->
        <%@include  file="includes/modais/modal_excluir.jsp"%>
        <%@include  file="includes/scriptsJs.jsp"%>
   
    </body>
</html>
