<%@page import="model.domain.Titulo"%>
<%@page import="model.application.AplCadastrarTitulo"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <%@include  file="includes/head.jsp"%>
        <title>Passa Tempo | Gestão de Titulo</title>
    </head>
    <body>
        <header class="layout-cabecalho">
            <%@include  file="includes/header.jsp"%>
        </header>

        <section class="layout-formulario">
            <div class="container mb-20">
                <h1 class="titulo-tabela">Gestão de Titulos</h1>
                
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
            </div>    
                <% 
                    AplCadastrarTitulo apl = new AplCadastrarTitulo();
                    List<Titulo> lista = apl.getAll();
                %>
  
            <div class="container">    
                <div class="card card-default">
                    <div class="card-header text-center p-1">
                        <h2 class="text-primary">Titulos</h2>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table data-toggle="table" class="table table-striped table-hover table-sm" >
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Nome titulo</th>
                                        <th>Atores</th>
                                        <th>Diretor</th>
                                        <th>Ano</th>
                                        <th>Sinopse</th>
                                        <th>Categoria</th>
                                        <th>Classe</th> 
                                        <th class="text-center">
                                            <a href="${pageContext.request.contextPath}/cadastro_titulo.jsp">
                                                <button type="button" class="btn btn-success">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </a>
                                        </th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <% for(Titulo titulo : lista) { %>
                                    <tr>
                                        <td><%=titulo.getId()%></td>
                                        <td><%=titulo.getTitulo()%></td>
                                        <td><%=titulo.getAtores()%></td>
                                        <td><%=titulo.getDiretor().getNome()%></td>
                                        <td><%=titulo.getAno()%></td>
                                        <td><%=titulo.getSinopse()%></td>
                                        <td><%=titulo.getCategoria()%></td>
                                        <td><%=titulo.getClasse()%></td>
                                        <td class="text-center">
                                            <button type="button" class=" btn btn-warning"
                                                data-toggle="modal"
                                                data-target="#modalEditar"
                                                data-id="<%=titulo.getId()%>"
                                                data-nome="<%=titulo.getTitulo()%>"
                                                data-atores="<%=titulo.getAtores()%>"
                                                data-diretor="<%=titulo.getDiretor().getId()%>"
                                                data-ano="<%=titulo.getAno()%>"
                                                data-sinopse="<%=titulo.getSinopse()%>"
                                                data-categoria="<%=titulo.getCategoria()%>"
                                                data-classe="<%=titulo.getClasse().getId()%>"
                                                >
                                                <i class="fa fa-edit"></i>
                                            </button>
                                            <button type="button" class="btn btn-danger"
                                                data-toggle="modal"
                                                data-target="#modalExcluir"
                                                data-id="<%=titulo.getId()%>"
                                                data-nome="titulo"
                                                data-route="/CrtCadastrarTitulo?operacao=excluirtitulo&id=">
                                                <i class="fa fa-trash"></i>
                                            </button>
<!--                                            <button type="button" class="btn btn-info">
                                                <i class="fa fa-eye"></i>
                                            </button>-->
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
        <%@include  file="includes/modais/modal_editar_titulo.jsp"%>
        <%@include  file="includes/modais/modal_excluir.jsp"%>
        <%@include  file="includes/modais/modal_msg.jsp"%>
        <%@include  file="includes/scriptsJs.jsp"%>
        <script>
            $('#modalEditar').on('show.bs.modal', function (e) {
                var id = $(e.relatedTarget).data('id');
                var nome = $(e.relatedTarget).data('nome');
//                var atores[] = $(e.relatedTarget).data('atores');
                var diretor = $(e.relatedTarget).data('diretor');
                var ano = $(e.relatedTarget).data('ano');
                var sinopse = $(e.relatedTarget).data('sinopse');
                var categoria = $(e.relatedTarget).data('categoria');
                var classe = $(e.relatedTarget).data('classe');
                
                var modal = $(this);

                modal.find('#id').val(id);
                modal.find('#titulo').val(nome);
//                modal.find('#ator').val(id);
                modal.find('#diretor').val(diretor);
                modal.find('#ano').val(ano);
                modal.find('#sinopse').val(sinopse);
                modal.find('#categoria').val(categoria);
                modal.find('#classe').val(classe);
            });
        </script>
        ${msg};
        
    </body>
</html>
