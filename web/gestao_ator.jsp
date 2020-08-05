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
                <h1 class="titulo-tabela">Gestão de Atores</h1>
                
                <div class="grupo-entrada card card-default">
                    <div class="card-header text-center p-1">
                        <h2 class="text-primary">Filtro</h2>
                    </div>
                    <div class="card-body" >
                        <div class="row">
                            <div class="col-10">
                                <input type="text" name="nome" id="nome" class="campo" placeholder="Nome">
                            </div>
                            <div class="col-1">
                                <button type="button" class=" botao botao--pesquisar btn-info btn-lg">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                
                <% 
                    AplCadastrarAtor apl = new AplCadastrarAtor();
                    List<Ator> lista = apl.getAll();
                %>
                
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
                                            <button type="button" class="btn btn-warning"
                                                data-toggle="modal"
                                                data-target="#modalEditar"
                                                data-id="<%=ator.getId()%>"
                                                data-nome="<%=ator.getNome()%>">
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
        <%@include  file="includes/modais/modal_editar_ator.jsp"%>
        <%@include  file="includes/modais/modal_excluir.jsp"%>
        <%@include  file="includes/modais/modal_msg.jsp"%>
        <%@include  file="includes/scriptsJs.jsp"%>
        <script>
            $('#modalEditar').on('show.bs.modal', function (e) {
                var id = $(e.relatedTarget).data('id');
                var nome = $(e.relatedTarget).data('nome');
//                var route = $(e.relatedTarget).data('route') + id + '&nome=';
                var modal = $(this);

                modal.find('#nome-autor').val(nome);
                modal.find('#id').val(id);
//                modal.find('.modal-footer .btn-primary').attr("onclick", "location.href='${pageContext.request.contextPath}"+route+"'");
            });
        </script>
        ${msg};
    </body>
</html>
