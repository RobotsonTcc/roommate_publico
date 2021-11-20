package com.roomate.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

/**
 * Classe para conexão com o banco de dados
 */
public class ConnectionDAO {

	public ConnectionDAO() {

	}

	public static Connection getConnection() throws ClassNotFoundException, SQLException {

		String hostName = "localhost";
		String dbName = "ROOMATE";
		String user = "sa";
		String senha = "senha";
		Class.forName("net.sourceforge.jtds.jdbc.Driver");
		Connection c = DriverManager.getConnection(String.format(
				"jdbc:jtds:sqlserver://%s:1433;databaseName=%s;user=%s;password=%s;", hostName, dbName, user, senha));

		return c;
	}

}
