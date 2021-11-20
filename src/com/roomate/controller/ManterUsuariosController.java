package com.roomate.controller;

import java.io.IOException;
import java.net.URL;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.geonames.Toponym;
import org.geonames.ToponymSearchCriteria;
import org.geonames.ToponymSearchResult;
import org.geonames.WebService;

import com.roomate.model.PreferenciaModel;
import com.roomate.model.UsuarioModel;
import com.roomate.persistence.ManterPerfilDAO;

/**
 * Servlet implementation class ManterUsuariosController
 */
@WebServlet("/manterusuario")
public class ManterUsuariosController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ManterUsuariosController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsuarioModel usuario = request.getSession().getAttribute("dados_cad_usuario") == null ? new UsuarioModel()
				: (UsuarioModel) request.getSession().getAttribute("dados_cad_usuario") ;
		PreferenciaModel pref = new PreferenciaModel();
		
		if(request.getParameter("pref_pref").equals("N")) {
			pref.setPossuiPreferencia('N');
			pref.setEstadoMorar(Integer.parseInt(request.getParameter("estado_pref")));
			pref.setCidadeMorar(request.getParameter("cidade_pref"));
			pref.setZonaMorar(request.getParameter("zona_pref").charAt(0));
			pref.setPreco(Double.parseDouble(request.getParameter("preco")));
		} else {
			pref.setPossuiPreferencia('S');
			
			pref.setPreco(Double.parseDouble(request.getParameter("preco")));
			pref.setEstadoMorar(Integer.parseInt(request.getParameter("estado_pref")));
			pref.setCachorroMorar(request.getParameter("cachorroopt").charAt(0));
			pref.setCidadeMorar(request.getParameter("cidade_pref"));
			pref.setZonaMorar(request.getParameter("zona_pref").charAt(0));
			pref.setSexoMorar(request.getParameter("sex_pref").charAt(0));
			pref.setFumanteMorar(request.getParameter("fumante_pref").charAt(0));
			pref.setGatoMorar(request.getParameter("gatoopt").charAt(0));
			pref.setTrabalhaMorar(request.getParameter("trabalhaopt").charAt(0));
			pref.setCursoMorar(Integer.parseInt(request.getParameter("curso")));
			pref.setQuantidadePessoas(Integer.parseInt(request.getParameter("dividir")));
			pref.setTipoMoradia(request.getParameter("tipo_res"));
		}
		
		usuario.setPreferencia(pref);
		
		WebService.setUserName("rob0ts0n");
		
		ToponymSearchCriteria search = new ToponymSearchCriteria();
		search.setQ(pref.getCidadeMorar() == null ? "" : pref.getCidadeMorar());
		ToponymSearchResult result = null;
		try {
			result = WebService.search(search);
		} catch (Exception e) {
			e.printStackTrace();
		}
		/*if(Character.toString(pref.getPossuiPreferencia()).equals("S") && SimpleUtils.isNullOrEmpty(result)) {
			request.setAttribute("erro", "Cidade inválida");
			request.getRequestDispatcher("/preferencias").forward(request, response);
		} else {
			for(Toponym top : result.getToponyms()) {
				if(SimpleUtils.isNullOrEmpty(top)) {
					break;
				} else {
					if(Character.toString(pref.getPossuiPreferencia()).equals("S")) {
						request.setAttribute("erro", "Cidade inválida");
						request.getRequestDispatcher("/preferencias").forward(request, response);
					}
				}
			}
			*/
			
			HttpSession session = request.getSession();
			String preAssunto = "";
			String preAttOuAdd = "";
			if(!SimpleUtils.isNullOrEmpty(session.getAttribute("editar")) && ((String) session.getAttribute("editar")).equalsIgnoreCase("S")) {
				ManterPerfilDAO.updatePerfil(usuario);
				preAssunto = "ATUALIZAÇÃO DE DADOS";
				preAttOuAdd = "atualizado";
			} else {
				ManterPerfilDAO.createPerfil(usuario);
				preAssunto = "NOVO USUÁRIO";
				preAttOuAdd = "incluido";
			}
			
			final String assunto = preAssunto;
			final String attOuAdd = preAttOuAdd;
			ThreadPoolExecutor emailExecutor = new ThreadPoolExecutor(10, 10, 30, TimeUnit.SECONDS,
					new LinkedBlockingQueue<Runnable>());

			emailExecutor.execute(new Runnable() {
				@Override
				public void run() {
					try {
						EmailController.enviarEmail(usuario, assunto,
								String.join(System.getProperty("line.separator"),
										"<h1>Olá " + usuario.getNome() + "!</h1><br>",
										"<p>Seu cadastro foi "+attOuAdd+" com sucesso!</p>"));
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
				}
			});
			emailExecutor.shutdown();
			if(!SimpleUtils.isNullOrEmpty(session.getAttribute("editar")) && ((String) session.getAttribute("editar")).equalsIgnoreCase("S")) {
				request.getRequestDispatcher("/login").forward(request, response);
			} else {
				HttpSession atual = request.getSession();
				atual.invalidate();
				response.sendRedirect(request.getContextPath() + "/login");
			}
		}
		
	//}

}
