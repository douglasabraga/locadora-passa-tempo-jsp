
package model.application;

import model.dao.DAOImplement;
import model.domain.Ator;

public class AplCadastrarAtor extends AplCadastroBase<Ator>{

    public AplCadastrarAtor() {
        super(new DAOImplement<Ator>(Ator.class));
    }
    
    public void inserir(String nome) {
        dao.inserir(new Ator(nome.trim())); // Insere um novo ator no banco de Dados
    }
    
    public void atualizar(int id, String nome) {
        Ator ator = dao.buscarPorID(id); // Busca o ator no banco de Dados
        ator.setNome(nome); // Altera o nome
        dao.atualizar(ator); // Atualiza o ator no banco de Dados
    }
}
