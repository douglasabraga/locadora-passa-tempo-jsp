<%@page import="model.domain.Locacao"%>
<%@page import="java.util.List"%>
<%@page import="model.application.AplCadastrarLocacao"%>
<!-- Modal DEVOLVIDOS -->
<div class="modal fade" id="modalDevolvidos" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content ">
            <div class="modal-header">
                <h3 class="modal-title" class="titulo-formulario">Devolvidos</h3>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <div class="card card-default">
                    <div class="card-header text-center p-1">
                        <h2 class="text-primary">Devolvidos</h2>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table data-toggle="table" class="table table-striped table-hover table-sm" >
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Cliente</th>
                                        <th>Item</th>
                                        <th>Data Locação</th>
                                        <th>Data Dev Prevista</th>
                                        <th>Data Dev Efetiva</th>
                                        <th>Valor Locação</th>
                                        <th>Multa</th>
                                    </tr>
                                </thead>
                              
                                <tbody>
                                    <% 
                                        AplCadastrarLocacao aplLoc = new AplCadastrarLocacao();
                                        List<Locacao> listaLoc = aplLoc.getAll();
                                    %>
                                    <% for(Locacao item : listaLoc) { %>
                                        <% if(item.getDtDevolucaoEfetiva() != null) {%>
                                            <tr>
                                                <td><%=item.getId()%></td>
                                                <td><%=item.getCliente().getNome()%></td>
                                                <td><%=item.getItem().getNumSerie()%></td>
                                                <td><%=item.getDtLocacao()%></td>
                                                <td><%=item.getDtDevolucaoPrevista()%></td>
                                                <td><%=item.getDtDevolucaoEfetiva()%></td>
                                                <td><%=item.getValorCobrado()%></td>
                                                <td><%=item.getMultaCobrada()%></td>
                                            </tr>
                                        <% } %>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>