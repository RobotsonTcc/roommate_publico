package com.roomate.model;

public class UsuarioModel {

	protected long id;
	protected String nome;
	protected String cpf;
	protected String dataAniversario;
	protected char sexo;
	protected String email;
	protected String senha;
	protected String descricao;
	protected char cachorro;
	protected char gato;
	protected char fumante;
	protected char trabalha;
	protected Byte[] imagem;
	protected int curso;
	protected PreferenciaModel preferencia;
	
	public char getTrabalha() {
		return trabalha;
	}

	public PreferenciaModel getPreferencia() {
		return preferencia;
	}

	public void setPreferencia(PreferenciaModel preferencia) {
		this.preferencia = preferencia;
	}

	public void setTrabalha(char trabalha) {
		this.trabalha = trabalha;
	}

	public int getCurso() {
		return curso;
	}

	public void setCurso(int curso) {
		this.curso = curso;
	}

	public UsuarioModel() {
		super();
	}
	
	public UsuarioModel(String nome, String cpf, String dataAniversario, char sexo, String email, String senha,
			String descricao, char cachorro, char gato, char fumante, char trabalha, Byte[] imagem, int curso) {
		super();
		this.id = id;
		this.nome = nome;
		this.cpf = cpf;
		this.dataAniversario = dataAniversario;
		this.sexo = sexo;
		this.email = email;
		this.senha = senha;
		this.descricao = descricao;
		this.cachorro = cachorro;
		this.gato = gato;
		this.fumante = fumante;
		this.trabalha = trabalha;
		this.imagem = imagem;
		this.curso = curso;
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
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getDataAniversario() {
		return dataAniversario;
	}
	public void setDataAniversario(String dataAniversario) {
		this.dataAniversario = dataAniversario;
	}
	public char getSexo() {
		return sexo;
	}
	public void setSexo(char sexo) {
		this.sexo = sexo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public char getCachorro() {
		return cachorro;
	}
	public void setCachorro(char cachorro) {
		this.cachorro = cachorro;
	}
	public char getGato() {
		return gato;
	}
	public void setGato(char gato) {
		this.gato = gato;
	}
	public char getFumante() {
		return fumante;
	}
	public void setFumante(char fumante) {
		this.fumante = fumante;
	}
	public Byte[] getImagem() {
		return imagem;
	}
	public void setImagem(Byte[] imagem) {
		this.imagem = imagem;
	}
	
}
