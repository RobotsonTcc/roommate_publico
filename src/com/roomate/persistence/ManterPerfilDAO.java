package com.roomate.persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.lang3.ArrayUtils;

import com.roomate.controller.SimpleUtils;
import com.roomate.model.PreferenciaModel;
import com.roomate.model.UsuarioModel;

public class ManterPerfilDAO {

	protected static final String NOVO_PERFIL = "EXEC SP_InsereUsuario_INS ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?";
	protected static final String MANTER_PREFERENCIA = "EXEC SP_InserePreferencia_INSUPD ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?";
	protected static final String UPDATE_PERFIL = "EXEC SP_AtualizaValoresUsuario_UPD ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?";
	protected static final String GET_PERFIL = "EXEC SP_VisualizaPropriasinfos_SEL ?";
	
	public static void createPerfil(UsuarioModel usuario) {
		Connection con = null;
		try {
			con = ConnectionDAO.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			CallableStatement statement = con.prepareCall(NOVO_PERFIL);
			statement.setString(1, usuario.getNome());
			statement.setString(2, usuario.getCpf());
			statement.setString(3, usuario.getDataAniversario());
			statement.setString(4, Character.toString(usuario.getSexo()));
			statement.setString(5, usuario.getEmail());
			statement.setString(6, usuario.getSenha());
			statement.setString(7, usuario.getDescricao());
			statement.setString(8, Character.toString(usuario.getCachorro()));
			statement.setString(9, Character.toString(usuario.getGato()));
			statement.setString(10, Character.toString(usuario.getFumante()));
			statement.setString(11, Character.toString(usuario.getTrabalha()));
			statement.setBytes(12, ArrayUtils.toPrimitive(usuario.getImagem()));
			statement.setInt(13, usuario.getCurso());
			
			statement.execute();
			
			int idUsuario = new ValidaLoginDAO().ValidaLogin(usuario.getEmail(), usuario.getSenha());
			
			//adicionar preferencia
			statement = con.prepareCall(MANTER_PREFERENCIA);
			
			PreferenciaModel pref = usuario.getPreferencia();
			
			statement.setInt(1, idUsuario);
			statement.setString(2, Character.toString(pref.getPossuiPreferencia()));
			statement.setDouble(3, pref.getPreco());
			statement.setInt(4, pref.getEstadoMorar());
			statement.setString(5, pref.getCidadeMorar());
			statement.setString(6, Character.toString(pref.getZonaMorar()));
			statement.setString(7, SimpleUtils.isNullOrEmpty(Character.toString(pref.getSexoMorar())) ? null : Character.toString(pref.getSexoMorar()));
			statement.setString(8, SimpleUtils.isNullOrEmpty(Character.toString(pref.getFumanteMorar())) ? null : Character.toString(pref.getFumanteMorar()));
			statement.setString(9, SimpleUtils.isNullOrEmpty(Character.toString(pref.getCachorroMorar())) ? null : Character.toString(pref.getCachorroMorar()));
			statement.setString(10, SimpleUtils.isNullOrEmpty(Character.toString(pref.getGatoMorar())) ? null : Character.toString(pref.getGatoMorar()));
			statement.setString(11, SimpleUtils.isNullOrEmpty(Character.toString(pref.getTrabalhaMorar())) ? null : Character.toString(pref.getTrabalhaMorar()));
			statement.setInt(12, pref.getCursoMorar() == 0 ? 1 : pref.getCursoMorar());
			statement.setString(13, pref.getTipoMoradia());
			statement.setInt(14, pref.getQuantidadePessoas());
			
			statement.execute();
		} catch (SQLException e) {
			System.err.println(e);
		}
	}
	public static void updatePerfil(UsuarioModel usuario) {
		Connection con = null;
		try {
			con = ConnectionDAO.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			CallableStatement statement = con.prepareCall(UPDATE_PERFIL);
			statement.setString(1, usuario.getNome());
			statement.setString(2, usuario.getDataAniversario());
			statement.setString(3, usuario.getSenha());
			statement.setString(4, usuario.getDescricao());
			statement.setString(5, Character.toString(usuario.getCachorro()));
			statement.setString(6, Character.toString(usuario.getGato()));
			statement.setString(7, Character.toString(usuario.getFumante()));
			statement.setString(8, Character.toString(usuario.getTrabalha()));
			statement.setBytes(9, ArrayUtils.toPrimitive(usuario.getImagem()));
			statement.setInt(10, usuario.getCurso());
			
			int idUsuario = new ValidaLoginDAO().ValidaLogin(usuario.getEmail(), usuario.getSenha());

			statement.setInt(11, idUsuario);
			statement.execute();
			
			statement = con.prepareCall(MANTER_PREFERENCIA);
			
			PreferenciaModel pref = usuario.getPreferencia();
			
			statement.setInt(1, idUsuario);
			statement.setString(2, Character.toString(pref.getPossuiPreferencia()));
			statement.setDouble(3, pref.getPreco());
			statement.setInt(4, pref.getEstadoMorar());
			statement.setString(5, pref.getCidadeMorar());
			statement.setString(6, Character.toString(pref.getZonaMorar()));
			statement.setString(7, SimpleUtils.isNullOrEmpty(Character.toString(pref.getSexoMorar())) ? null : Character.toString(pref.getSexoMorar()));
			statement.setString(8, SimpleUtils.isNullOrEmpty(Character.toString(pref.getFumanteMorar())) ? null : Character.toString(pref.getFumanteMorar()));
			statement.setString(9, SimpleUtils.isNullOrEmpty(Character.toString(pref.getCachorroMorar())) ? null : Character.toString(pref.getCachorroMorar()));
			statement.setString(10, SimpleUtils.isNullOrEmpty(Character.toString(pref.getGatoMorar())) ? null : Character.toString(pref.getGatoMorar()));
			statement.setString(11, SimpleUtils.isNullOrEmpty(Character.toString(pref.getTrabalhaMorar())) ? null : Character.toString(pref.getTrabalhaMorar()));
			statement.setInt(12, pref.getCursoMorar() == 0 ? 1 : pref.getCursoMorar());
			statement.setString(13, pref.getTipoMoradia());
			statement.setInt(14, pref.getQuantidadePessoas());
			
			statement.execute();
		} catch (SQLException e) {
			System.err.println(e);
		}
	}
	public static UsuarioModel getPerfil(int id) {
		UsuarioModel dados = new UsuarioModel();
		Connection con = null;
		try {
			con = ConnectionDAO.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			CallableStatement statement = con.prepareCall(GET_PERFIL);
			statement.setInt(1, id);
			ResultSet rs = statement.executeQuery();
			while(rs.next()) {
				dados.setNome(rs.getString("NOME"));
				dados.setCpf(rs.getString("CPF"));
				dados.setEmail(rs.getString("EMAIL"));
				dados.setDataAniversario(rs.getString("DATA_NASC"));
				dados.setSexo(rs.getString("SEXO").charAt(0));
				dados.setSenha(rs.getString("SENHA"));
				dados.setDescricao(rs.getString("DESCRICAO"));
				dados.setCachorro(rs.getString("CACHORRO").charAt(0));
				dados.setGato(rs.getString("GATO").charAt(0));
				dados.setFumante(rs.getString("FUMANTE").charAt(0));
				dados.setTrabalha(rs.getString("TRABALHA").charAt(0));
				dados.setImagem(ArrayUtils.toObject(rs.getBytes("IMAGEM")));
				dados.setCurso(rs.getInt("ID_CURSO"));
				PreferenciaModel pref = new PreferenciaModel();
				
				if(rs.getString("PREFERENCIA").equals("N")) {
					pref.setPossuiPreferencia('N');
					pref.setPreco(rs.getDouble("PREF_VALOR"));
					pref.setEstadoMorar(rs.getInt("PREF_ESTADOID_UF"));
					pref.setCidadeMorar(rs.getString("PREF_CIDADE"));
					pref.setZonaMorar(rs.getString("PREF_ZONA").charAt(0));
					dados.setPreferencia(pref);
				} else {
					pref.setPossuiPreferencia('S');
					pref.setPreco(rs.getDouble("PREF_VALOR"));
					pref.setEstadoMorar(rs.getInt("PREF_ESTADOID_UF"));
					pref.setCidadeMorar(rs.getString("PREF_CIDADE"));
					pref.setZonaMorar(rs.getString("PREF_ZONA").charAt(0));
					pref.setSexoMorar(rs.getString("PREF_SEXO").charAt(0));
					pref.setFumanteMorar(rs.getString("PREF_FUMANTE").charAt(0));
					pref.setCachorroMorar(rs.getString("PREF_FUMANTE").charAt(0));
					pref.setGatoMorar(rs.getString("PREF_GATO").charAt(0));
					pref.setTrabalhaMorar(rs.getString("PREF_TRABALHA").charAt(0));
					pref.setCursoMorar(rs.getInt("PREF_IDCURSO"));
					pref.setTipoMoradia(rs.getString("PREF_TIPORES"));
					pref.setQuantidadePessoas(rs.getInt("PREF_QUANTPessoa"));
					dados.setPreferencia(pref);
				}
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dados;
	}
}
