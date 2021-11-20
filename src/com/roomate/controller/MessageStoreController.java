package com.roomate.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.roomate.model.ChatModel;
import com.roomate.persistence.ConnectionDAO;

@WebServlet("/messagestore")
public class MessageStoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected static final String INSERE_CHAT_DATA = "INSERT INTO CHATTING_DATA VALUES(?, ?, ?, ?, ?, (SELECT * FROM NEXT_VALUE))";
	
	public MessageStoreController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter localPrintWriter = response.getWriter();
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
			PreparedStatement localStatement = localConnection.prepareStatement(INSERE_CHAT_DATA);

			long id_chat = 0l;
			List chatList = ((ArrayList) request.getSession().getAttribute("chat"));
			for(Object chat : chatList) {
				if(((ChatModel) chat).getId() == Long.parseLong((String) request.getSession().getAttribute("id_chat_atual"))) {
					id_chat = ((ChatModel) chat).getId_relacionamento();
					//request.getSession().removeAttribute("id_chat_atual");
					break;
				}
			}
			String nome = request.getParameter("nome");
			String email = request.getParameter("email");
			String msg = request.getParameter("msg");

			SimpleDateFormat localSimpleDateFormat1 = new SimpleDateFormat("dd-MMM-yyyy");
			SimpleDateFormat localSimpleDateFormat2 = new SimpleDateFormat("hh:mm:ss a");
			Date localDate = new Date();
			String data_envio = localSimpleDateFormat1.format(localDate);
			String tempo_envio = localSimpleDateFormat2.format(localDate);

			localStatement.setLong(1, id_chat);
			localStatement.setString(2, nome);
			localStatement.setString(3, msg);
			localStatement.setString(4, data_envio);
			localStatement.setString(5, tempo_envio);

			localStatement.execute();
			localConnection.close();
		} catch (Exception localException) {
			//localException.printStackTrace();
			System.err.println(localException);
		}
	}

}
