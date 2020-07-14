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
            <div class="container table-responsive">
                <h1 class="titulo-formulario">Gestão de Item</h1>
                <% 
                    AplCadastrarItem apl = new AplCadastrarItem();
                    List<Item> lista = apl.buscarTodos();
                    
                    //if(lista.size() > 0) {
                %>
                <table data-toggle="table" class="table table-striped condensed table-hover" >
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Numero Serie</th>
                            <th>Data Aquisição</th>
                            <th>Tipo</th>
                            <th>Titulo</th>
                            <th>Ação</th>
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
                            <td>
                                <button type="button" class=" botao botao--alterar" >edit</button>
                                <a data-id="<%=item.getId()%>" onclick="confirmar(this)"><button class="botao botao--deletar">delete</button></a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                
                <a href="${pageContext.request.contextPath}/cadastro_item.jsp"><button type="button" class="botao botao--adicionar">Adicionar</button></a>
                
            </div>
        </section>
        <script>
            function confirmar(componente){
                var id = componente.getAttribute("data-id");
                var c = confirm('Vai mesmo deletar esse item?  ' + id);
                if(c === true){
                    componente.setAttribute('href','CrtCadastrarItem?operacao=excluiritem&id=' + id);
                }else{
                    return;
                }
            }
        </script> 
        <%@include  file="includes/scriptsJs.jsp"%>
    </body>
</html>
