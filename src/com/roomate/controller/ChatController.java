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

import com.roomate.model.ChatModel;
import com.roomate.persistence.Chat2MessageDAO;
import com.roomate.persistence.ChatUsuarioDAO;


@WebServlet("/chat")
public class ChatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public ChatController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession sessao = request.getSession();
		String idUsuarioChat  = (String) request.getParameter("id");
		
		String verificaPrincipal = (String) sessao.getAttribute("principal");		
		
		if (verificaPrincipal == "match") {
			sessao.setAttribute("principal", "chat");	
		}
		
		ArrayList<ChatModel> chat = new ArrayList<ChatModel>();
		
		ChatUsuarioDAO cdao = new ChatUsuarioDAO();
    	try {
			chat = cdao.ChatUsuarioSelecioando(idUsuarioChat);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    	Chat2MessageDAO.convert2Message(String.valueOf(sessao.getAttribute("usuario")));
    	
    	sessao.setAttribute("teste", idUsuarioChat);
    	
        request.setAttribute("nome", chat.get(0).getNome());
        request.setAttribute("id", idUsuarioChat);
        sessao.setAttribute("id_chat_atual", idUsuarioChat);
        request.getRequestDispatcher("/principal.jsp").forward(request, response);
			
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		
	}

}
