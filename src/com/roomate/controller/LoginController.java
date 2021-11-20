package com.roomate.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public LoginController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sessao = request.getSession();
		String verifica  = (String) sessao.getAttribute("editar");
		String verificaPrincipal = (String) sessao.getAttribute("principal");
		
		
		if (verifica != null) {
			sessao.removeAttribute("editar");
			request.getRequestDispatcher("/principal.jsp");
		}
		
		//Se na sessions estiver chat, e fechar o chat manda para ca, então mata a session e cria de novo com outro valor
		if (verificaPrincipal == "chat") {
			sessao.removeAttribute("editar");
			sessao.setAttribute("principal", "match");	
			request.getRequestDispatcher("/principal.jsp");
		}
		
		
		response.sendRedirect(request.getContextPath() + "/login.jsp");		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
