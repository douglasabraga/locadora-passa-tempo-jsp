<%@page import="model.domain.Diretor"%>
<%@page import="model.application.AplCadastrarDiretor"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include  file="includes/head.jsp"%>
        <title>Passa Tempo | Gest�o de Diretor</title>
    </head>
    <body>
        <header class="layout-cabecalho">
            <%@include  file="includes/header.jsp"%>
        </header>

        <section class="layout-formulario">
            <div class="container container-sm">
                
                <% 
                    AplCadastrarDiretor apl = new AplCadastrarDiretor();
                    List<Diretor> lista = apl.getAll();
                %>
                
                <h1 class="titulo-tabela">Gest�o de Diretores</h1>
                
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
                
                <div class="card card-default">
                    <div class="card-header text-center p-1">
                        <h2 class="text-primary">Diretores</h2>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table data-toggle="table" class="table table-striped table-hover table-sm" >
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nome</th>
                                        <th class="text-center">
                                            <a href="${pageContext.request.contextPath}/cadastro_diretor.jsp">
                                                <button type="button" class="btn btn-success">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </a>
                                        </th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <% for(Diretor diretor : lista) { %>
                                    <tr>
                                        <td><%=diretor.getId()%></td>
                                        <td><%=diretor.getNome()%></td>
                                        <td class="text-center"> 
                                            <button type="button" class="btn btn-warning"
                                                data-toggle="modal"
                                                data-target="#modalEditar"
                                                data-id="<%=diretor.getId()%>"
                                                data-nome="<%=diretor.getNome()%>">
                                                <i class="fa fa-edit"></i>
                                            </button>
                                            <button type="button" class="btn btn-danger"
                                                data-toggle="modal"
                                                data-target="#modalExcluir"
                                                data-id="<%=diretor.getId()%>"
                                                data-nome="diretor"
                                                data-route="/CrtCadastrarDiretor?operacao=excluirdiretor&id=">
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
        <%@include  file="includes/modais/modal_editar_diretor.jsp"%>         
        <%@include  file="includes/modais/modal_excluir.jsp"%>
        <%@include  file="includes/modais/modal_msg.jsp"%>
        <%@include  file="includes/scriptsJs.jsp"%>
        <script>
            $('#modalEditar').on('show.bs.modal', function (e) {
                var id = $(e.relatedTarget).data('id');
                var nome = $(e.relatedTarget).data('nome');
                var modal = $(this);
                
                modal.find('#id').val(id);
                modal.find('#txt_nome').val(nome);
            });
        </script>
        ${msg};
        
    </body>
</html>
