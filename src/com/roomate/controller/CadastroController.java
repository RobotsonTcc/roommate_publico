package com.roomate.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.ArrayUtils;

import com.roomate.model.UsuarioModel;
import com.roomate.persistence.CursosDAO;

/**
 * Servlet implementation class CadastroController
 */
@MultipartConfig
@WebServlet("/cadastro")
public class CadastroController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String SENHA_CONFIRMAR = "";
	
	public CadastroController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map<Integer, String> cursos = CursosDAO.getCursos();
		request.setAttribute("cursos", cursos);
		//response.sendRedirect(request.getContextPath() + "/cadastro.jsp");
		request.getRequestDispatcher(request.getContextPath() + "/cadastro.jsp").forward(request,  response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Byte[] foto = null;
		UsuarioModel usuario = new UsuarioModel();
		String excecoes = null;
		
		boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
		if(!isMultipartContent) {
			return;
		}
		
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			List<FileItem> fields = upload.parseRequest(request);
			Iterator<FileItem> iterator = fields.iterator();
			while(iterator.hasNext()) {
				FileItem item = iterator.next();
				try {
					if (item.getFieldName().equals("file-input")) {
						String[] partes = item.getName().split("\\.");
						String ext = partes[1];
						File file = File.createTempFile(item.getName()
								.substring(0, item.getName().length() - ext.length()).replaceAll("\\.", ""), "." + ext);
						file.delete();
						item.write(file);
						foto = ArrayUtils.toObject(Files.readAllBytes(file.toPath()));
						usuario.setImagem(foto);
						continue;
				}
				} catch(Exception e) {
					if(request.getSession().getAttribute("editar").equals("S")) {
						UsuarioModel dados_atuais = (UsuarioModel) request.getSession().getAttribute("dados_usuario");
						usuario.setImagem(dados_atuais.getImagem());
					}
					continue;
				}
				if(item.getFieldName().equals("first_name")) {
					usuario.setNome(item.getString());
					continue;
				}
				if(item.getFieldName().equals("cpf")) {
					try {
						String cpf = SimpleUtils.convertStreamToString(item.getInputStream());
						usuario.setCpf(SimpleUtils.tirarFormatacao(cpf));
					} catch (Exception e) {
						System.err.println(e);
					}
					continue;
				}
				if(item.getFieldName().equals("aniversario")) {
					usuario.setDataAniversario(item.getString());
					continue;
				}
				if(item.getFieldName().equals("input_sex")) {
					usuario.setSexo(item.getString().charAt(0));
					continue;
				}
				if(item.getFieldName().equals("email")) {
					usuario.setEmail(item.getString());
					continue;
				}
				if(item.getFieldName().equals("password")) {
					usuario.setSenha(item.getString());
					continue;
				}
				if(item.getFieldName().equals("password_conf")) {
					SENHA_CONFIRMAR = item.getString();
					continue;
				}
				if(item.getFieldName().equals("descricao")) {
					usuario.setDescricao(item.getString());
					continue;
				}
				if(item.getFieldName().equals("cachorro")) {
					usuario.setCachorro(item.getString().charAt(0));
					continue;
				}
				if(item.getFieldName().equals("gato")) {
					usuario.setGato(item.getString().charAt(0));
					continue;
				}
				if(item.getFieldName().equals("fumante")) {
					usuario.setFumante(item.getString().charAt(0));
					continue;
				}
				if(item.getFieldName().equals("trabalha")) {
					usuario.setTrabalha(item.getString().charAt(0));
					continue;
				}
				if(item.getFieldName().equals("curso")) {
					usuario.setCurso(Integer.parseInt(item.getString()));
					continue;
				}
			}
		} catch (Exception e) {
			System.err.println("Erro ao tratar foto");	
			excecoes = "Erro ao tratar foto";
		}
		
		String[] erros = validaUsuario(usuario, request, excecoes);

		if (erros.length > 0) {
			String textoErro = "";
			for(String erro : erros) {
				textoErro += erro+"\\n";
			}
			request.setAttribute("erro", textoErro);
			response.sendRedirect(request.getContextPath() + "/cadastro");
		} else {
			request.setAttribute("usuario", usuario);
			request.getRequestDispatcher("/preferencias").forward(request, response);
		}
	}

	private String[] validaUsuario(UsuarioModel usuario, HttpServletRequest request, String excecoes) {
		List erros = new ArrayList();

		try {
		
		/*
		if (!SimpleUtils.cpfValido(usuario.getCpf())) {
			erros.add("O CPF digitado não é válido");
		}
		 */
		if (SimpleUtils.isNullOrEmpty(usuario.getEmail())) {
			erros.add("Email não preenchido");
		}

		if (!SimpleUtils.isValidEmailAddress(usuario.getEmail())) {
			erros.add("Email inválido");
		}
		
		if(!usuario.getSenha().equals(SENHA_CONFIRMAR)) {
			erros.add("Senhas não conferem");
		}
		
		if(!SimpleUtils.isNullOrEmpty(excecoes)) {
			erros.add(excecoes);
		}
		}catch(Exception e) {
			System.out.println(e.getMessage());
			erros.add("Erro não tratado");
		}

		return (String[]) erros.toArray(new String[erros.size()]);
	}

}
