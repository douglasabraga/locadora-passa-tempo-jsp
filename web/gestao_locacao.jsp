<%@page import="model.domain.Locacao"%>
<%@page import="model.application.AplCadastrarLocacao"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include  file="includes/head.jsp"%>
        <title>Passa Tempo | Gestão de Locações</title>
    </head>
    <body>
        <header class="layout-cabecalho">
            <%@include  file="includes/header.jsp"%>
        </header>

        <section class="layout-formulario">
            <div class="container">
                
                <% 
                    AplCadastrarLocacao apl = new AplCadastrarLocacao();
                    List<Locacao> lista = apl.getAll();
                %>
                
                <h1 class="titulo-tabela">Gestão de Locações</h1>
                
                <div class="grupo-entrada card card-default">
                    <div class="card-header text-center p-1">
                        <h2 class="text-primary">Filtro</h2>
                    </div>
                    <div class="card-body" >
                        <div class="row">
                            <div class="col-11">
                                <input type="text" name="nome" id="nome" class="campo" placeholder="Cliente">
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
                        <h2 class="text-primary">Locações</h2>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table data-toggle="table" class="table table-striped table-hover table-sm" >
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Cliente</th>
                                        <th>Item</th>
                                        <th>Valor</th>
                                        <th>Data Locação</th>
                                        <th>Data Dev Prevista</th>
                                        
                                        <th class="text-center">
                                            <a href="${pageContext.request.contextPath}/cadastro_locacao.jsp">
                                                <button type="button" class="btn btn-success">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </a>
                                            
                                                <button type="button" class="btn btn-secondary"
                                                        data-toggle="modal"
                                                        data-target="#modalDevolvidos">
                                                    <i class="fa fa-eye"></i>
                                                </button>
                                            </a
                                        </th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <% for(Locacao locacao : lista) { %>
                                        <% if(locacao.getDtDevolucaoEfetiva() == null) {%>
                                            <tr>
                                                <td><%=locacao.getId()%></td>
                                                <td><%=locacao.getCliente().getNome()%></td>
                                                <td><%=locacao.getItem().getNumSerie()%></td>
                                                <td><%=locacao.getItem().getTitulo().getClasse().getValor()%></td>
                                                <td><%=locacao.getDtLocacao()%></td>
                                                <td><%=locacao.getDtDevolucaoPrevista()%></td>
                                                <td class="text-center">
                                                    <button type="button" class="btn btn-info"
                                                        data-toggle="modal"
                                                        data-target="#modalDevolucao"
                                                        data-id="<%=locacao.getId()%>"
                                                        data-data="<%=locacao.getDtDevolucaoPrevista()%>"
                                                        data-valor="<%=locacao.getItem().getTitulo().getClasse().getValor()%>">
                                                        <i class="fa fa-check"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-warning"
                                                        data-toggle="modal"
                                                        data-target="#modalEditar"
                                                        data-id="<%=locacao.getId()%>"
                                                        data-cliente="<%=locacao.getCliente().getId()%>"
                                                        data-item="<%=locacao.getItem().getId()%>"
                                                        data-valor="<%=locacao.getItem().getTitulo().getClasse().getValor()%>"
                                                        data-data="<%=locacao.getDtDevolucaoPrevista()%>">
                                                        <i class="fa fa-edit"></i>
                                                    </button>
                                                    <button type="button" class="btn btn-danger"
                                                        data-toggle="modal"
                                                        data-target="#modalExcluir"
                                                        data-id="<%=locacao.getId()%>"
                                                        data-nome="locacao"
                                                        data-route="/CrtCadastrarLocacao?operacao=excluirlocacao&id=">
                                                        <i class="fa fa-trash"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        <% } %>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include  file="includes/modais/modal_devolvidos.jsp"%>                                                        
        <%@include  file="includes/modais/modal_devolucao.jsp"%>                        
        <%@include  file="includes/modais/modal_editar_locacao.jsp"%>
        <%@include  file="includes/modais/modal_excluir.jsp"%>
        <%@include  file="includes/modais/modal_msg.jsp"%>
        <%@include  file="includes/scriptsJs.jsp"%>
        <script>
            $('#modalDevolucao').on('show.bs.modal', function (e) {
                var id = $(e.relatedTarget).data('id');
                var valor = $(e.relatedTarget).data('valor');
                var data = $(e.relatedTarget).data('data');
                var modal = $(this);

                modal.find('#id_dev').val(id);
                modal.find('#valor_dev').val(valor);
                modal.find('#data_dev').val(data);
            });
            
            $('#modalEditar').on('show.bs.modal', function (e) {
                var id = $(e.relatedTarget).data('id');
                var cliente = $(e.relatedTarget).data('cliente');
                var item = $(e.relatedTarget).data('item');
                var valor = $(e.relatedTarget).data('valor');
                var data = $(e.relatedTarget).data('data');
                var modal = $(this);

                modal.find('#id').val(id);
                modal.find('#cliente').val(cliente);
                modal.find('#item').val(item);
                modal.find('#valor').val(valor);
                modal.find('#data').val(data);
            });
        </script>
        ${msg};
   
    </body>
</html>
