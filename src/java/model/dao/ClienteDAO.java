package model.dao;

import java.util.List;
import org.hibernate.HibernateException;
import controller.ConexaoHibernate;
import model.domain.Cliente;
import model.domain.Dependente;
import model.domain.Socio;

public class ClienteDAO extends DAOImplement<Cliente>{
    
    public ClienteDAO() {
        super(Cliente.class);
    }
    
    public List<Socio> buscarSocios() {
        try{
            setSessao(ConexaoHibernate.getSessionFactory().openSession());
            setTransacao(getSessao().beginTransaction());
            setQuery(getSessao().createQuery("FROM Socio s WHERE contDep < 3"));
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
    
//    public List<Cliente> getDependentesDeSocio(int idSocio) {
//        try{
//            setSessao(ConexaoHibernate.getSessionFactory().openSession());
//            setTransacao(getSessao().beginTransaction());
//            setQuery(getSessao().createQuery("FROM dependente d, socio s, cliente c WHERE d.id_socio = s.id and d.id = c.id and s.id = :idSoc").setParameter("idSoc", idSocio));
//            getTransacao().commit();
//            return getQuery().list();
//        } catch (HibernateException ex) {
//            getTransacao().rollback();
//        } finally {
//            if(getSessao() != null) {
//                getSessao().close();
//            }
//        }
//        return null;
//    }
}
