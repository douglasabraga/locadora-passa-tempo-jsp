package model.application;

import model.dao.DAOImplement;
import model.domain.Ator;

public class AplCadastrarAtor extends AplCadastrar<Ator>{

    public AplCadastrarAtor() {
        super(new DAOImplement<Ator>(Ator.class));
    }
    
    public void inserir(String nome) {
        dao.inserir(new Ator(nome.trim()));
    }
}
