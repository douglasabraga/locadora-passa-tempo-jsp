package model.domain;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
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
    private int contDep;
            
    public Socio() {
        contDep = 0;
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

    public int getContDep() {
        return contDep;
    }

    public void setContDep() {
        this.contDep = contDep + 1;
        System.out.println(contDep);
    }
    
    public void decContDep() {
        this.contDep -= 1;
    }
}