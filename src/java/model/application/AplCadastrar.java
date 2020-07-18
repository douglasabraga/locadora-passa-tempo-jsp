package model.application;

import java.util.List;
import model.dao.DAOImplement;

public abstract class AplCadastrar<T> {
    protected DAOImplement<T> dao;

    public AplCadastrar(DAOImplement<T> dao) {
        this.dao = dao;
    }
    
    public boolean excluir(int id) {
        return dao.excluir(id);
    }
    //getById
    public T getById(int id) {
        return dao.getById(id);
    }
    //getAll
    public List<T> getAll() {
        return dao.getAll();
    }
}