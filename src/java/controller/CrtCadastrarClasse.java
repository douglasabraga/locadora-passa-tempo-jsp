package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.application.AplCadastrarClasse;
import msg.msgFront;

@WebServlet("/CrtCadastrarClasse")
public class CrtCadastrarClasse extends HttpServlet {
    private AplCadastrarClasse apl;
    
    public CrtCadastrarClasse(){
        super();
        apl = new AplCadastrarClasse();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String op = request.getParameter("operacao");
        String msge;
        
        switch (op) {
            case "incluirclasse":
                String nome = request.getParameter("txt_nome");
                Double valor = Double.parseDouble(request.getParameter("number_valor"));
                int prazo = Integer.parseInt(request.getParameter("number_prazo"));
                
                apl.inserir(nome, valor, prazo);
                
                break;
            
            case "alterar":
                if(apl.alterar(Integer.parseInt(request.getParameter("id")),
                        request.getParameter("txt_nome"),
                        Double.parseDouble(request.getParameter("number_valor")),
                        Integer.parseInt(request.getParameter("prazo"))) != null){
                    
                    msge = msgFront.msgSucesso;
                }else{
                    msge = msgFront.msgErro;
                }
                request.setAttribute("msg", msge);
                break;
                
            case "excluirclasse":
                if(!apl.excluir(Integer.parseInt(request.getParameter("id")))) {
                   msge =  msgFront.msgErro;

                } else {
                    msge =  msgFront.msgSucesso;
                }
                request.setAttribute("msg", msge);
                break;
        }
        
        RequestDispatcher destino = request.getRequestDispatcher("gestao_classe.jsp");
        destino.forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }


}
