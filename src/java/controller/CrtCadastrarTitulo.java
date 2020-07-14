package controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.application.AplCadastrarTitulo;

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
        
        switch (op) {
            case "incluirtitulo":
                
                apl.inserir(request.getParameter("titulo"),
                            Integer.parseInt(request.getParameter("ano")),
                            request.getParameter("sinopse"),
                            request.getParameter("categoria"),
                            Integer.parseInt(request.getParameter("classe")),
                            Integer.parseInt(request.getParameter("diretor")),
                            request.getParameterValues("ator"));
                
                response.sendRedirect("gestao_titulo.jsp");
                break;
                
            case "alterartitulo":
                break;
            
            case "excluirtitulo":
                apl.excluir(Integer.parseInt(request.getParameter("id")));
                response.sendRedirect("gestao_titulo.jsp");
                break;
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    
    

}
