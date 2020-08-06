<!-- Modal EDITAR -->
<div class="modal fade" id="modalEditarDependente" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" class="titulo-formulario">Alterar Dependente</h3>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <div class="container">
                    
                    <form  method="post" action="CrtCadastrarCliente">
                        
                        <input type="hidden" name="operacao" value="alterarDependente">
                        
                        <div class="grupo-entrada">
                            <div class="row">
                                <div class="col-2">
                                    <label for="id">Id</label>
                                    <input type="number" name="id" id="id" class="campo" required>
                                </div>
                                <div class="col-10">
                                    <label for="nome">Nome</label>
                                    <input type="text" name="nome" id="nome" class="campo" required>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="grupo-entrada">
                                    <label for="data">Data de Nascimento</label>
                                    <input type="date" name="data" id="data" class="campo" required>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="grupo-entrada">
                                    <label for="sexo">Sexo</label>
                                    <select name="sexo" class="campo" required>
                                        <option value="masculino">Masculino</option>
                                        <option value="feminino">Feminino</option>
                                    </select>
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