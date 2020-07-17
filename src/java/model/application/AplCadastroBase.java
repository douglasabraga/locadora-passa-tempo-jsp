package model.application;

import java.util.List;
import model.dao.DAOImplement;

public abstract class AplCadastroBase<T> {
    protected DAOImplement<T> dao;

    public AplCadastroBase(DAOImplement<T> dao) {
        this.dao = dao;
    }
    
    public boolean excluir(int id) {
        return dao.excluir(id); // Exclui o ator pelo ID do banco de Dados
    }
    
    public T buscarPorID(int id) {
        return dao.buscarPorID(id); // Busca um ator pelo ID no banco de Dados
    }
    
    public List<T> buscarTodos() {
        return dao.buscarTodos(); // Busca todos os atores no banco de Dados
    }
}