package com.roomate.persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.tomcat.util.codec.binary.Base64;

import com.roomate.model.ChatModel;

public class ChatUsuarioDAO {
	
	public ArrayList<ChatModel> ChatUsuario(int usuario) throws SQLException {
		Connection con = null;
		try {
			con = ConnectionDAO.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ArrayList<ChatModel> lista = new ArrayList<ChatModel>();
		
		String sql = "CALL SP_MostraChat_SEL (?)";
		CallableStatement statement = con.prepareCall(sql);
		statement.setInt(1,usuario);
		ResultSet rs = statement.executeQuery();
		
		
		while (rs.next()) {
			ChatModel tabela = new ChatModel();
			tabela.setId(rs.getInt("id"));
			tabela.setNome(rs.getString("nome"));
			tabela.setImagem("data:image/png;base64," + Base64.encodeBase64String(rs.getBytes("foto")));
			tabela.setId_relacionamento(rs.getLong("id_relacionamento"));
			
			lista.add(tabela);	
		}
		
		 rs.close();
		 statement.close();
		
		return lista;
	}
	
	public ArrayList<ChatModel> ChatUsuarioSelecioando(String usuario) throws SQLException {
		Connection con = null;
		try {
			con = ConnectionDAO.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ArrayList<ChatModel> lista = new ArrayList<ChatModel>();
		
		String sql = "CALL sp_VisualizaInfosOutrosUsuario_SEL (?)";
		CallableStatement statement = con.prepareCall(sql);
		statement.setString(1,usuario);
		ResultSet rs = statement.executeQuery();
		
		
		while (rs.next()) {
			ChatModel tabela = new ChatModel();
			tabela.setNome(rs.getString("NOME"));
			lista.add(tabela);	
		}
		
		 rs.close();
		 statement.close();
		
		return lista;
	}
	
	public void RemoveChat(int idChat)throws SQLException {
		Connection con = null;
		try {
			con = ConnectionDAO.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String sql = "CALL SP_RelacionamentoUsuario_DEL (?)";
		CallableStatement statement = con.prepareCall(sql);
		statement.setInt(1,idChat);
		statement.execute();
	}
	
	public int SelecionaChat(int id, String idUsuarioChat) throws SQLException {
		Connection con = null;
		try {
			con = ConnectionDAO.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String sql = "CALL SP_SelecionaNumeroChat (?,?)";
		CallableStatement statement = con.prepareCall(sql);
		statement.setInt(1,id);
		statement.setString(2,idUsuarioChat);
		ResultSet rs = statement.executeQuery();
		
		int valor = 0;
		
		while (rs.next()) {
			valor = rs.getInt("ID_CHAT");
	
		}
		
		 rs.close();
		 statement.close();
		
		return valor;
	}

}
