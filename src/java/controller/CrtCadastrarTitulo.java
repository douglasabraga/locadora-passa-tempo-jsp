package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.application.AplCadastrarTitulo;
import msg.msgFront;

@WebServlet("/CrtCadastrarTitulo")
public class CrtCadastrarTitulo extends HttpServlet {
    private AplCadastrarTitulo apl;
    
    public CrtCadastrarTitulo(){
        super();
        apl = new AplCadastrarTitulo();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String op = request.getParameter("operacao");
        String msge;
        
        switch (op) {
            case "incluirtitulo":
                
                apl.inserir(request.getParameter("titulo"),
                            Integer.parseInt(request.getParameter("ano")),
                            request.getParameter("sinopse"),
                            request.getParameter("categoria"),
                            Integer.parseInt(request.getParameter("classe")),
                            Integer.parseInt(request.getParameter("diretor")),
                            request.getParameterValues("ator"));
                break;
                
            case "alterar":
                if(apl.alterar(Integer.parseInt(request.getParameter("id")),
                            request.getParameter("titulo"),
                            Integer.parseInt(request.getParameter("ano")),
                            request.getParameter("sinopse"),
                            request.getParameter("categoria"),
                            Integer.parseInt(request.getParameter("classe")),
                            Integer.parseInt(request.getParameter("diretor")),
                            request.getParameterValues("ator"))  == null) {
                    
                    msge =  msgFront.msgErro;
                } else {
                    msge =  msgFront.msgSucesso;
                }
                request.setAttribute("msg", msge);
                break;
            
            case "excluirtitulo":
                if(!apl.excluir(Integer.parseInt(request.getParameter("id")))) {
                    msge =  msgFront.msgErro;
                } else {
                    msge =  msgFront.msgSucesso;
                }
                request.setAttribute("msg", msge);
                break;
        }
        
        RequestDispatcher destino = request.getRequestDispatcher("gestao_titulo.jsp");
        destino.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    
    

}
