package com.roomate.model;

public class PreferenciaModel {

	protected Double preco;
	protected char possuiPreferencia;
	protected char sexoMorar;
	protected char fumanteMorar;
	protected int estadoMorar;
	protected String cidadeMorar;
	protected char zonaMorar;
	protected char gatoMorar;
	protected char cachorroMorar;
	protected char trabalhaMorar;
	protected int cursoMorar;
	protected String tipoMoradia;
	protected int quantidadePessoas;
	
	public Double getPreco() {
		return preco;
	}

	public void setPreco(Double preco) {
		this.preco = preco;
	}

	public char getPossuiPreferencia() {
		return possuiPreferencia;
	}

	public void setPossuiPreferencia(char possuiPreferencia) {
		this.possuiPreferencia = possuiPreferencia;
	}

	public char getSexoMorar() {
		return sexoMorar;
	}

	public void setSexoMorar(char sexoMorar) {
		this.sexoMorar = sexoMorar;
	}

	public char getFumanteMorar() {
		return fumanteMorar;
	}

	public void setFumanteMorar(char fumanteMorar) {
		this.fumanteMorar = fumanteMorar;
	}

	public int getEstadoMorar() {
		return estadoMorar;
	}

	public void setEstadoMorar(int estadoMorar) {
		this.estadoMorar = estadoMorar;
	}

	public String getCidadeMorar() {
		return cidadeMorar;
	}

	public void setCidadeMorar(String cidadeMorar) {
		this.cidadeMorar = cidadeMorar;
	}

	public char getZonaMorar() {
		return zonaMorar;
	}

	public void setZonaMorar(char zonaMorar) {
		this.zonaMorar = zonaMorar;
	}

	public char getGatoMorar() {
		return gatoMorar;
	}

	public void setGatoMorar(char gatoMorar) {
		this.gatoMorar = gatoMorar;
	}

	public char getCachorroMorar() {
		return cachorroMorar;
	}

	public void setCachorroMorar(char cachorroMorar) {
		this.cachorroMorar = cachorroMorar;
	}

	public char getTrabalhaMorar() {
		return trabalhaMorar;
	}

	public void setTrabalhaMorar(char trabalhaMorar) {
		this.trabalhaMorar = trabalhaMorar;
	}

	public int getCursoMorar() {
		return cursoMorar;
	}

	public void setCursoMorar(int cursoMorar) {
		this.cursoMorar = cursoMorar;
	}

	public String getTipoMoradia() {
		return tipoMoradia;
	}

	public void setTipoMoradia(String tipoMoradia) {
		this.tipoMoradia = tipoMoradia;
	}

	public int getQuantidadePessoas() {
		return quantidadePessoas;
	}

	public void setQuantidadePessoas(int quantidadePessoas) {
		this.quantidadePessoas = quantidadePessoas;
	}

	public PreferenciaModel() {
		super();
	}

	public PreferenciaModel(Double preco, char possuiPreferencia, char sexoMorar, char fumanteMorar, int estadoMorar,
			String cidadeMorar, char zonaMorar, char gatoMorar, char cachorroMorar, char trabalhaMorar, int cursoMorar,
			String tipoMoradia, int quantidadePessoas) {
		super();
		this.preco = preco;
		this.possuiPreferencia = possuiPreferencia;
		this.sexoMorar = sexoMorar;
		this.fumanteMorar = fumanteMorar;
		this.estadoMorar = estadoMorar;
		this.cidadeMorar = cidadeMorar;
		this.zonaMorar = zonaMorar;
		this.gatoMorar = gatoMorar;
		this.cachorroMorar = cachorroMorar;
		this.trabalhaMorar = trabalhaMorar;
		this.cursoMorar = cursoMorar;
		this.tipoMoradia = tipoMoradia;
		this.quantidadePessoas = quantidadePessoas;
	}
	
	
	
}
