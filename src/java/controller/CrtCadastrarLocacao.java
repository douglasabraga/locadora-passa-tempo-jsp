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
import model.application.AplCadastrarLocacao;
import msg.msgFront;

@WebServlet("/CrtCadastrarLocacao")
public class CrtCadastrarLocacao extends HttpServlet {
    private AplCadastrarLocacao apl;

    public CrtCadastrarLocacao(){
        super();
        apl = new AplCadastrarLocacao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {        
        
        String op = request.getParameter("operacao");
        String msge;
        
        switch (op) {
            case "incluirlocacao":
                {
                    try {
                        apl.inserir(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dtDevPrev")),
                                        Double.parseDouble(request.getParameter("valor")),
                                        Integer.parseInt(request.getParameter("item")),
                                        Integer.parseInt(request.getParameter("cliente")));
                    } catch (ParseException ex) {
                        System.out.println("Error! " + ex);
                    }
                }
                break;
            
            case "alterarlocacao":
                break;
                
            case "excluirlocacao":
                if(!apl.excluir(Integer.parseInt(request.getParameter("id")))){
                    msge = msgFront.msgErro;
                } else {
                    msge = msgFront.msgSucesso;
                }
                request.setAttribute("msg", msge);
                break;
        }
        
        RequestDispatcher destino = request.getRequestDispatcher("gestao_locacao.jsp");
        destino.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
