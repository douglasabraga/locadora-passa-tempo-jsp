package model.domain;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity
@PrimaryKeyJoinColumn(name = "id")
public class Dependente extends Cliente {
    
    @ManyToOne
    @JoinColumn(name="id_socio", nullable = false)
    private Socio socio;
    
    public Dependente() {}

    public Dependente(String nome, Date dtNascimento, String sexo, Socio socio) {
        super(nome, dtNascimento, sexo);
        this.socio = socio;
    }

    public Socio getSocio() {
        return socio;
    }

    public void setSocio(Socio socio) {
        this.socio = socio;
    }
    
}
