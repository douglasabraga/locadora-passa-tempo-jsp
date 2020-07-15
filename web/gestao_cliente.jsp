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
            <div class="container table-responsive">
                <h1 class="titulo-formulario">Gestão de Clientes</h1>
                <% 
                    AplCadastrarCliente apl = new AplCadastrarCliente();
                    List<Cliente> lista = apl.buscarTodos();
                    
                    //if(lista.size() > 0) {
                %>
                <table data-toggle="table" class="table table-striped condensed table-hover" >
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nome</th>
                            <th>Data de Nascimento</th>
                            <th>Sexo</th>
                            <th>Tipo</th>
                            <th>Status</th>
                            <th>Ação</th>
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
                            <td>
                                <button type="button" class=" botao botao--alterar">
                                    edit
                                </button>
                                <button type="button" class="botao botao--deletar"
                                    data-toggle="modal"
                                    data-target="#modalExcluir"
                                    data-id="<%=cliente.getId()%>"
                                    data-nome="<%=cliente.getClass().getSimpleName()%>"
                                    data-route="/CrtCadastrarCliente?operacao=excluircliente&id=">delete
                                </button>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                
                <a href="${pageContext.request.contextPath}/cadastro_cliente.jsp"><button type="button" class="botao botao--adicionar">Adicionar Sócio</button></a>
                <a href="${pageContext.request.contextPath}/cadastro_dependente.jsp"><button type="button" class="botao botao--adicionar">Adicionar Dependente</button></a>
                    
            </div>
        </section>
        <%@include  file="includes/modais/modal_excluir.jsp"%>
        <%@include  file="includes/scriptsJs.jsp"%>
    </body>
</html>
