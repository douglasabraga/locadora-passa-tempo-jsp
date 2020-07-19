
package model.application;

import java.util.Date;
import java.util.List;
import model.dao.ClienteDAO;
import model.domain.Cliente;
import model.domain.Dependente;
import model.domain.Socio;

public class AplCadastrarCliente extends AplCadastrar<Cliente>{
    private ClienteDAO dao;

    public AplCadastrarCliente() {
        super(new ClienteDAO());
        this.dao = new ClienteDAO();
    }
    
    public void inserirSocio(String nome, Date dtNasc, String sexo, String cpf, String end, String tel) {
        dao.inserir(new Socio(cpf, end, tel, nome, dtNasc, sexo));
    }
    
    public void inserirDependente(int idSocio, String nome, Date dtNasc, String sexo) {
        Socio socio = (Socio)dao.getById(idSocio);
        socio.setContDep();
        dao.inserir(new Dependente(nome, dtNasc, sexo, socio));
        dao.atualizar(socio);
    }
    
    public List<Socio> buscarSocios() {
        return dao.buscarSocios();
    }
}
