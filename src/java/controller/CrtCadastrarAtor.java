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

import model.application.AplCadastrarAtor;

/**
 *
 * @author dougl
 */
//@WebServlet("/CrtCadastrarAtor")
public class CrtCadastrarAtor extends HttpServlet {
    private AplCadastrarAtor apl;
    
    public CrtCadastrarAtor(){
        super();
        apl = new AplCadastrarAtor();
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String op = request.getParameter("operacao");
        
        switch (op) {
            case "incluirator":
                String nome = request.getParameter("txt_nome");
                apl.inserir(nome);
                response.sendRedirect("gestao_ator.jsp");
                break;
            
            case "alterarator":
                break;
                
            case "excluirator":
                apl.excluir(Integer.parseInt(request.getParameter("id")));
                response.sendRedirect("gestao_ator.jsp");
                break;
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }


}
