package com.roomate.model;

public class ChatModel {
	
	protected long id;
	protected String nome;
	protected String imagem;
	protected long id_relacionamento;
	
	public ChatModel() {
		super();
	}
	
	public ChatModel(long id, String nome, String imagem) {
		super();
		this.id = id;
		this.nome = nome;
		this.imagem = imagem;
	}
	
	public ChatModel(long id, String nome, String imagem, long id_relacionamento) {
		super();
		this.id = id;
		this.nome = nome;
		this.imagem = imagem;
		this.id_relacionamento = id_relacionamento;
	}

	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getImagem() {
		return imagem;
	}
	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public long getId_relacionamento() {
		return id_relacionamento;
	}

	public void setId_relacionamento(long id_relacionamento) {
		this.id_relacionamento = id_relacionamento;
	}

}
