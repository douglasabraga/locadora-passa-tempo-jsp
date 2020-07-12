package model.dao;

import java.util.List;

public interface DAOGenerico<T> {
    public T inserir(T objeto);
    public T atualizar(T objeto);
    public boolean excluir(int id);
    public T buscarPorID(int id);
    public List<T> buscarTodos();
}
