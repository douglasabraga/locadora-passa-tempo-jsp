/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.application.AplCadastrarClasse;

/**
 *
 * @author dougl
 */
@WebServlet("/CrtCadastrarClasse")
public class CrtCadastrarClasse extends HttpServlet {
    private AplCadastrarClasse apl;
    
    public CrtCadastrarClasse(){
        super();
        apl = new AplCadastrarClasse();
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String op = request.getParameter("operacao");
        
        switch (op) {
            case "incluirclasse":
                String nome = request.getParameter("txt_nome");
                Double valor = Double.parseDouble(request.getParameter("number_valor"));
                int prazo = Integer.parseInt(request.getParameter("number_prazo"));
                
                apl.inserir(nome, valor, prazo);
                response.sendRedirect("gestao_classe.jsp");
                break;
            
            case "alterarclasse":
                break;
                
            case "excluirclasse":
                apl.excluir(Integer.parseInt(request.getParameter("id")));
                response.sendRedirect("gestao_classe.jsp");
                
                break;
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }


}
