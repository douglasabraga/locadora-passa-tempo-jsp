package model.domain;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Titulo implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(nullable = false)
    private String titulo;
    @Column(nullable = false)
    private int ano;
    @Column(nullable = false)
    private String sinopse;
    @Column(nullable = false)
    private String categoria;
    @ManyToOne(fetch = FetchType.EAGER)
    private Classe classe;
    @ManyToOne(fetch = FetchType.EAGER)
    private Diretor diretor;
    @ManyToMany(fetch = FetchType.EAGER)
    private List<Ator> atores;

    public Titulo() {}

    public Titulo(String titulo, int ano, String sinopse, String categoria, Classe classe, Diretor diretor, List<Ator> atores) {
        this.titulo = titulo;
        this.ano = ano;
        this.sinopse = sinopse;
        this.categoria = categoria;
        this.classe = classe;
        this.diretor = diretor;
        this.atores = atores;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public String getSinopse() {
        return sinopse;
    }

    public void setSinopse(String sinopse) {
        this.sinopse = sinopse;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public Classe getClasse() {
        return classe;
    }

    public void setClasse(Classe classe) {
        this.classe = classe;
    }

    public Diretor getDiretor() {
        return diretor;
    }

    public void setDiretor(Diretor diretor) {
        this.diretor = diretor;
    }

    public List<Ator> getAtores() {
        return atores;
    }

    public void setAtores(List<Ator> atores) {
        this.atores = atores;
    }

    
}
