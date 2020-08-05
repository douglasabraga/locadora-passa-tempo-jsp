package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.application.AplCadastrarDiretor;
import msg.msgFront;

@WebServlet("/CrtCadastrarDiretor")
public class CrtCadastrarDiretor extends HttpServlet {
    private AplCadastrarDiretor apl;
    
    public CrtCadastrarDiretor(){
        super();
        apl = new AplCadastrarDiretor();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String op = request.getParameter("operacao");
        String msge;
        
        switch (op) {
            case "incluirdiretor":
                String nome = request.getParameter("txt_nome");
                apl.inserir(nome);
                break;
            
            case "alterar":
                if(apl.alterar(Integer.parseInt(request.getParameter("id")), request.getParameter("txt_nome")) != null){
                    msge = msgFront.msgSucesso;
                }else{
                    msge = msgFront.msgErro;
                }
                request.setAttribute("msg", msge);
                break;
                
            case "excluirdiretor":
                if(!apl.excluir(Integer.parseInt(request.getParameter("id")))) {
                    msge =  msgFront.msgErro;
                } else {
                    msge =  msgFront.msgSucesso;
                }
                request.setAttribute("msg", msge);
                break;
        }
        
        RequestDispatcher destino = request.getRequestDispatcher("gestao_diretor.jsp");
        destino.forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }


}
