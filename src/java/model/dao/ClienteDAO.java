package model.dao;

import java.util.List;
import org.hibernate.HibernateException;
import controller.ConexaoHibernate;
import model.domain.Cliente;
import model.domain.Socio;

public class ClienteDAO extends DAOImplement<Cliente>{
    
    public ClienteDAO() {
        super(Cliente.class);
    }
    
    public List<Socio> buscarSocios() {
        try{
            setSessao(ConexaoHibernate.getSessionFactory().openSession());
            setTransacao(getSessao().beginTransaction());
            setQuery(getSessao().createQuery("FROM Socio AS s WHERE s.estahAtivo = 1 AND SIZE(s.listaDependentes) < 3"));
            getTransacao().commit();
            return getQuery().list();
        } catch (HibernateException ex) {
            getTransacao().rollback();
        } finally {
            if(getSessao() != null) {
                getSessao().close();
            }
        }
        
        return null;
    }
}
