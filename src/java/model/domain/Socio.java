package model.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity
@PrimaryKeyJoinColumn(name = "id")
public class Socio extends Cliente {
    @Column(length = 11, nullable = false)
    private String cpf;
    @Column(nullable = false)
    private String endereco;
    @Column(length = 11, nullable = false)
    private String telefone;
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<Dependente> listaDependentes;

    public Socio() {
        listaDependentes = new ArrayList<>();
    }

    public Socio(String cpf, String endereco, String telefone, String nome, Date dtNascimento, String sexo) {
        super(nome, dtNascimento, sexo);
        this.cpf = cpf;
        this.endereco = endereco;
        this.telefone = telefone;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public List<Dependente> getListaDependentes() {
        return listaDependentes;
    }

    public void setListaDependentes(List<Dependente> listaDependentes) {
        this.listaDependentes = listaDependentes;
    }
}
