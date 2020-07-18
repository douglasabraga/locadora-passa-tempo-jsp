package model.dao;

import java.util.List;

public interface DAOGenerico<T> {
    public T inserir(T objeto);
    public boolean excluir(int id);
    public T getById(int id);
    public List<T> getAll();
}