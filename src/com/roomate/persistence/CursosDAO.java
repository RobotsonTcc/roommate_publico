package com.roomate.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class CursosDAO {

	protected static final String GET_CURSOS = "SELECT * FROM CURSO";
	
	public static Map<Integer, String> getCursos() {
		Map<Integer, String> cursos = new HashMap<Integer, String>();
		
		Connection con = null;
		try {
			con = ConnectionDAO.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			PreparedStatement statement = con.prepareStatement(GET_CURSOS);
			ResultSet rs = statement.executeQuery();
			
			while(rs.next()) {
				cursos.put(rs.getInt("ID_CURSO"),
						rs.getString("DESCRICAO"));
			}
			
		} catch (SQLException e) {
			System.err.println(e);
		}
		
		return cursos;
	}
	
}
