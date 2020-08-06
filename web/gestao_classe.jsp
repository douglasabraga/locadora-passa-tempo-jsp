<%@page import="model.domain.Classe"%>
<%@page import="model.application.AplCadastrarClasse"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include  file="includes/head.jsp"%>
        <title>Passa Tempo | Gestão de Classe</title>
    </head>
    <body>
        <header class="layout-cabecalho">
            <%@include  file="includes/header.jsp"%>
        </header>

        <section class="layout-formulario">
            <div class="container">
                
                <h1 class="titulo-tabela">Gestão de Classes</h1>
                <div class="grupo-entrada card card-default">
                    <div class="card-header text-center p-1">
                        <h2 class="text-primary">Filtro</h2>
                    </div>
                    <div class="card-body" >
                        <div class="row">
                            <div class="col-11">
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
                    AplCadastrarClasse apl = new AplCadastrarClasse();
                    List<Classe> lista = apl.getAll();                    
                %>
                
                
                <div class="card card-default">
                    <div class="card-header text-center p-1">
                        <h2 class="text-primary">Classes</h2>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table data-toggle="table" class="table table-striped table-hover table-sm" >
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nome</th>
                                        <th>Prazo Dev.</th>
                                        <th>Valor</th>
                                        <th class="text-center">
                                            <a href="${pageContext.request.contextPath}/cadastro_classe.jsp">
                                                <button type="button" class="btn btn-success">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </a>
                                        </th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <% for(Classe classe : lista) { %>
                                    <tr>
                                        <td><%=classe.getId()%></td>
                                        <td><%=classe.getNome()%></td>
                                        <td><%=classe.getPrazoDevolucao()%></td>
                                        <td><%=classe.getValor()%></td>
                                        <td class="text-center">
                                             <button type="button" class="btn btn-warning"
                                                data-toggle="modal"
                                                data-target="#modalEditar"
                                                data-id="<%=classe.getId()%>"
                                                data-nome="<%=classe.getNome()%>"
                                                data-prazo="<%=classe.getPrazoDevolucao()%>"
                                                data-valor="<%=classe.getValor()%>">
                                                <i class="fa fa-edit"></i>
                                            </button>
                                            <button type="button" class="btn btn-danger"
                                                data-toggle="modal"
                                                data-target="#modalExcluir"
                                                data-id="<%=classe.getId()%>"
                                                data-nome="classe"
                                                data-route="/CrtCadastrarClasse?operacao=excluirclasse&id=">
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
        <%@include  file="includes/modais/modal_editar_classe.jsp"%>                
        <%@include  file="includes/modais/modal_excluir.jsp"%>
        <%@include  file="includes/modais/modal_msg.jsp"%>
        <%@include  file="includes/scriptsJs.jsp"%>
        <script>
            $('#modalEditar').on('show.bs.modal', function (e) {
                var id = $(e.relatedTarget).data('id');
                var nome = $(e.relatedTarget).data('nome');
                var prazo = $(e.relatedTarget).data('prazo');
                var valor = $(e.relatedTarget).data('valor');
                var modal = $(this);

                modal.find('.id').val(id);
                modal.find('#txt_nome').val(nome);
                modal.find('#prazo').val(prazo);
                modal.find('#number_valor').val(valor);
            });
        </script>
        ${msg}
    </body>
</html>
