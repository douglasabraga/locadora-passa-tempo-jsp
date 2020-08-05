<!-- Modal EDITAR -->
<div class="modal fade" id="modalEditar" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" class="titulo-formulario">Alterar Classe</h3>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <div class="container">
                    
                    <form  method="post" action="CrtCadastrarClasse">
                        
                        <input type="hidden" name="operacao" value="alterar">
                        
                        <div class="grupo-entrada">
                            <div class="row">
                                <div class="col-2">
                                    <label for="id">Id</label>
                                    <input type="number" name="id" id="id" class="campo">
                                </div>
                                <div class="col-10">
                                    <label for="txt_nome">Nome</label>
                                    <input type="text" name="txt_nome" id="txt_nome" class="campo" required>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            
                            <div class="col-sm-6">
                                <div class="grupo-entrada">
                                    <label for="number_prazo">Prazo Devolução</label>
                                    <input type="number"  name="number_prazo" id="number_prazo"  class="campo" required>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="grupo-entrada">
                                    <label for="number_valor">Valor</label>
                                    <input type="number" name="number_valor" id="number_valor" min="0.00" step="0.01" class="campo" required>
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