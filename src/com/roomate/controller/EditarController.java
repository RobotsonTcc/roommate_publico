package com.roomate.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.roomate.model.UsuarioModel;
import com.roomate.persistence.ManterPerfilDAO;


@WebServlet("/editar")
public class EditarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public EditarController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//sessao para depois mostrar o botao correto
		HttpSession sessao = request.getSession();
    	sessao.setAttribute("editar", "S");	
    	
     	sessao.setMaxInactiveInterval(20*60); //20min inativo cai a session
     	
     	int id = (int) sessao.getAttribute("usuario");
     	UsuarioModel dados = ManterPerfilDAO.getPerfil(id);
     	
     	sessao.setAttribute("dados_usuario", dados);
     	sessao.setAttribute("pref_usuario", dados.getPreferencia());
    	
		response.sendRedirect(request.getContextPath() + "/cadastro");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
