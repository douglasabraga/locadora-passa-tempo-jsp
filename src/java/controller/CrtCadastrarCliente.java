package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.application.AplCadastrarCliente;
import msg.msgFront;

@WebServlet("/CrtCadastrarCliente")
public class CrtCadastrarCliente extends HttpServlet {
    private AplCadastrarCliente apl;
    
    public CrtCadastrarCliente(){
        super();
        apl = new AplCadastrarCliente();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String op = request.getParameter("operacao");
        String msge;

        switch(op) {
            case "incluirsocio":
                {
                    try {
                        apl.inserirSocio(request.getParameter("nome"),
                                new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("data")),
                                request.getParameter("sexo"),
                                request.getParameter("cpf"),
                                request.getParameter("endereco"),
                                request.getParameter("telefone"));
                    } catch (ParseException ex) {
                        System.out.println("Error!" + ex);
                    }
                }
                break;

            case "incluirdependente":
                {
                    try {
                        apl.inserirDependente(Integer.parseInt(request.getParameter("socio")),
                                request.getParameter("nome"),
                                new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("data")),
                                request.getParameter("sexo"));
                    } catch (ParseException ex) {
                        System.out.println("Error!" + ex);
                    }
                }
                break;

            case "excluircliente":
                if(!apl.excluir(Integer.parseInt(request.getParameter("id")))) {
                    msge = msgFront.msgErro;
                } else {
                    msge = msgFront.msgSucesso;
                }
                request.setAttribute("msg", msge);
                break;
        }
        RequestDispatcher destino = request.getRequestDispatcher("gestao_cliente.jsp");
        destino.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    
    

}
