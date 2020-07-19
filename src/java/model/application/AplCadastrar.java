package model.application;

import java.util.List;
import model.dao.ClienteDAO;
import model.dao.DAOImplement;
import model.domain.Dependente;
import model.domain.Socio;

public abstract class AplCadastrar<T> {
    protected DAOImplement<T> dao;
    private ClienteDAO daocli;

    public AplCadastrar(DAOImplement<T> dao) {
        this.dao = dao;
        this.daocli = new ClienteDAO();
    }
    
    public boolean excluir(int id) {
        T obj = dao.getById(id);
        if(obj.getClass().getSimpleName().equals("Dependente")){ 
            Dependente dep = (Dependente)daocli.getById(id);
            Socio socio = (Socio)dao.getById(dep.getSocio().getId());
            socio.decContDep();
            System.out.println(socio.getContDep());
            daocli.atualizar(socio);
        }
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