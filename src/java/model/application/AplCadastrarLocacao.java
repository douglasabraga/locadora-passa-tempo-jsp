
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
    
    public Locacao alterar(int id, Date dtDevPrevista, double valor, int idItem, int idCliente) {
        Item item = daoItem.getById(idItem);
        Cliente cliente = daoCliente.getById(idCliente);
        Locacao locacao = dao.getById(id);
        locacao.setDtDevolucaoPrevista(dtDevPrevista);
        locacao.setValorCobrado(valor);
        locacao.setItem(item);
        locacao.setCliente(cliente);
        return dao.alterar(locacao); 
    }
    
    public Locacao devolver(int id, double multa){
        Locacao locado = dao.getById(id);
        locado.setMultaCobrada(multa);
        locado.setDtDevolucaoEfetiva(new Date());
        return dao.alterar(locado);
    }
    
}
