
package model.application;

import java.util.ArrayList;
import java.util.List;
import model.dao.DAOImplement;
import model.domain.Ator;
import model.domain.Classe;
import model.domain.Diretor;
import model.domain.Titulo;

public class AplCadastrarTitulo extends AplCadastrar<Titulo>{
    private DAOImplement<Classe> daoClasse;
    private DAOImplement<Diretor> daoDiretor;
    private DAOImplement<Ator> daoAtor;

    public AplCadastrarTitulo() {
        super(new DAOImplement<Titulo>(Titulo.class));
        this.daoClasse = new DAOImplement<>(Classe.class);
        this.daoDiretor = new DAOImplement<>(Diretor.class);
        this.daoAtor = new DAOImplement<>(Ator.class);
    }
    
    public void inserir(String titulo, int ano, String sinopse, String categoria, int idClasse, int idDiretor, String[] atores) {
        Classe classe = daoClasse.getById(idClasse);
        Diretor diretor = daoDiretor.getById(idDiretor);
        List<Ator> listaAtores = new ArrayList<>();
        
        for (String atore : atores) {
            Ator ator = daoAtor.getById(Integer.parseInt(atore));
            listaAtores.add(ator);
        }
        
        dao.inserir(new Titulo(titulo, ano, sinopse, categoria, classe, diretor, listaAtores));
    }
    
    public Titulo alterar(int id, String titulo, int ano, String sinopse, String categoria, int idClasse, int idDiretor, String[] atores) {
        Classe classe = daoClasse.getById(idClasse);
        Diretor diretor = daoDiretor.getById(idDiretor);
        
        List<Ator> atorez = new ArrayList<>();
        
        for(int x = 0; x < atores.length; x++) {
            Ator ator = daoAtor.getById(Integer.parseInt(atores[x]));
            atorez.add(ator);
        }
        
        Titulo _titulo = dao.getById(id);
        _titulo.setTitulo(titulo);
        _titulo.setAno(ano);
        _titulo.setSinopse(sinopse);
        _titulo.setCategoria(categoria);
        _titulo.setClasse(classe);
        _titulo.setDiretor(diretor);
        _titulo.setAtores(atorez);
        return dao.alterar(_titulo); 
    }
    
}
