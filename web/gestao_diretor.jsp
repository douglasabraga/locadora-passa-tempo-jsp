<%@page import="model.domain.Diretor"%>
<%@page import="model.application.AplCadastrarDiretor"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include  file="includes/head.jsp"%>
        <title>Passa Tempo | Gestão de Diretor</title>
    </head>
    <body>
        <header class="layout-cabecalho">
            <%@include  file="includes/header.jsp"%>
        </header>

        <section class="layout-formulario">
            <div class="container table-responsive">
                <h1 class="titulo-formulario">Gestão de Diretores</h1>
                <% 
                    AplCadastrarDiretor apl = new AplCadastrarDiretor();
                    List<Diretor> lista = apl.buscarTodos();
                    
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
                        <% for(Diretor diretor : lista) { %>
                        <tr>
                            <td><%=diretor.getId()%></td>
                            <td><%=diretor.getNome()%></td>
                            <td>
                                <button type="button" class=" botao botao--alterar" data-toggle="modal" data-target="#modalEditar">edit</button>
                                <a data-id="<%=diretor.getId()%>" onclick="confirmar(this)"><button class="botao botao--deletar">delete</button></a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                
                <a href="${pageContext.request.contextPath}/cadastro_diretor.jsp"><button type="button" class="botao botao--adicionar">Adicionar</button></a>
                
            </div>
        </section>
        <script>
            function confirmar(componente){
                var id = componente.getAttribute("data-id");
                var c = confirm('Vai mesmo deletar esse Diretor?  ' + id);
                if(c === true){
                    componente.setAttribute('href','CrtCadastrarDiretor?operacao=excluirdiretor&id=' + id);
                }else{
                    return;
                }
            }
        </script> 
        <%@include  file="includes/scriptsJs.jsp"%>
    </body>
</html>
