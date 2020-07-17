<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.domain.Item"%>
<%@page import="model.application.AplCadastrarItem"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include  file="includes/head.jsp"%>
        <title>Passa Tempo | Gestão de Item</title>
    </head>
    <body>
        <header class="layout-cabecalho">
            <%@include  file="includes/header.jsp"%>
        </header>

        <section class="layout-formulario">
            <div class="container">
                
                <% 
                    AplCadastrarItem apl = new AplCadastrarItem();
                    List<Item> lista = apl.buscarTodos();
                %>
                
                <h1 class="titulo-formulario">Gestão de Item</h1>
                <div class="card card-default">
                    <div class="card-header text-center p-1">
                        <h2 class="text-primary">Itens</h2>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table data-toggle="table" class="table table-stripedtable-hover table-sm" >
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Numero Serie</th>
                                        <th>Data Aquisição</th>
                                        <th>Tipo</th>
                                        <th>Titulo</th>
                                        <th class="text-center">
                                            <a href="${pageContext.request.contextPath}/cadastro_item.jsp">
                                                <button type="button" class="btn btn-success">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </a>
                                        </th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <% for(Item item : lista) { %>
                                    <tr>
                                        <td><%=item.getId()%></td>
                                        <td><%=item.getNumSerie()%></td>
                                        <td><%=item.getDtAquisicao()%></td>
                                        <td><%=item.getTipoItem()%></td>
                                        <td><%=item.getTitulo().getTitulo()%></td>
                                        <td class="text-center">
                                            <button type="button" class="btn btn-warning">
                                                <i class="fa fa-edit"></i>
                                            </button>
                                            <button type="button" class="btn btn-danger"
                                                data-toggle="modal"
                                                data-target="#modalExcluir"
                                                data-id="<%=item.getId()%>"
                                                data-nome="item"
                                                data-route="/CrtCadastrarItem?operacao=excluiritem&id=">
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
