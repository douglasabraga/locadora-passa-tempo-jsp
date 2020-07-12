
package model.application;

import model.dao.DAOImplement;
import model.domain.Diretor;

public class AplCadastrarDiretor extends AplCadastroBase<Diretor>{

    public AplCadastrarDiretor() {
        super(new DAOImplement<Diretor>(Diretor.class));
    }
    
    public void inserir(String nome) {
        dao.inserir(new Diretor(nome.trim())); // Insere um novo ator no banco de Dados
    }
    
    public void atualizar(int id, String nome) {
        Diretor diretor = dao.buscarPorID(id); // Busca o ator no banco de Dados
        diretor.setNome(nome); // Altera o nome
        dao.atualizar(diretor); // Atualiza o ator no banco de Dados
    }
}
