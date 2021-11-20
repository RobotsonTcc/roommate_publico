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
import com.roomate.persistence.ChatUsuarioDAO;

@WebServlet("/apagarChat")
public class ExcluiChatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExcluiChatController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("entro");
		
		HttpSession sessao = request.getSession();
		//id da conversa do chat
		String idUsuarioChat  = (String) sessao.getAttribute("teste");
		
		System.out.println(idUsuarioChat);
		
		//id do Usuario logado
		int id = (int) sessao.getAttribute("usuario");
		
		ArrayList<ChatModel> chat = new ArrayList<ChatModel>();
	
		//remove o chat ->  mata a session -> recarrega a session
		ChatUsuarioDAO cdao = new ChatUsuarioDAO();
    	try {
    		//Seleciona o chat
    		int id_chat = cdao.SelecionaChat(id,idUsuarioChat);

    		//remove o chat
			cdao.RemoveChat(id_chat);

			
			//Apaga a session anterior
			sessao.removeAttribute("chat");
			sessao.removeAttribute("idUsuarioChat");

			
			//colocar novamente na session
        	ChatUsuarioDAO cdao2 = new ChatUsuarioDAO();
        	chat = cdao2.ChatUsuario(id);
        	sessao.setAttribute("chat", chat);	
			
        	response.sendRedirect(request.getContextPath() + "/login");	
        		
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
