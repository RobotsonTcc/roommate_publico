package com.roomate.persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.tomcat.util.codec.binary.Base64;

import com.roomate.model.ChatModel;
import com.roomate.model.MatchModel;

public class ListaMatchDAO {
	
	public ArrayList<MatchModel> ListaUsuario(int usuario) throws SQLException {
		Connection con = null;
		try {
			con = ConnectionDAO.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ArrayList<MatchModel> lista = new ArrayList<MatchModel>();
		
		String sql = "CALL SP_PerfisCompativeis_SEL (?)";
		CallableStatement statement = con.prepareCall(sql);
		statement.setInt(1,usuario);
		ResultSet rs = statement.executeQuery();
		
		
		while (rs.next()) {
			MatchModel tabela = new MatchModel();
			tabela.setId(rs.getInt("ID_USUARIO"));
			tabela.setNome(rs.getString("nome"));
			tabela.setSexo(rs.getString("SEXO"));
			tabela.setDescricao(rs.getString("DESCRICAO"));
			tabela.setCachorro(rs.getString("CACHORRO"));
			tabela.setGato(rs.getString("GATO"));
			tabela.setFumante(rs.getString("FUMANTE"));
			tabela.setTrabalha(rs.getString("TRABALHA"));
			tabela.setImagem("data:image/png;base64,"+ Base64.encodeBase64String(rs.getBytes("IMAGEM")));
			tabela.setDescricao_curso(rs.getString("curso"));			
			lista.add(tabela);	
		}
		
		 rs.close();
		 statement.close();
		
		return lista;
	}
	
	public void registraMatch(int usuario, int usuarioSelecionado, String resposta) throws SQLException {
		Connection con = null;
		try {
			con = ConnectionDAO.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String sql = "CALL SP_RelacionamentoUsuario_INSUPD (?,?,?)";
		CallableStatement statement = con.prepareCall(sql);
		statement.setInt(1,usuario);
		statement.setInt(2,usuarioSelecionado);
		statement.setString(3,resposta);
		ResultSet rs = statement.executeQuery();
		
	    rs.close();
		statement.close();

	}
		
}
