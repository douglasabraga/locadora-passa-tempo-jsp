<%@page import="model.domain.Cliente"%>
<%@page import="model.application.AplCadastrarCliente"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include  file="includes/head.jsp"%>
        <title>Passa Tempo | Gestão de Clientes</title>
    </head>
    <body>
        <header class="layout-cabecalho">
            <%@include  file="includes/header.jsp"%>
        </header>

        <section class="layout-formulario">
            <div class="container">
                
                <% 
                    AplCadastrarCliente apl = new AplCadastrarCliente();
                    List<Cliente> lista = apl.buscarTodos();
                %>
                
                <h1 class="titulo-formulario">Gestão de Clientes</h1>
                <div class="card card-default">
                    <div class="card-header text-center p-1">
                        <h2 class="text-primary">Clientes</h2>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table data-toggle="table" class="table table-striped table-hover table-sm" >
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nome</th>
                                        <th>Dt. Nascimento</th>
                                        <th>Sexo</th>
                                        <th>Tipo</th>
                                        <th>Status</th>
                                        <th class="text-center">
                                            <a href="${pageContext.request.contextPath}/cadastro_cliente.jsp">
                                                <button type="button" class="btn btn-success">
                                                    <i class="fa fa-plus"></i> Sócio
                                                </button>
                                            </a>
                                            <a href="${pageContext.request.contextPath}/cadastro_dependente.jsp">
                                                <button type="button" class="btn btn-success">
                                                    <i class="fa fa-plus"></i> Dep
                                                </button>
                                            </a>
                                        </th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <% for(Cliente cliente : lista) { %>
                                    <tr>
                                        <td><%=cliente.getId()%></td>
                                        <td><%=cliente.getNome()%></td>
                                        <td><%=cliente.getDtNascimento()%></td>
                                        <td><%=cliente.getSexo()%></td>
                                        <td><%=cliente.getClass().getSimpleName()%></td>
                                        <td><%=cliente.isEstahAtivo()%></td>
                                        <td class="text-center">
                                            <button type="button" class="btn btn-warning">
                                                <i class="fa fa-edit"></i>
                                            </button>
                                            <button type="button" class="btn btn-danger"
                                                data-toggle="modal"
                                                data-target="#modalExcluir"
                                                data-id="<%=cliente.getId()%>"
                                                data-nome="<%=cliente.getClass().getSimpleName()%>"
                                                data-route="/CrtCadastrarCliente?operacao=excluircliente&id=">
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
        <%@include  file="includes/scriptsJs.jsp"%>
    </body>
</html>
