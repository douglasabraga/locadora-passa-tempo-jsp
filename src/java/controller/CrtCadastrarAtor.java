package controller;

import msg.msgFront;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.application.AplCadastrarAtor;

//@WebServlet("/CrtCadastrarAtor")
public class CrtCadastrarAtor extends HttpServlet {
    private AplCadastrarAtor apl;
    
    public CrtCadastrarAtor(){
        super();
        apl = new AplCadastrarAtor();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String op = request.getParameter("operacao");
        String msge;
        
        switch (op) {
            case "incluirator":
                String nome = request.getParameter("txt_nome");
                apl.inserir(nome);
                break;
            
            case "alterarator":
                break;
                
            case "excluirator":
                
                if(!apl.excluir(Integer.parseInt(request.getParameter("id")))){
                    msge = msgFront.msgErro;
                } else {
                    msge = msgFront.msgSucesso;
                }
                request.setAttribute("msg", msge);
                break;
        }
        
        RequestDispatcher destino = request.getRequestDispatcher("gestao_ator.jsp");
        destino.forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }


}
