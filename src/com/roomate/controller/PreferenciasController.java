package com.roomate.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.tomcat.util.codec.binary.Base64;

import com.roomate.model.UsuarioModel;
import com.roomate.persistence.CursosDAO;
import com.roomate.persistence.EstadosDAO;

/**
 * Servlet implementation class PreferenciasController
 */
@WebServlet("/preferencias")
public class PreferenciasController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PreferenciasController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UsuarioModel usuario = request.getAttribute("usuario") == null ? 
				request.getSession().getAttribute("dados_cad_usuario") == null ? new UsuarioModel()
				: (UsuarioModel) request.getSession().getAttribute("dados_cad_usuario") 
				: (UsuarioModel) request.getAttribute("usuario");
		if (!SimpleUtils.isNullOrEmpty(usuario.getImagem())) {
			String url = "data:image/png;base64,"
					+ Base64.encodeBase64String(ArrayUtils.toPrimitive(usuario.getImagem()));
			request.setAttribute("imagem", url);
		}
		request.setAttribute("estados", EstadosDAO.getEstados());
		request.setAttribute("cursos", CursosDAO.getCursos());
		
		HttpSession session = request.getSession();
		session.setAttribute("dados_cad_usuario", usuario);
		
		request.getRequestDispatcher(request.getContextPath() + "/preferencias.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
