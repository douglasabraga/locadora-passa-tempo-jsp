
package model.application;

import java.util.Date;
import java.util.List;
import model.dao.ClienteDAO;
import model.domain.Cliente;
import model.domain.Dependente;
import model.domain.Socio;

public class AplCadastrarCliente extends AplCadastroBase<Cliente>{
    private ClienteDAO dao;

    public AplCadastrarCliente() {
        super(new ClienteDAO());
        this.dao = new ClienteDAO();
    }
    
    public void inserirSocio(String nome, Date dtNasc, String sexo, String cpf, String end, String tel) {
        dao.inserir(new Socio(cpf, end, tel, nome, dtNasc, sexo));
    }
    
   /* public void atualizarSocio(int id, String nome, Date dtNasc, String sexo, String cpf, String end, String tel) {
        Socio cliente = (Socio)dao.buscarPorID(id);
        cliente.setNome(nome);
        cliente.setDtNascimento(dtNasc);
        cliente.setSexo(sexo);
        cliente.setCpf(cpf);
        cliente.setEndereco(end);
        cliente.setTelefone(tel);
        dao.atualizar(cliente);
    }*/
    
    public void inserirDependente(int idSocio, String nome, Date dtNasc, String sexo) {
        Socio socio = (Socio)dao.buscarPorID(idSocio);
        socio.setListaDependentes(new Dependente(nome, dtNasc, sexo));
        dao.inserir(new Dependente(nome, dtNasc, sexo));
    }
    
   /* public void atualizarDependente(int id, String nome, Date dtNasc, String sexo) {
        Dependente cliente = (Dependente)dao.buscarPorID(id);
        cliente.setNome(nome);
        cliente.setDtNascimento(dtNasc);
        cliente.setSexo(sexo);
        dao.atualizar(cliente); 
    }*/
    
    public List<Socio> buscarSocios() {
        return dao.buscarSocios();
    }
    
    
}
