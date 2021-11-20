package com.roomate.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.roomate.persistence.ConnectionDAO;

@WebServlet("/messages")
public class MessagesController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected static final String SELECT_CHATTING = "SELECT * FROM CHATTING WHERE NOME = (?) AND ID_REL = (?)";

	
	public MessagesController() {
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
			PreparedStatement localStatement = localConnection.prepareStatement(SELECT_CHATTING);

			String nome = request.getParameter("nome");
			int id_chat = Integer.parseInt(request.getParameter("id_chat"));
			
			localStatement.setString(1, nome);
			localStatement.setInt(2, id_chat);
			
			ResultSet localResultSet = localStatement.executeQuery();
			if (localResultSet.next()) {
				String nomeRetorno = localResultSet.getString("NOME");
				HttpSession localHttpSession = request.getSession();
				localHttpSession.setAttribute("name", nomeRetorno);
			}

			localConnection.close();
		} catch (Exception localException) {
			localException.printStackTrace();
			System.out.println(localException);
		}
	}

}
