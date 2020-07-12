
package model.application;

import model.dao.DAOImplement;
import model.domain.Classe;

public class AplCadastrarClasse extends AplCadastroBase<Classe>{

    public AplCadastrarClasse() {
        super(new DAOImplement<Classe>(Classe.class));
    }
    
    public void inserir(String nome, double valor, int prazo) {
        dao.inserir(new Classe(nome.trim(), valor, prazo)); // Insere uma nova classe no banco de Dados
    }
    
    public void atualizar(int id, String nome, double valor, int prazo) {
        Classe classe = dao.buscarPorID(id); // Busca a classe no banco de Dados
        classe.setNome(nome); // Altera o nome
        classe.setValor(valor);
        classe.setPrazoDevolucao(prazo);
        dao.atualizar(classe); // Atualiza a classe no banco de Dados
    }
    
}
