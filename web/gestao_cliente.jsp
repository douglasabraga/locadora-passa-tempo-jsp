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
                                <button type="button" class=" botao botao--alterar">edit</button>
                                <a data-id="<%=cliente.getId()%>" onclick="confirmar(this)"><button class="botao botao--deletar">delete</button></a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                
                <a href="${pageContext.request.contextPath}/cadastro_cliente.jsp"><button type="button" class="botao botao--adicionar">Adicionar Sócio</button></a>
                 <a href="${pageContext.request.contextPath}/cadastro_dependente.jsp"><button type="button" class="botao botao--adicionar">Adicionar Dependente</button></a>
                    
            </div>
        </section>
        <script>
            function confirmar(componente){
                var id = componente.getAttribute("data-id");
                var c = confirm('Vai mesmo deletar esse cliente?  ' + id);
                if(c === true){
                    componente.setAttribute('href','CrtCadastrarCliente?operacao=excluircliente&id=' + id);
                }else{
                    return;
                }
            }
        </script>    
        <%@include  file="includes/scriptsJs.jsp"%> 
    </body>
</html>
