
package model.application;

import model.dao.DAOImplement;
import model.domain.Diretor;

public class AplCadastrarDiretor extends AplCadastrar<Diretor>{

    public AplCadastrarDiretor() {
        super(new DAOImplement<Diretor>(Diretor.class));
    }
    
    public void inserir(String nome) {
        dao.inserir(new Diretor(nome.trim())); // Insere um novo ator no banco de Dados
    }
    
    public Diretor alterar(int id, String nome) {
        Diretor diretor = dao.getById(id); // Busca o ator no banco de Dados
        diretor.setNome(nome); // Altera o nome
        return dao.alterar(diretor); // Atualiza o ator no banco de Dados
    }
}
