package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.application.AplCadastrarItem;


@WebServlet("/CrtCadastrarItem")
public class CrtCadastrarItem extends HttpServlet {
    private AplCadastrarItem apl;
    
    public CrtCadastrarItem(){
        super();
        apl = new AplCadastrarItem();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            String op = request.getParameter("operacao");
            
            switch (op) {
                case "incluiritem":
                    
                    apl.inserir(Integer.parseInt(request.getParameter("numero")),
                            new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("data")),
                            request.getParameter("tipo"),
                            Integer.parseInt(request.getParameter("titulo")));
                    
                    response.sendRedirect("gestao_item.jsp");
                    break;
                    
                case "alteraritem":
                    break;
                    
                case "excluiritem":
                    apl.excluir(Integer.parseInt(request.getParameter("id")));
                    response.sendRedirect("gestao_item.jsp");
                    break;
            }
        } catch (ParseException ex) {
            Logger.getLogger(CrtCadastrarItem.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    
    

}
