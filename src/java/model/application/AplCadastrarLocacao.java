
package model.application;

import java.util.Date;
import model.dao.DAOImplement;
import model.domain.Cliente;
import model.domain.Item;
import model.domain.Locacao;

public class AplCadastrarLocacao extends AplCadastrar<Locacao>{
    private DAOImplement<Item> daoItem;
    private DAOImplement<Cliente> daoCliente;

    public AplCadastrarLocacao() {
        super(new DAOImplement<Locacao>(Locacao.class));
        daoItem = new DAOImplement<>(Item.class);
        daoCliente = new DAOImplement<>(Cliente.class);
    }
    
    public void inserir(Date dtDevPrevista, double valor, int idItem, int idCliente) {
        Item item = daoItem.getById(idItem);
        Cliente cliente = daoCliente.getById(idCliente);
        dao.inserir(new Locacao(dtDevPrevista, valor, item, cliente));
    }
    
}
