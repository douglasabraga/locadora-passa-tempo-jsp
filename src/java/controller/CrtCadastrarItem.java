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
import model.application.AplCadastrarItem;
import msg.msgFront;

@WebServlet("/CrtCadastrarItem")
public class CrtCadastrarItem extends HttpServlet {
    private AplCadastrarItem apl;
    
    public CrtCadastrarItem(){
        super();
        apl = new AplCadastrarItem();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String op = request.getParameter("operacao");
        String msge;

        switch (op) {
            case "incluiritem":
                {
                    try {
                        apl.inserir(Integer.parseInt(request.getParameter("numero")),
                                new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("data")),
                                request.getParameter("tipo"),
                                Integer.parseInt(request.getParameter("titulo")));
                    } catch (ParseException ex) {
                        System.out.println("Error!" + ex);
                    }
                }
                break;

            case "alterar":
                {
                    try {
                        if(apl.alterar(Integer.parseInt(request.getParameter("id")),
                                Integer.parseInt(request.getParameter("numero")),
                                new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("data")),
                                request.getParameter("tipo"),
                                Integer.parseInt(request.getParameter("titulo"))) == null) {
                            msge =  msgFront.msgErro;
                        } else {
                            msge =  msgFront.msgSucesso;
                        }
                        request.setAttribute("msg", msge);
                    } catch (ParseException ex) {
                        System.out.println("Error!" + ex);
                    }
                }
                break;

            case "excluiritem":
                if(!apl.excluir(Integer.parseInt(request.getParameter("id")))) {
                    msge =  msgFront.msgErro;
                } else {
                    msge =  msgFront.msgSucesso;
                }
                request.setAttribute("msg", msge);
                break;
        }
        
        RequestDispatcher destino = request.getRequestDispatcher("gestao_item.jsp");
        destino.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    
    

}
