package com.roomate.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class EstadosDAO {

	protected static final String GET_ESTADOS = "SELECT * FROM PREF_ESTADO";
	
	public static Map<Integer, String> getEstados() {
		Map<Integer, String> estados = new HashMap<Integer, String>();
		
		Connection con = null;
		try {
			con = ConnectionDAO.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			PreparedStatement statement = con.prepareStatement(GET_ESTADOS);
			ResultSet rs = statement.executeQuery();
			
			while(rs.next()) {
				estados.put(rs.getInt("ID_UF"),
						rs.getString("NOME_ESTADO"));
			}
			
		} catch (SQLException e) {
			System.err.println(e);
		}
		
		return estados;
	}
	
}
