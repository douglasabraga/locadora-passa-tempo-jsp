<%@page import="model.domain.Dependente"%>
<%@page import="model.domain.Socio"%>
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
                    List<Cliente> lista = apl.getAll();
//                    List<Socio> listaSocio = apl.buscarSocios();
                %>
                
                <h1 class="titulo-tabela">Gestão de Clientes</h1>
                
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
                
                <div class="card card-default">
                    <div class="card-header text-center p-1">
                        <h2 class="text-primary">Clientes</h2>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table data-toggle="table" class="table table-striped table-hover table-sm" >
                                <thead>
                                    <tr>
                                        <th>Cód.</th>
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
                                        <% if(cliente.isEstahAtivo()){%>
                                            <td>ativo</td>
                                        <%} else {%>
                                            <td>não ativo</td>
                                        <%}%>
                                        <td class="text-center">
                                            <button type="button" class="btn btn-warning"
                                                data-toggle="modal"
                                                data-id="<%=cliente.getId()%>"
                                                <% if(cliente.getClass().getSimpleName().equals("Socio")){
                                                    Socio socio = (Socio)apl.getById(cliente.getId());%>
                                                    data-target="#modalEditarSocio" 
                                                    data-nome="<%=socio.getNome()%>"
                                                    data-data="<%=socio.getDtNascimento()%>"
                                                    data-sexo="<%=socio.getSexo()%>"
                                                    data-telefone="<%=socio.getTelefone()%>"
                                                    data-cpf="<%=socio.getCpf()%>"
                                                    data-endereco="<%=socio.getEndereco()%>"
                                                <%} else{ 
                                                    Dependente dependente = (Dependente)apl.getById(cliente.getId());%>
                                                    data-target="#modalEditarDependente" 
                                                    data-nome="<%=dependente.getNome()%>"
                                                    data-data="<%=dependente.getDtNascimento()%>"
                                                    data-sexo="<%=dependente.getSexo()%>"
                                                    
                                                <%}%>
                                                >
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
        <%@include  file="includes/modais/modal_editar_socio.jsp"%>  
        <%@include  file="includes/modais/modal_editar_dependente.jsp"%>
        <%@include  file="includes/modais/modal_excluir.jsp"%>
        <%@include  file="includes/modais/modal_msg.jsp"%>
        <%@include  file="includes/scriptsJs.jsp"%>
        ${msg}
        <script>
            $('#modalEditarSocio').on('show.bs.modal', function (e) {
                var id = $(e.relatedTarget).data('id');
                var nome = $(e.relatedTarget).data('nome');
                var data = $(e.relatedTarget).data('data');
                var sexo = $(e.relatedTarget).data('sexo');
                var telefone = $(e.relatedTarget).data('telefone');
                var cpf = $(e.relatedTarget).data('cpf');
                var endereco = $(e.relatedTarget).data('endereco');
                var modal = $(this);

                modal.find('#id').val(id);
                modal.find('#nome').val(nome);
                modal.find('#data').val(data);
                modal.find('#sexo').val(sexo);
                modal.find('#telefone').val(telefone);
                modal.find('#cpf').val(cpf);
                modal.find('#endereco').val(endereco);
                
            });
            
            $('#modalEditarDependente').on('show.bs.modal', function (e) {
                var id = $(e.relatedTarget).data('id');
                var nome = $(e.relatedTarget).data('nome');
                var data = $(e.relatedTarget).data('data');
                var sexo = $(e.relatedTarget).data('sexo');
                var modal = $(this);

                modal.find('#id').val(id);
                modal.find('#nome').val(nome);
                modal.find('#data').val(data);
                modal.find('#sexo').val(sexo);
            });
        </script>
    </body>
</html>
