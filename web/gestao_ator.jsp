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
            <div class="container container-sm">
                
                <% 
                    AplCadastrarAtor apl = new AplCadastrarAtor();
                    List<Ator> lista = apl.getAll();
                %>
                
                <h1 class="titulo-formulario">Gestão de Atores</h1>
                <div class="card card-default">
                    <div class="card-header text-center p-1">
                        <h2 class="text-primary">Atores</h2>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table data-toggle="table" class="table table-striped table-hover table-sm" >
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nome</th>
                                        <th class="text-center">
                                            <a href="${pageContext.request.contextPath}/cadastro_ator.jsp">
                                                <button type="button" class="btn btn-success">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </a>
                                        </th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <% for(Ator ator : lista) { %>
                                    <tr>
                                        <td><%=ator.getId()%></td>
                                        <td><%=ator.getNome()%></td>
                                        <td class="text-center"> 
                                            <button type="button" class="btn btn-warning">
                                                <i class="fa fa-edit"></i>
                                            </button>
                                            <button type="button" class="btn btn-danger"
                                                data-toggle="modal"
                                                data-target="#modalExcluir"
                                                data-id="<%=ator.getId()%>"
                                                data-nome="ator"
                                                data-route="/CrtCadastrarAtor?operacao=excluirator&id=">
                                                <i class="fa fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
       
        <%@include  file="includes/modais/modal_excluir.jsp"%>
        <%@include  file="includes/modais/modal_msg.jsp"%>
        <%@include  file="includes/scriptsJs.jsp"%>
        ${msg};
   
    </body>
</html>
