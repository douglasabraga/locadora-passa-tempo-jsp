<%@page import="model.domain.Titulo"%>
<%@page import="model.application.AplCadastrarTitulo"%>
<%@page import="model.domain.Titulo"%>
<%@page import="model.domain.Item"%>
<%@page import="java.util.List"%>


<%
    AplCadastrarTitulo aplTitulo = new AplCadastrarTitulo();
    //Item item = (Item)request.getAttribute("item");
%>

<!-- Modal EDITAR -->
<div class="modal fade" id="modalEditar" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" class="titulo-formulario">Alterar Item</h3>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <div class="container">
                    
                    <form  method="post" action="CrtCadastrarItem">
                        
                        <input type="hidden" name="operacao" value="alterar">
                        
                        <div class="grupo-entrada">
                            <div class="row">
                                <div class="col-2">
                                    <label for="id">Id</label>
                                    <input type="number" name="id" id="id" class="campo">
                                </div>
                                <div class="col-10">
                                    <div class="grupo-entrada">
                                        <label for="numero">Numero de Série</label>
                                        <input type="number" min="0" name="numero" id="numero" class="campo" required>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                        
                                <div class="col-sm-6">
                                    <div class="grupo-entrada">
                                        <label for="data">Data de Aquisição</label>
                                        <input type="date" name="data" id="data" class="campo" required>
                                    </div>
                                </div>

                                <div class="col-sm-6">
                                    <div class="grupo-entrada">
                                        <label for="tipo">Tipo</label>
                                        <input type="text" name="tipo" id="tipo" class="campo" required>
                                    </div>
                                </div>
                            </div>
                            <div class="grupo-entrada">
                                <label for="titulo">Titulo</label>
                                <select id="titulo" name="titulo" class="campo" required>
                                    <% for(Titulo titulo : aplTitulo.getAll()){ %>
                                        <option value="<%=titulo.getId()%>"><%=titulo.getTitulo()%></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                        
                        <div class="modal-footer">
                            <input type="submit" value="Salvar" class="btn btn-primary btn-lg">
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>