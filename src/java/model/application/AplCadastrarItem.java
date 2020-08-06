
package model.application;

import java.util.Date;
import model.dao.DAOImplement;
import model.domain.Item;
import model.domain.Titulo;

public class AplCadastrarItem extends AplCadastrar<Item>{
    private DAOImplement<Titulo> daoTitulo;

    public AplCadastrarItem() {
        super(new DAOImplement<Item>(Item.class));
        this.daoTitulo = new DAOImplement<>(Titulo.class);
    }
    
    public void inserir(int numSerie, Date dtAquisicao, String tipo, int idTitulo) {
        Titulo titulo = daoTitulo.getById(idTitulo);
        dao.inserir(new Item(numSerie, dtAquisicao, tipo, titulo)); 
    }
    
    public Item alterar(int id, int numSerie, Date dtAquisicao, String tipo, int idTitulo) {
        Titulo titulo = daoTitulo.getById(idTitulo);
        Item item = dao.getById(id); 
        item.setNumSerie(numSerie);
        item.setDtAquisicao(dtAquisicao);
        item.setTipoItem(tipo);
        item.setTitulo(titulo);
         return dao.alterar(item);
    }
}
