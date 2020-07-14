
package model.application;

import java.util.Date;
import model.dao.DAOImplement;
import model.domain.Item;
import model.domain.Titulo;

public class AplCadastrarItem extends AplCadastroBase<Item>{
    private DAOImplement<Titulo> daoTitulo;

    public AplCadastrarItem() {
        super(new DAOImplement<Item>(Item.class));
        this.daoTitulo = new DAOImplement<>(Titulo.class);
    }
    
    public void inserir(int numSerie, Date dtAquisicao, String tipo, int idTitulo) {
        Titulo titulo = daoTitulo.buscarPorID(idTitulo);
        dao.inserir(new Item(numSerie, dtAquisicao, tipo, titulo)); 
    }
    
   /* public void atualizar(int id, int numSerie, Date dtAquisicao, String tipo, int idTitulo) {
        Titulo titulo = daoTitulo.buscarPorID(idTitulo);
        Item item = dao.buscarPorID(id); 
        item.setNumSerie(numSerie);
        item.setDtAquisicao(dtAquisicao);
        item.setTipoItem(tipo);
        item.setTitulo(titulo);
        dao.atualizar(item);
    }*/
    
}
