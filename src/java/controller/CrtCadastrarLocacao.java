package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.application.AplCadastrarLocacao;
import model.domain.Locacao;
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
            
            case "alterar":
                {
                    try {
                        if(apl.alterar(Integer.parseInt(request.getParameter("id")),
                                new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("data")),
                                Double.parseDouble(request.getParameter("valor")),
                                Integer.parseInt(request.getParameter("item")),
                                Integer.parseInt(request.getParameter("cliente"))) == null) {

                            msge = msgFront.msgErro;
                        } else {
                            msge = msgFront.msgSucesso;
                        }
                        request.setAttribute("msg", msge);       

                    } catch (ParseException ex) {
                        Logger.getLogger(CrtCadastrarLocacao.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                break;
                
            case "excluirlocacao":
                if(!apl.excluir(Integer.parseInt(request.getParameter("id")))){
                    msge = msgFront.msgErro;
                } else {
                    msge = msgFront.msgSucesso;
                }
                request.setAttribute("msg", msge);
                break;
                
             case "devolver":
                 Locacao locacao = apl.devolver(Integer.parseInt(request.getParameter("id")),
                                Double.parseDouble(request.getParameter("multa")));
                if(locacao == null){
                    msge = msgFront.msgErro;
                } else {
                    msge = msgFront.msgLocacao + (locacao.getValorCobrado()+locacao.getMultaCobrada()) + " R$" + "');"+
                            "});\n"+
                            "</script>" ;
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
