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
    
    public Ator alterar(int id, String nome) {
        System.out.println("id = " + id);
        System.out.println("nome = " + nome);
        Ator ator = dao.getById(id); // Busca o ator no banco de Dados
        ator.setNome(nome); // Altera o nome
        return dao.alterar(ator); // Atualiza o ator no banco de Dados
    }
}
