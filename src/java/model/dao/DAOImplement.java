package model.dao;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import controller.ConexaoHibernate;

public class DAOImplement<T> implements DAOGenerico<T>{
    private Session sessao;
    private Transaction transacao;
    private Query query;
    private Class<T> tipo;

    public DAOImplement(Class<T> tipo) {
        this.tipo = tipo;
    }

    public Session getSessao() {
        return sessao;
    }

    public void setSessao(Session sessao) {
        this.sessao = sessao;
    }

    public Transaction getTransacao() {
        return transacao;
    }

    public void setTransacao(Transaction transacao) {
        this.transacao = transacao;
    }

    public Query getQuery() {
        return query;
    }

    public void setQuery(Query query) {
        this.query = query;
    }
    
    

    @Override
    public T inserir(T objeto) {
        try {
            sessao = ConexaoHibernate.getSessionFactory().openSession();
            transacao = sessao.beginTransaction();
            sessao.save(objeto);
            transacao.commit();
            return objeto;
        } catch (HibernateException ex) {
            transacao.rollback();
        } finally {
            if(sessao != null) {
                sessao.close();
            }
        }
       
        return null;
    }

    @Override
    public boolean excluir(int id) {
        try {
            sessao = ConexaoHibernate.getSessionFactory().openSession();
            transacao = sessao.beginTransaction();
            T objeto = (T)sessao.get(tipo, id);
            sessao.delete(objeto);
            transacao.commit();
            return true;
        } catch (HibernateException ex) {
            transacao.rollback();
        } finally {
            if(sessao != null) {
                sessao.close();
            }
        }
       
        return false;
    }

    @Override
    public T getById(int id) {
        try {
            sessao = ConexaoHibernate.getSessionFactory().openSession();
            transacao = sessao.beginTransaction();
            T objeto = (T)sessao.get(tipo, id);
            transacao.commit();
            return objeto;
        } catch (HibernateException ex) {
            transacao.rollback();
        } finally {
            if(sessao != null) {
                sessao.close();
            }
        }
       
        return null;
    }

    @Override
    public List<T> getAll() {
        try {
            sessao = ConexaoHibernate.getSessionFactory().openSession();
            transacao = sessao.beginTransaction();
            query = sessao.createQuery("FROM " + tipo.getName());
            transacao.commit();
            return query.list();
        } catch (HibernateException ex) {
            transacao.rollback();
        } finally {
            if(sessao != null) {
                sessao.close();
            }
        }
        return null;
    }
    
    @Override
    public T atualizar(T objeto) {
        try {
            sessao = ConexaoHibernate.getSessionFactory().openSession();
            transacao = sessao.beginTransaction();
            sessao.update(objeto);
            transacao.commit();
            return objeto;
        } catch (HibernateException ex) {
            transacao.rollback();
        } finally {
            if(sessao != null) {
                sessao.close();
            }
        }
       
        return null;
    }
}
