package model.domain;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;

@Entity
@PrimaryKeyJoinColumn(name = "id")
public class Dependente extends Cliente {

    public Dependente() {}

    public Dependente(String nome, Date dtNascimento, String sexo) {
        super(nome, dtNascimento, sexo);
    }
}
