<%@page import="model.application.AplCadastrarAtor"%>
<%@page import="model.application.AplCadastrarDiretor"%>
<%@page import="model.application.AplCadastrarClasse"%>
<%@page import="model.domain.Ator"%>
<%@page import="model.domain.Classe"%>
<%@page import="model.domain.Diretor"%>

<%
    AplCadastrarClasse aplClasse = new AplCadastrarClasse();
    AplCadastrarDiretor aplDiretor = new AplCadastrarDiretor();
    AplCadastrarAtor aplAtor = new AplCadastrarAtor();
%>
<!-- Modal EDITAR -->
<div class="modal fade" id="modalEditar" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" class="titulo-formulario">Alterar Titulo</h3>
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <div class="container">
                    
                    <form  method="post" action="CrtCadastrarTitulo">
                        
                        <input type="hidden" name="operacao" value="alterar">
                        
                        <div class="grupo-entrada">
                            <div class="row">
                                <div class="col-2">
                                    <label for="id">Id</label>
                                    <input type="number" name="id" id="id" class="campo">
                                </div>
                                <div class="col-8">
                                    <label for="txt_nome">Nome</label>
                                    <input type="text" name="titulo" id="titulo" class="campo" required>
                                </div>
                                <div class="col-2">
                                    <div class="grupo-entrada">
                                        <label for="ano">Ano</label>
                                        <input type="number" min="1895" max="2020" id="ano" name="ano" class="campo" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                    
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="grupo-entrada">
                                    <label for="categoria">Categoria</label>
                                    <input type="text" name="categoria" id="categoria" class="campo" required>
                                </div>
                            </div>   
                            <div class="col-sm-4">                  
                                <div class="grupo-entrada">
                                    <label for="classe">Classe</label>
                                    <select id="classe" name="classe" class="campo" required>
                                        <% for(Classe classe : aplClasse.getAll()){ %>
                                            <option  class="dropdown-item" value="<%=classe.getId()%>"><%=classe.getNome()%></option>
                                        <% } %>
                                    </select>
                                </div>
                            </div> 
                            <div class="col-sm-4">
                                <div class="grupo-entrada">
                                    <label for="diretor">Diretor</label>
                                    <select id="diretor" name="diretor" class="campo" required>
                                        <% for(Diretor diretor : aplDiretor.getAll()){ %>
                                            <option value="<%=diretor.getId()%>"><%=diretor.getNome()%></option>
                                        <% } %>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="grupo-entrada">
                            <label for="ator">Atores</label>
                            <select id="ator" name="ator" class="custom-select campo" multiple required>
                                <% for(Ator ator : aplAtor.getAll()){ %>
                                    <option value="<%=ator.getId()%>"><%=ator.getNome()%></option>
                                <% } %>
                            </select>
                        </div>

                        <div class="grupo-entrada">
                            <label for="sinopse">Sinopse</label>
                            <textarea class="form-control  campo" id="sinopse" name="sinopse" rows="3" required></textarea>
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