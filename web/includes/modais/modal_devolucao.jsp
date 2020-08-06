<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!-- Modal EDITAR -->

<%
    SimpleDateFormat saida = new SimpleDateFormat("yyyy-MM-dd"); 
    String result = saida.format(new Date());
%>


<div class="modal fade" id="modalDevolucao" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" class="titulo-formulario">Devolução</h3>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <div class="container">
                    
                    <form  method="post" action="CrtCadastrarLocacao">
                        
                        <input type="hidden" name="operacao" value="devolver">
                        
                        <div class="row">
                            <div class="col-sm-2">
                                <label for="id">Id</label>
                                <input type="number" name="id" id="id_dev" class="campo">
                            </div>
                            <div class="col-sm-5">
                                <label for="data">Data Dev. Prevista</label>
                                <input type="date" name="data" id="data_dev" class="campo" disabled>
                            </div>
                            <div class="col-sm-5">
                                <label for="dataPrev">Data Dev. Efetivada</label>

                                <input type="date" name="dataEfet" id="dataEfet" value="<%=result%>" class="campo" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="grupo-entrada">
                                    <label for="valor">Valor a ser Cobrado</label>
                                    <input type="text" name="valor_dev" id="valor_dev"  class="campo" required>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="grupo-entrada">
                                    <label for="multa">Multa</label>
                                    <input type="text" name="multa" id="multa" min="0.00" value="0.00" class="campo" required>
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