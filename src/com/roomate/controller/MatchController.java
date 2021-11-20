package com.roomate.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.roomate.model.MatchModel;
import com.roomate.persistence.ListaMatchDAO;

@WebServlet("/registraOpcao")
public class MatchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MatchController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sessao = request.getSession();
		
		String opcao = request.getParameter("opcao");
		
		String opcaoValor = null;
		
		if(opcao.equals("like") ){
			opcaoValor = "S";
		}
		if(opcao.equals("dislike") ){
			opcaoValor = "N";
		}
		
		ArrayList<MatchModel> listaMatch = new ArrayList<MatchModel>();
		listaMatch = (ArrayList<MatchModel>) sessao.getAttribute("lista_match");	
		int usuarioSelecionado = listaMatch.get(0).getId();
		
		int usuario = (int) sessao.getAttribute("usuario");
		
		
		ListaMatchDAO cdao = new ListaMatchDAO();
		try {
			cdao.registraMatch(usuario, usuarioSelecionado, opcaoValor);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.sendRedirect(request.getContextPath() + "/validaLogin");
			
	}

}
