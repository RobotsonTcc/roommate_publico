package com.roomate.model;

public class MatchModel {

	protected int id;
	protected String nome;
	protected String sexo;
	protected String descricao;
	protected String cachorro;
	protected String gato;
	protected String fumante;
	protected String trabalha;
	protected String imagem;
	protected String descricao_curso;
	
	public MatchModel() {
		super();
	}
	
	public MatchModel(int id, String nome, String sexo, String descricao, String cachorro, String gato,
			String fumante, String trabalha, String imagem, String descricao_curso) {
		super();
		this.id = id;
		this.nome = nome;
		this.sexo = sexo;
		this.descricao = descricao;
		this.cachorro = cachorro;
		this.gato = gato;
		this.fumante = fumante;
		this.trabalha = trabalha;
		this.imagem = imagem;
		this.descricao_curso = descricao_curso;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getCachorro() {
		return cachorro;
	}

	public void setCachorro(String cachorro) {
		this.cachorro = cachorro;
	}

	public String getGato() {
		return gato;
	}

	public void setGato(String gato) {
		this.gato = gato;
	}

	public String getFumante() {
		return fumante;
	}

	public void setFumante(String fumante) {
		this.fumante = fumante;
	}

	public String getTrabalha() {
		return trabalha;
	}

	public void setTrabalha(String trabalha) {
		this.trabalha = trabalha;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public String getDescricao_curso() {
		return descricao_curso;
	}

	public void setDescricao_curso(String descricao_curso) {
		this.descricao_curso = descricao_curso;
	}
	
}
