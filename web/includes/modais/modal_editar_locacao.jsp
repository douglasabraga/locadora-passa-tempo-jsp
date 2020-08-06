<%@page import="model.application.AplCadastrarItem"%>
<%@page import="model.application.AplCadastrarCliente"%>
<%@page import="model.domain.Item"%>
<%@page import="model.domain.Cliente"%>
<%@page import="java.util.List"%>


<%
    AplCadastrarCliente aplCliente = new AplCadastrarCliente();
    AplCadastrarItem aplItem = new AplCadastrarItem();
%>

<!-- Modal EDITAR -->
<div class="modal fade" id="modalEditar" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" class="titulo-formulario">Alterar Locação</h3>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <div class="container">
                    
                    <form  method="post" action="CrtCadastrarLocacao">
                        
                        <input type="hidden" name="operacao" value="alterar">
                        
                        <div class="row">
                        <div class="col-2">
                            <label for="id">Id</label>
                            <input type="number" name="id" id="id" class="campo">
                        </div>
                        <div class="col-sm-7">
                            <div class="grupo-entrada">
                                <label for="cliente">Cliente</label>
                                <select id="cliente" name="cliente" class="campo" required>
                                    <% for(Cliente cliente : aplCliente.getAll()){ %>
                                        <option  class="dropdown-item" value="<%=cliente.getId()%>"><%=cliente.getNome()%></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-3">                            
                            <div class="grupo-entrada">
                                <label for="item">Item</label>
                                <select id="item" name="item" class="campo" required>
                                    <% for(Item item : aplItem.getAll()){ %>
                                        <option  class="dropdown-item" value="<%=item.getId()%>"><%=item.getNumSerie()%></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>                        
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="grupo-entrada">
                                <label for="data">Data Dev. Prevista</label>
                                <input type="date" name="data" id="data" class="campo" required>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="grupo-entrada">
                                <label for="valor">Valor</label>
                                <input type="number" name="valor" id="valor" class="campo" required>
                            </div>
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