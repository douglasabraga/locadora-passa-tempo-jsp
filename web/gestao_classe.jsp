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
            <div class="container table-responsive">
                <h1 class="titulo-formulario">Gestão de Classes</h1>
                <% 
                    AplCadastrarClasse apl = new AplCadastrarClasse();
                    List<Classe> lista = apl.buscarTodos();
                    
                    //if(lista.size() > 0) {
                %>
                <table data-toggle="table" class="table table-striped condensed table-hover" >
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nome</th>
                            <th>Prazo de Devolução</th>
                            <th>Valor</th>
                            <th>Ação</th>
                        </tr>
                    </thead>

                    <tbody>
                        <% for(Classe classe : lista) { %>
                        <tr>
                            <td><%=classe.getId()%></td>
                            <td><%=classe.getNome()%></td>
                            <td><%=classe.getPrazoDevolucao()%></td>
                            <td><%=classe.getValor()%></td>
                            <td>
                                <button type="button" class=" botao botao--alterar">edit</button>
                                <a data-id="<%=classe.getId()%>" onclick="confirmar(this)"><button class="botao botao--deletar">delete</button></a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                
                <a href="${pageContext.request.contextPath}/cadastro_classe.jsp"><button type="button" class="botao botao--adicionar">Adicionar</button></a>
                
            </div>
        </section>
        <script>
            function confirmar(componente){
                var id = componente.getAttribute("data-id");
                var c = confirm('Vai mesmo deletar essa Classe?  ' + id);
                if(c === true){
                    componente.setAttribute('href','CrtCadastrarClasse?operacao=excluirclasse&id=' + id);
                }else{
                    return;
                }
            }
        </script>   
        <%@include  file="includes/scriptsJs.jsp"%>
    </body>
</html>
