package com.roomate.persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ValidaLoginDAO {
	
	public int ValidaLogin(String email, String senha) throws SQLException {
		Connection con = null;
		try {
			con = ConnectionDAO.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String sql = "CALL SP_LOGIN_SEL (?,?)";
		CallableStatement statement = con.prepareCall(sql);
		statement.setString(1,email);
		statement.setString(2,senha);
		ResultSet rs = statement.executeQuery();
		
		int usuario = 0;
		
		while (rs.next()) {
			usuario = rs.getInt("ID_USUARIO");
		}
		
		 rs.close();
		 statement.close();
		
		return usuario;
	}
	

	public String NomeUsuario(int id) throws SQLException {
		Connection con = null;
		try {
			con = ConnectionDAO.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String selectStatement = "select nome from USUARIO where ID_USUARIO=((?))";
		PreparedStatement prepStmt = con.prepareStatement(selectStatement);
		prepStmt.setInt(1, id);
	    ResultSet rs = prepStmt.executeQuery();
	    
	    String nome = null;
	    
	    while (rs.next()) {	
	    	nome = rs.getString("NOME");
	     }
	    
		return nome;
	}
	
	public byte[] FotoUsuario(int id) throws SQLException {
		Connection con = null;
		try {
			con = ConnectionDAO.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String selectStatement = "select IMAGEM from USUARIO where ID_USUARIO=((?))";
		PreparedStatement prepStmt = con.prepareStatement(selectStatement);
		prepStmt.setInt(1, id);
	    ResultSet rs = prepStmt.executeQuery();
	    
	    byte[] imagem = null;
	    
	    while (rs.next()) {	
	    	imagem = rs.getBytes("IMAGEM");
	     }
	    
		return imagem;
	}

}
