package model.application;

import java.util.List;
import model.dao.ClienteDAO;
import model.dao.DAOImplement;

public abstract class AplCadastrar<T> {
    protected DAOImplement<T> dao;
    private ClienteDAO daocli;

    public AplCadastrar(DAOImplement<T> dao) {
        this.dao = dao;
        this.daocli = new ClienteDAO();
    }
    
    public boolean excluir(int id) {
        return dao.excluir(id);
    }

    public T getById(int id) {
        return dao.getById(id);
    }

    public List<T> getAll() {
        return dao.getAll();
    }
}