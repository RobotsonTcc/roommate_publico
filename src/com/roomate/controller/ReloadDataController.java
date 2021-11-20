package com.roomate.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.roomate.model.ChatModel;
import com.roomate.persistence.ConnectionDAO;

@WebServlet("/reloaddata")
public class ReloadDataController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReloadDataController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			response.setContentType("text/html");

			Connection localConnection = null;
			try {
				localConnection = ConnectionDAO.getConnection();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			String str1 = "SELECT * FROM CHATTING_DATA WITH (NOLOCK) WHERE ID_CHAT = (?)";
			PreparedStatement localPreparedStatement = localConnection.prepareStatement(str1);
			
			long id_chat = 0l;
			List chatList = ((ArrayList) request.getSession().getAttribute("chat"));
			try {
				for(Object chat : chatList) {
					if(((ChatModel) chat).getId() == Long.parseLong((String) request.getSession().getAttribute("id_chat_atual"))) {
						id_chat = ((ChatModel) chat).getId_relacionamento();
						break;
					}
				}
			} catch (NullPointerException npe) {
				return;
			}
			
			String nomeUsuario = (String) request.getSession().getAttribute("nome");
			
			localPreparedStatement.setLong(1, id_chat);
			ResultSet localResultSet = localPreparedStatement.executeQuery();

			while (localResultSet.next()) {
				String nome = localResultSet.getString("NOME");
				String mensagem = localResultSet.getString("MENSAGEM");
				String data_envio = localResultSet.getString("DATA_ENVIO");
				String tempo_envio = localResultSet.getString("TEMPO_ENVIO");
				PrintWriter localPrintWriter = response.getWriter();
				
				if(nome.equalsIgnoreCase(nomeUsuario)) {
					localPrintWriter.print(
	                        "<div class=\"outgoing_msg\">"+
                            "<div class=\"sent_msg\">"+
                            "<p>"+ mensagem +
                            "</p>"+
                            "<span class=\"time_date\"> "+tempo_envio+" | "+data_envio+"</span> </div>"+
                            "</div>"
							);
				} else {
					localPrintWriter.print(
	                        "<div class=\"incoming_msg\">"+
                            "<div class=\"received_withd_msg\">"+
                            "<p>"+ mensagem +
                            "</p>"+
                            "<span class=\"time_date\"> "+tempo_envio+" | "+data_envio+"</span> </div>"+
                            "</div>"
							);
				}
				
				/*
				localPrintWriter
						.print("<p>" + nome + "-<g>" + mensagem + "</g><br><small>" + data_envio + " " + tempo_envio + "</small></p>");
				*/
			}
			localConnection.close();

		} catch (Exception localException) {
			localException.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
