
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
    
    public Cliente alterarSocio(int id, String nome, Date dtNasc, String sexo, String cpf, String end, String tel) {
        Socio socio = (Socio)dao.getById(id);
        socio.setNome(nome);
        socio.setDtNascimento(dtNasc);
        socio.setSexo(sexo);
        socio.setCpf(cpf);
        socio.setEndereco(end);
        socio.setTelefone(tel);
        return dao.alterar(socio);
    }
    
    public void inserirDependente(int idSocio, String nome, Date dtNasc, String sexo) {
        Socio socio = (Socio)dao.getById(idSocio);
        socio.setContDep();
        dao.inserir(new Dependente(nome, dtNasc, sexo, socio));
        dao.alterar(socio);
    }
    
    public Cliente alterarDependente(int id, String nome, Date dtNasc, String sexo) {
        Dependente cliente = (Dependente)dao.getById(id);
        cliente.setNome(nome);
        cliente.setDtNascimento(dtNasc);
        cliente.setSexo(sexo);
        return dao.alterar(cliente); 
    }
    
    public boolean excluirCliente(int idCliente) {
        Cliente cliente = (Cliente)dao.getById(idCliente);
        if( cliente.getClass().getSimpleName().equals("Dependente") ) {
            return excluirDependente(idCliente);
        }
        return excluirSocio(idCliente);
    }
    
    public boolean excluirDependente(int idDep) {
        Dependente dep = (Dependente)dao.getById(idDep);
        Socio socio = (Socio)dao.getById(dep.getSocio().getId());
        socio.decContDep();
        dao.alterar(socio);
        return dao.excluir(idDep);
    }
    
    public boolean excluirSocio(int idSocio) {
        return dao.excluir(idSocio);
    }
    
    public List<Socio> buscarSocios() {
        return dao.buscarSocios();
    }
}
