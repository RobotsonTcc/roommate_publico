package com.roomate.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class Chat2MessageDAO {

	protected static final String SELECT_RELACIONAMENTO_POR_USUARIO = "SELECT * FROM CONVERT2MESSAGE WHERE ID_USUARIO1 = (?) OR ID_USUARIO2 = (?)";
	protected static final String CONVERT_2_MESSAGE = "INSERT INTO CHATTING(ID_REL, NOME) VALUES (?, ?)";
	protected static final String EXISTE_CHATTING = "SELECT 1 AS EXISTE FROM CHATTING WHERE ID_REL = (?) GROUP BY ID";
	
	public static void convert2Message(String id) {
		if(existeChatting(id)) {
			return;
		}
		Connection con = null;
		try {
			con = ConnectionDAO.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Map<String, String[]> relacionamento = new HashMap<String, String[]>();
		try {
			PreparedStatement ps = con.prepareStatement(SELECT_RELACIONAMENTO_POR_USUARIO);
			ps.setString(1, id);
			ps.setString(2, id);
			ResultSet rs = ps.executeQuery();
			
			
			while(rs.next()) {
				relacionamento.put(rs.getString("ID_RELACIONAMENTO"), new String[]{
						rs.getString("ID_USUARIO1"), rs.getString("ID_USUARIO2"),
						rs.getString("NOME_U1"), rs.getString("NOME_U2")
						});
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			return;
		}
		converteRelacionamentos(relacionamento);
	}
	
	private static boolean existeChatting(String id) {
		Connection con = null;
		try {
			con = ConnectionDAO.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String idRelacionamento = "";
		
		try {
			PreparedStatement ps = con.prepareStatement(SELECT_RELACIONAMENTO_POR_USUARIO);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				idRelacionamento = rs.getString("ID_RELACIONAMENTO");
			}
		} catch (SQLException e) {
			return false;
		}
		
		try {
			PreparedStatement ps = con.prepareStatement(EXISTE_CHATTING);
			ps.setString(1, idRelacionamento);
			ResultSet rs = ps.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			return false;
		}
	}

	private static void converteRelacionamentos(Map<String, String[]> relacionamento) {
		for(Map.Entry<String, String[]> entry : relacionamento.entrySet()) {
			Connection con = null;
			try {
				con = ConnectionDAO.getConnection();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				for(int i = 0; i<2; i++) {
					PreparedStatement ps = con.prepareStatement(CONVERT_2_MESSAGE);
					String chave = entry.getKey().toString();
					ps.setInt(1, Integer.parseInt(chave));
					ps.setString(2, entry.getValue()[i+2].toString());
					ps.execute();
				}
			} catch (SQLException e) {
				//e.printStackTrace();
			}
		}
	}
	
}
