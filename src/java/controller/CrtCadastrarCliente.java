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
import model.application.AplCadastrarCliente;

@WebServlet("/CrtCadastrarCliente")
public class CrtCadastrarCliente extends HttpServlet {
    private AplCadastrarCliente apl;
    
    public CrtCadastrarCliente(){
        super();
        apl = new AplCadastrarCliente();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        try {
            String op = request.getParameter("operacao");
            //String classific = request.getParameter("socio");

            switch(op) {
                case "incluirsocio":
                    apl.inserirSocio(request.getParameter("nome"),
                                     new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("data")),
                                     request.getParameter("sexo"),
                                     request.getParameter("cpf"),
                                     request.getParameter("endereco"),
                                     request.getParameter("telefone"));
                    
                    response.sendRedirect("gestao_cliente.jsp");
                    break;
                case "incluirdependente":
                    apl.inserirDependente(request.getParameter("nome"),
                                          new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("data")),
                                          request.getParameter("sexo"));
                    response.sendRedirect("gestao_cliente.jsp");
                    break;
                case "excluircliente":
                    response.sendRedirect("gestao_cliente.jsp");
                    
            }
        } catch (ParseException ex) {
            Logger.getLogger(CrtCadastrarCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    
    

}
