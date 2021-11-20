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

import org.apache.tomcat.util.codec.binary.Base64;

import com.roomate.persistence.ChatUsuarioDAO;
import com.roomate.persistence.ListaMatchDAO;
import com.roomate.persistence.ValidaLoginDAO;
import com.roomate.model.ChatModel;
import com.roomate.model.MatchModel;

@WebServlet("/validaLogin")
public class LoginValidaController extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public LoginValidaController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		}
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sessao = request.getSession();
		
		ArrayList<ChatModel> chat = new ArrayList<ChatModel>();
		ArrayList<MatchModel> listaMatch = new ArrayList<MatchModel>();
		
	
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		
		int id;
		
        try {
        	
    		if (email != null && senha != null) {

	            ValidaLoginDAO cDao = new ValidaLoginDAO();
	            id = cDao.ValidaLogin(email, senha);
	            String nome = cDao.NomeUsuario(id);
	            byte[] imagem = cDao.FotoUsuario(id);
	            
	            String url = "data:image/png;base64," + Base64.encodeBase64String(imagem);

	            //session 
	            sessao.setAttribute("usuario", id);	
	            sessao.setAttribute("nome", nome);	 
	            sessao.setAttribute("imagem_usuario", url);	 
	            sessao.setAttribute("principal", "match");	
    		}
    		else{
    			id = (int) sessao.getAttribute("usuario");
    		}
            	
            //inclui no arraylist os chat disponivel
            ChatUsuarioDAO cdao2 = new ChatUsuarioDAO();
            chat = cdao2.ChatUsuario(id);
            sessao.removeAttribute("chat");
            sessao.setAttribute("chat", chat);
            
            listaMatch = (ArrayList<MatchModel>) sessao.getAttribute("lista_match");
            	
            if(SimpleUtils.isNullOrEmpty(listaMatch) || listaMatch.isEmpty()) { 	
            	ListaMatchDAO cdao3 = new ListaMatchDAO();
            	listaMatch = cdao3.ListaUsuario(id);
            	sessao.setAttribute("lista_match", listaMatch);
            	
            }
            else {
            	listaMatch.remove(0);
            	sessao.removeAttribute("lista_match");
            	sessao.setAttribute("lista_match", listaMatch);
            }

            sessao.setMaxInactiveInterval(20*60); //20min inativo cai a session
            request.getRequestDispatcher("/principal.jsp").forward(request, response);
  
            	
        } catch (SQLException e) {
             String mensagem = e.getMessage().substring(e.getMessage().indexOf(": ")+1);
             
             request.setAttribute("erro", mensagem);
             request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
        
       


	}

}