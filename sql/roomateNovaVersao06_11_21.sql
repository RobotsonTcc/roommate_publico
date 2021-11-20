create database ROOMATE
use ROOMATE

--------------------- TABELAS E INSERÇÃO de DADOS FIXOS ---------------------------------------

CREATE TABLE CURSO(
  ID_CURSO  int IDENTITY NOT NULL, 
  DESCRICAO VARCHAR(255) NOT NULL,
  PRIMARY KEY (ID_CURSO)
)

INSERT INTO CURSO VALUES
('NENHUM'),
('ADS - TARDE'),
('ADS - NOITE'),
('ADS - MANHA'),
('ADS - INTEGRAL'),
('COMEX - TARDE'),
('COMEX - NOITE'),
('COMEX - MANHA'),
('COMEX - INTEGRAL'),
('ADMINISTRAÇÃO - TARDE'),
('ADMINISTRAÇÃO - NOITE'),
('ADMINISTRAÇÃO - MANHA'),
('ADMINISTRAÇÃO - INTEGRAL')

select * from curso

CREATE TABLE USUARIO (
  ID_USUARIO   int IDENTITY NOT NULL, 
  NOME         varchar(255) NOT NULL, 
  CPF          char(11) NOT NULL UNIQUE, 
  DATA_NASC    date NOT NULL, 
  SEXO         char(1) NOT NULL CHECK(SEXO = 'M' OR SEXO = 'F'), 
  EMAIL        varchar(255) NOT NULL UNIQUE, 
  SENHA        varchar(255) NOT NULL, 
  DESCRICAO    varchar(max) NOT NULL, 
  CACHORRO     char(1) NOT NULL CHECK(CACHORRO = 'S' OR CACHORRO = 'N'),
  GATO		   char(1) NOT NULL CHECK(GATO = 'S' OR GATO = 'N'),
  FUMANTE	   char(1) NOT NULL CHECK(FUMANTE = 'S' OR FUMANTE = 'N'),
  TRABALHA	   char(1) NOT NULL CHECK(TRABALHA = 'S' OR TRABALHA = 'N'),
  IMAGEM       varbinary(max), 
  ID_CURSO	   int NOT NULL,
  PRIMARY KEY (ID_USUARIO),
  FOREIGN KEY (ID_CURSO) REFERENCES CURSO (ID_CURSO)
 );

CREATE TABLE PREF_ESTADO (
  ID_UF       int IDENTITY NOT NULL, 
  NOME_ESTADO varchar(255) NULL UNIQUE, 
  PRIMARY KEY (ID_UF)
);

CREATE TABLE PREFERENCIA_USUARIO (
  ID_PREFERENCIA    int IDENTITY NOT NULL, 
  ID_USUARIO		int NOT NULL, 
  PREFERENCIA		CHAR(1) NOT NULL CHECK(PREFERENCIA = 'S' OR PREFERENCIA='N'), 
  PREF_VALOR        decimal(7, 2) NOT NULL, 
  PREF_ESTADOID_UF  int NOT NULL, 
  PREF_CIDADE       varchar(255) NOT NULL,
  PREF_ZONA         char(1) NOT NULL CHECK(PREF_ZONA IN ('N', 'S', 'L', 'O', 'C')), 
  PREF_SEXO         char(1) CHECK(PREF_SEXO = 'M' OR PREF_SEXO = 'F'), 
  PREF_FUMANTE      char(1) NULL CHECK(PREF_FUMANTE = 'S' OR PREF_FUMANTE='N'), 
  PREF_CACHORRO		char(1) NULL CHECK(PREF_CACHORRO = 'S' OR PREF_CACHORRO = 'N'),
  PREF_GATO			char(1) NULL CHECK(PREF_GATO = 'S' OR PREF_GATO = 'N'),
  PREF_TRABALHA		char(1) NULL CHECK(PREF_TRABALHA = 'S' OR PREF_TRABALHA = 'N'),
  PREF_IDCURSO		int NOT NULL,
  PRIMARY KEY (ID_PREFERENCIA),
  FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO (ID_USUARIO),
  FOREIGN KEY (PREF_ESTADOID_UF) REFERENCES PREF_ESTADO (ID_UF),
  FOREIGN KEY (PREF_IDCURSO) REFERENCES CURSO (ID_CURSO)
);

ALTER TABLE PREFERENCIA_USUARIO ADD PREF_TIPORES VARCHAR(15) NULL CHECK (PREF_TIPORES='CASA' OR PREF_TIPORES='APARTAMENTO')
ALTER TABLE PREFERENCIA_USUARIO ADD PREF_QUANTPessoa INT NULL CHECK (PREF_QUANTPessoa>0 OR PREF_QUANTPessoa<6)
--SELECT * FROM PREFERENCIA_USUARIO

--ALTER TABLE PREFERENCIA_USUARIO ALTER COLUMN PREFERENCIA CHAR(1) NOT NULL 
--ALTER TABLE PREFERENCIA_USUARIO ADD CONSTRAINT PREFERENCIA CHECK(PREFERENCIA = 'S' OR PREFERENCIA='N') 

CREATE TABLE RELACIONAMENTO_USUARIO (
  ID_RELACIONAMENTO  int IDENTITY NOT NULL, 
  ID_USUARIO1 int NOT NULL, 
  ID_USUARIO2 int NOT NULL, 
  ACEITE1            char(1) NULL, 
  ACEITE2            char(1) NULL, 
  PRIMARY KEY (ID_RELACIONAMENTO)
);
ALTER TABLE RELACIONAMENTO_USUARIO ADD CONSTRAINT FKRELACIONAM871785 FOREIGN KEY (ID_USUARIO1) REFERENCES USUARIO (ID_USUARIO);
ALTER TABLE RELACIONAMENTO_USUARIO ADD CONSTRAINT FKRELACIONAM871786 FOREIGN KEY (ID_USUARIO2) REFERENCES USUARIO (ID_USUARIO);

CREATE TABLE CHAT_USUARIOS (
  ID_CHAT                                 int IDENTITY NOT NULL, 
  NOME_ARQUIVO                            varchar(255) NULL UNIQUE, 
  ID_RELACIONAMENTO int NOT NULL, 
  PRIMARY KEY (ID_CHAT),
  FOREIGN KEY (ID_RELACIONAMENTO) REFERENCES RELACIONAMENTO_USUARIO(ID_RELACIONAMENTO)
);

INSERT INTO PREF_ESTADO VALUES
('RO'),
('AC'),
('AM'),
('RR'),
('PA'),
('AP'),
('TO'),
('MA'),
('PI'),
('CE'),
('RN'),
('PB'),
('PE'),
('AL'),
('SE'),
('BA'),
('MG'),
('ES'),
('RJ'),
('SP'),
('PR'),
('SC'),
('RS'),
('MS'),
('MT'),
('GO'),
('DF')

--------------------- PROCEDURES E FUNÇÕES ---------------------------------------

--- Inserir informações pessoais ---
CREATE PROCEDURE SP_InsereUsuario_INS(@nome varchar(255), @CPF char(11), @DATA_NASC date, @SEXO char(1), @EMAIL varchar(255), 
										@senha varchar(max), @DESCRICAO varchar(max), @cachorro char(1), @gato char(1), @fumante char(1),
										@trabalha char(1), @imagem varbinary(max), @curso int)
AS

DECLARE @CONTCPF SMALLINT
DECLARE @CONTEMAIL SMALLINT

SET @CONTCPF = (SELECT COUNT(CPF) FROM USUARIO WHERE CPF = @CPF)
SET @CONTEMAIL = (SELECT COUNT(EMAIL) FROM USUARIO WHERE EMAIL = @EMAIL)

	IF(@CONTCPF > 0)
	BEGIN
		RAISERROR('CFP já cadastrado',16,1)
	END
	ELSE
	BEGIN
		IF(@CONTEMAIL > 0)
		BEGIN
			RAISERROR('Email já cadastrado',16,1)
		END
		ELSE
		BEGIN
			insert into USUARIO values (@nome, @CPF, @DATA_NASC, @SEXO, @EMAIL, @senha, @DESCRICAO, @cachorro, @gato,@fumante,@trabalha,@imagem, @curso)
		END
	END

--Update infos pessoais
CREATE PROCEDURE SP_AtualizaValoresUsuario_UPD (@nome varchar(255), @DATA_NASC date, 
										@senha varchar(max), @DESCRICAO varchar(max), @cachorro char(1), @gato char(1), @fumante char(1),
										@trabalha char(1), @imagem varbinary(max), @curso int, @id int)
AS

	UPDATE USUARIO SET NOME = @nome, DATA_NASC = @DATA_NASC , SENHA=@senha, DESCRICAO=@DESCRICAO, 
		CACHORRo=@cachorro, GATO=@gato, FUMANTE=@fumante, TRABALHA=@trabalha, IMAGEM=@imagem, ID_CURSO=@curso WHERE ID_USUARIO = @id


--- Inserir preferencias ---
ALTER PROCEDURE SP_InserePreferencia_INSUPD(@ID_USUARIO INT, @preferencia char(1), @VALOR money, @PREF_ESTADOID_UF INT, @PREF_CIDADE VARCHAR(255),
										@PREF_ZONA CHAR(1),	@PREF_SEXO CHAR(1), @PREF_FUMANTE CHAR(1), @PREF_CACHORRO char(1), @PREF_GATO char(1),
										@PREF_TRABALHA CHAR(1), @PREF_IDCURSO int, @PREF_TIPORES VARCHAR(15), @PREF_QUANTPessoa INT)
AS
	DECLARE @CONT SMALLINT
	SET @CONT = (SELECT COUNT(ID_USUARIO) FROM PREFERENCIA_USUARIO WHERE ID_USUARIO = @ID_USUARIO)

	IF @CONT > 0
	BEGIN
		UPDATE PREFERENCIA_USUARIO SET PREFERENCIA = @preferencia,
									PREF_VALOR = @VALOR, 
									PREF_ESTADOID_UF = @PREF_ESTADOID_UF , 
									PREF_CIDADE = @PREF_CIDADE, 
									PREF_ZONA = @PREF_ZONA,
									PREF_SEXO = @PREF_SEXO, 
									PREF_FUMANTE = @PREF_FUMANTE, 
									PREF_CACHORRO = @PREF_CACHORRO, 
									PREF_GATO = @PREF_GATO,
									PREF_TRABALHA = @PREF_TRABALHA,
									PREF_IDCURSO = @PREF_IDCURSO,
									PREF_TIPORES = @PREF_TIPORES,
									PREF_QUANTPessoa = @PREF_QUANTPessoa
		WHERE ID_USUARIO = @ID_USUARIO
	END
	ELSE
	BEGIN
		INSERT INTO PREFERENCIA_USUARIO VALUES (@ID_USUARIO, @preferencia, @VALOR, @PREF_ESTADOID_UF, @PREF_CIDADE, @PREF_ZONA, @PREF_SEXO,
											@PREF_FUMANTE,@PREF_CACHORRO,@PREF_GATO,@PREF_TRABALHA,@PREF_IDCURSO,@PREF_TIPORES,@PREF_QUANTPessoa  )
	END


--- Relacionamento e Criar CHAT ---
CREATE PROCEDURE SP_RelacionamentoUsuario_INSUPD (@usuarioSession int, @usuarioSegundo int, @acao char(1))
AS
	--UsurioSession é o que realizou a ação
	--UsuarioSegundo é o usuario que o UsuarioSession aceitou ou recusou
	--Acao é a escolha do UsuarioSession

	--verifica se já existe algum relacionamento entre eles 
	DECLARE @CONT INT
	SET @CONT = (SELECT COUNT(ID_RELACIONAMENTO) FROM RELACIONAMENTO_USUARIO 
		WHERE ID_USUARIO1 = @usuarioSession AND ID_USUARIO2 = @usuarioSegundo)

	SET @CONT = @CONT + (SELECT COUNT(ID_RELACIONAMENTO) FROM RELACIONAMENTO_USUARIO 
		WHERE ID_USUARIO2 = @usuarioSession AND ID_USUARIO1 = @usuarioSegundo)
	
	-- Se não existir, cria e insere a resposta 
	IF @CONT = 0 
	BEGIN
		INSERT INTO RELACIONAMENTO_USUARIO VALUES (@usuarioSession, @usuarioSegundo, @acao, NULL)
	END
	ELSE
	BEGIN
		DECLARE @indentifica smallint
		
		--se achar algum valor é pq o usuario da session está na primeira coluna
		SET @indentifica = (SELECT COUNT(ID_RELACIONAMENTO) FROM RELACIONAMENTO_USUARIO 
			WHERE ID_USUARIO1 = @usuarioSession AND ID_USUARIO2 = @usuarioSegundo)

		if @indentifica <> 0
		BEGIN
			UPDATE RELACIONAMENTO_USUARIO SET ACEITE1 = @acao WHERE ID_USUARIO1 = @usuarioSession AND ID_USUARIO2 = @usuarioSegundo
		END
		ELSE
		BEGIN
			SET @indentifica = (SELECT COUNT(ID_RELACIONAMENTO) FROM RELACIONAMENTO_USUARIO WHERE ID_USUARIO1 =@usuarioSegundo  AND ID_USUARIO2 = @usuarioSession)
			IF @indentifica <> 0
			BEGIN
				UPDATE RELACIONAMENTO_USUARIO SET ACEITE2 = @acao WHERE ID_USUARIO1 = @usuarioSegundo  AND ID_USUARIO2 = @usuarioSession
			END
		END

	END

	-- Verifica se os 2 definiram como s, se acontecer cria a tabela de chat
	DECLARE @VERIFICA INT

	SET @VERIFICA = (SELECT COUNT(ID_RELACIONAMENTO) FROM RELACIONAMENTO_USUARIO WHERE
								ID_USUARIO1 = @usuarioSession AND ACEITE1 = 'S'
								AND ID_USUARIO2 = @usuarioSegundo and ACEITE2 = 'S')

	SET @VERIFICA = @VERIFICA + (SELECT COUNT(ID_RELACIONAMENTO) FROM RELACIONAMENTO_USUARIO WHERE
								ID_USUARIO1 = @usuarioSegundo AND ACEITE1 = 'S'
								AND ID_USUARIO2 = @usuarioSession and ACEITE2 = 'S')

	IF @VERIFICA > 0
	BEGIN
		DECLARE @NOME VARCHAR (20)
		DECLARE @ID int

		set @ID = (select ID_RELACIONAMENTO FROM RELACIONAMENTO_USUARIO where (ID_USUARIO1 = @usuarioSession AND ID_USUARIO2 = @usuarioSegundo)
			or (ID_USUARIO1 = @usuarioSegundo AND ID_USUARIO2 = @usuarioSession))

		SET @NOME  = 'CHAT_' + cast(IDENT_CURRENT('CHAT_USUARIOS') + 1 as varchar(10)) 

		INSERT INTO CHAT_USUARIOS VALUES (@NOME, @ID)
	END

--- Excluir relacionamento e CHAT(quando o usuario excluir a conversa) ---
CREATE PROCEDURE SP_RelacionamentoUsuario_DEL (@ID_CHAT INT) 
AS
	DECLARE @relaciona int
	SET @relaciona = (SELECT B.ID_RELACIONAMENTO 
		FROM CHAT_USUARIOS AS A
		INNER JOIN RELACIONAMENTO_USUARIO as b
		ON A.ID_RELACIONAMENTO = B.ID_RELACIONAMENTO
		WHERE A.ID_CHAT = @ID_CHAT)

	UPDATE RELACIONAMENTO_USUARIO SET ACEITE1 = 'N', ACEITE2 = 'N' WHERE ID_RELACIONAMENTO = @relaciona
	DELETE CHAT_USUARIOS WHERE ID_CHAT = @ID_CHAT

--- Validar o login ---
CREATE PROCEDURE SP_LOGIN_SEL (@EMAIL VARCHAR(255), @SENHA VARCHAR(255)) 
AS

	IF( (SELECT EMAIL FROM USUARIO WHERE EMAIL = @EMAIL) IS NULL )
	BEGIN
		RAISERROR('Usuario não encontrado',16,1)
	END
	ELSE
	BEGIN
		IF ( (SELECT EMAIL FROM USUARIO WHERE EMAIL = @EMAIL AND SENHA=@SENHA) IS NULL)
		BEGIN
			RAISERROR('Senha Invalida',16,1)
		end 
		ELSE
		BEGIN
			SELECT ID_USUARIO FROM USUARIO WHERE EMAIL = @EMAIL AND SENHA=@SENHA
		END
	END

--- Mostra CHATS Disponiveis ---
ALTER PROCEDURE SP_MostraChat_SEL (@ID_USUARIO int)
AS
	SELECT
		CASE 
			WHEN b.ID_USUARIO1 =  @ID_USUARIO THEN u2.NOME
			WHEN b.ID_USUARIO2 =  @ID_USUARIO THEN u1.NOME
		END AS nome, 

		CASE 
			WHEN b.ID_USUARIO1 =  @ID_USUARIO THEN u2.ID_USUARIO
			WHEN b.ID_USUARIO2 =  @ID_USUARIO THEN u1.ID_USUARIO
		END AS id, 

		CASE 
			WHEN b.ID_USUARIO1 =  @ID_USUARIO THEN u2.IMAGEM
			WHEN b.ID_USUARIO2 =  @ID_USUARIO THEN u1.IMAGEM
		END AS foto,

	b.ID_RELACIONAMENTO as id_relacionamento

	FROM CHAT_USUARIOS AS A
	INNER JOIN RELACIONAMENTO_USUARIO as b 
	ON A.ID_RELACIONAMENTO = B.ID_RELACIONAMENTO
	inner join USUARIO as u1 
	on u1.ID_USUARIO = b.ID_USUARIO1
	inner join USUARIO as u2 
	on u2.ID_USUARIO = b.ID_USUARIO2
	WHERE u1.ID_USUARIO = @ID_USUARIO or u2.ID_USUARIO = @ID_USUARIO

--- Visualizar as proprias infos
alter Procedure sp_VisualizaPropriasinfos_SEL (@ID_USUARIO INT)
AS
	select A.NOME,a.CPF, a.EMAIL, A.DATA_NASC, A.SEXO, A.SENHA, A.DESCRICAO, A.CACHORRO, A.GATO, A.FUMANTE, A.TRABALHA, A.IMAGEM, A.ID_CURSO,  
 C.DESCRICAO AS DESCRICAO_CURSO,B.PREFERENCIA,B.PREF_VALOR, B.PREF_ESTADOID_UF, D.NOME_ESTADO, B.PREF_CIDADE, B.PREF_ZONA, B.PREF_SEXO,   
 B.PREF_FUMANTE, PREF_CACHORRO, B.PREF_GATO, B.PREF_TRABALHA, B.PREF_IDCURSO, E.DESCRICAO AS DESCRICAO_CURSO_2, B.PREF_TIPORES, B.PREF_QUANTPessoa   
  
 from Usuario AS A INNER JOIN PREFERENCIA_USUARIO AS B  
 ON A.ID_USUARIO = B.ID_USUARIO  
  
 INNER JOIN curso as C  
 ON A.ID_CURSO = C.ID_CURSO  
  
 INNER JOIN PREF_ESTADO AS D  
 ON D.ID_UF = B.PREF_ESTADOID_UF  
  
 INNER JOIN curso as E  
 ON B.PREF_IDCURSO = E.ID_CURSO  
  
 where A.ID_USUARIO = @ID_USUARIO

-- Visualizar outros perfis simplicado
Create Procedure sp_VisualizaInfosOutrosUsuarioSimplicado_SEL (@ID_USUARIO INT)
AS
	select A.IMAGEM,A.NOME, A.SEXO, A.DESCRICAO, C.NOME_ESTADO, B.PREF_CIDADE, B.PREF_ZONA, B.PREF_VALOR
	from Usuario as A
	inner join PREFERENCIA_USUARIO as B
	on A.ID_USUARIO = B.ID_USUARIO
	inner join PREF_ESTADO as C
	on B.PREF_ESTADOID_UF = C.ID_UF
	where a.ID_USUARIO = @ID_USUARIO

-- Visualizar outros perfis detalhados
Create Procedure sp_VisualizaInfosOutrosUsuario_SEL (@ID_USUARIO INT)
AS
	select A.IMAGEM,A.NOME, A.SEXO, A.DATA_NASC, A.DESCRICAO, A.CACHORRO, A.GATO, A.FUMANTE, A.TRABALHA, D.DESCRICAO,
		C.NOME_ESTADO, B.PREF_CIDADE, B.PREF_ZONA, B.PREF_VALOR
	from Usuario as A

	inner join PREFERENCIA_USUARIO as B
	on A.ID_USUARIO = B.ID_USUARIO

	inner join PREF_ESTADO as C
	on B.PREF_ESTADOID_UF = C.ID_UF

	inner join CURSO as D
	on a.ID_CURSO = d.ID_CURSO

	where a.ID_USUARIO = @ID_USUARIO

--Retorna numero do chat 
CREATE PROCEDURE SP_SelecionaNumeroChat(@idUsuario1 int, @idUsuario2 int)
AS

	Select ID_CHAT
	from chat_usuarios as a inner join relacionamento_usuario as b
	on a.id_relacionamento = b.id_relacionamento
	where 
	(b.ID_USUARIO1 = @idUsuario1 and b.ID_USUARIO2 = @idUsuario2)
	OR
	(b.ID_USUARIO2 = @idUsuario1 and b.id_Usuario1 = @idUsuario2)

exec SP_SelecionaNumeroChat 3,5


--Função que auxilia na procedure de match
CREATE FUNCTION FN_ExisteRelacionamento_SEL (@id1 int, @id2 int)
RETURNS INT
AS
	BEGIN

		DECLARE @VERIFICA INT
		SET @VERIFICA = 0

		SET @VERIFICA = @VERIFICA + (SELECT count(ID_RELACIONAMENTO) FROM RELACIONAMENTO_USUARIO WHERE ID_USUARIO1 = @id1 AND ID_USUARIO2 = @id2)

		SET @VERIFICA = @VERIFICA + (SELECT count(ID_RELACIONAMENTO) FROM RELACIONAMENTO_USUARIO WHERE ID_USUARIO1 = @id2 AND ID_USUARIO2 = @id1)

	RETURN @VERIFICA
END

-- Procedure de Match 
ALTER PROCEDURE SP_PerfisCompativeis_SEL (@ID_USUARIO int)
AS

	DECLARE @tabela table(
		id int,
		pontos int
	)

		declare 
			@SEXO CHAR(1),
			@CIDADE VARCHAR(255),
			@ESTADO int, 
			@CACHORRO CHAR(1),
			@GATO CHAR(1),
			@FUMANTE CHAR(1),
			@ZONA CHAR(1),
			@TRABALHA CHAR(1),
			@CURSO INT,
			@VALOR MONEY,
			@QTPESSOA int,
			@TIPORES varchar(15)

		set @CIDADE = (SELECT PREF_CIDADE from PREFERENCIA_USUARIO where id_USUARIO = @id_usuario)
		set @ESTADO = (SELECT PREF_ESTADOID_UF from PREFERENCIA_USUARIO where id_USUARIO = @id_usuario)
		set @ZONA = (SELECT PREF_ZONA from PREFERENCIA_USUARIO where id_USUARIO = @id_usuario)
		set @VALOR = (SELECT PREF_VALOR from PREFERENCIA_USUARIO where id_USUARIO = @id_usuario)
		SET @QTPESSOA = (SELECT PREF_QUANTPessoa  from PREFERENCIA_USUARIO where id_USUARIO = @id_usuario)
		SET @TIPORES = (SELECT PREF_TIPORES  from PREFERENCIA_USUARIO where id_USUARIO = @id_usuario)

		set @SEXO = (SELECT SEXO from USUARIO where id_USUARIO = @id_usuario)
		set @CACHORRO = (SELECT CACHORRO from USUARIO where id_USUARIO = @id_usuario)
		set @GATO = (SELECT GATO from USUARIO where id_USUARIO = @id_usuario)
		set @FUMANTE = (SELECT FUMANTE from USUARIO where id_USUARIO = @id_usuario)
		set @TRABALHA = (SELECT TRABALHA from USUARIO where id_USUARIO = @id_usuario)
		set @CURSO = (SELECT ID_CURSO from USUARIO where id_USUARIO = @id_usuario)

	-- Insere na variavel de tabela, seguindo a coluna de preferencia

	IF ( (SELECT preferencia from PREFERENCIA_USUARIO where id_USUARIO = @id_usuario) = 'N')
	BEGIN
		INSERT INTO @tabela
			select U.ID_USUARIO, NULL
			from USUARIO AS U INNER JOIN PREFERENCIA_USUARIO AS PU
			ON U.ID_USUARIO = PU.ID_USUARIO
			WHERE 
				@CIDADE = PU.PREF_CIDADE
				AND @ESTADO = PU.PREF_ESTADOID_UF
				AND @VALOR > PU.PREF_VALOR*1.5 OR @VALOR > PU.PREF_VALOR*0.5
				AND U.ID_USUARIO <> @ID_USUARIO
	
	END
	ELSE
	BEGIN
		insert into @tabela
			select PU.ID_USUARIO,null
			from USUARIO AS U INNER JOIN PREFERENCIA_USUARIO AS PU
			ON U.ID_USUARIO = PU.ID_USUARIO
			WHERE
				PU.ID_USUARIO <> @id_usuario
				AND u.SEXO = @SEXO
				AND pu.PREF_ESTADOID_UF = @ESTADO
				AND pu.PREF_CIDADE = @CIDADE
				AND U.FUMANTE = @FUMANTE
	END

	------------------- Cursor que Calcula os pontos e valida se já não existe o relacionamento ----------------------------
	DECLARE @id int
	DECLARE @pontos int
	declare @verifica int

	DECLARE tab_cursor CURSOR FOR 
		SELECT id FROM @tabela
		OPEN tab_cursor
			FETCH NEXT FROM tab_cursor INTO @id 

			WHILE @@FETCH_STATUS = 0
			BEGIN
				set @pontos = 0
				set @verifica = (select dbo.FN_ExisteRelacionamento_SEL (@id_usuario,@id))

				if(@verifica = 0)
				begin
					--------------- Zona ----------------
					IF (@ZONA = (SELECT PREF_ZONA from PREFERENCIA_USUARIO where id_USUARIO = @id))
					BEGIN
						set @pontos = @pontos + 20 
					END
					ELSE
					BEGIN
						set @pontos = @pontos + 10 
					END

					--------------- Trabalha ----------------
					IF (@TRABALHA = (SELECT TRABALHA from USUARIO where id_USUARIO = @id))
					BEGIN
						set @pontos = @pontos + 20 
					END
					ELSE
					BEGIN
						set @pontos = @pontos + 10 
					END
				
					--------------- Curso ----------------
					IF (@CURSO = (SELECT ID_CURSO from USUARIO where id_USUARIO = @id))
					BEGIN
						set @pontos = @pontos + 20 
					END
					ELSE
					BEGIN
						set @pontos = @pontos + 10 
					END

					--------------- Tipo Residencia ----------------
					declare @outroTipoRES VARCHAR(15)
					set @outroTipoRES = (SELECT PREF_TIPORES from PREFERENCIA_USUARIO where id_USUARIO = @id)

					IF (@TIPORES  = @outroTipoRES)
					BEGIN
						set @pontos = @pontos + 20 
					END
					ELSE
					BEGIN
						set @pontos = @pontos + 10 
					END

					--------------- Quantidade Pessoa ----------------
					declare @outroQuantPessoa int
					set @outroQuantPessoa = (SELECT PREF_QUANTPessoa from PREFERENCIA_USUARIO where id_USUARIO = @id)

					IF (@QTPESSOA   = @outroQuantPessoa)
					BEGIN
						set @pontos = @pontos + 30 
					END
					ELSE
					BEGIN
						if (	(@QTPESSOA = @outroQuantPessoa+1) or (@QTPESSOA = @outroQuantPessoa-1)	)
						begin
							set @pontos = @pontos + 20 
						end
						else
						begin
							set @pontos = @pontos + 10
						end
					END
					--------------- Valor ----------------
					declare @outroValor money
					set @outroValor = (SELECT PREF_VALOR from PREFERENCIA_USUARIO where id_USUARIO = @id)

					IF (@VALOR = @outroValor)
					BEGIN
						set @pontos = @pontos + 30

					END
					ELSE
					BEGIN
						IF (	(@VALOR = @outroValor*1.2) or	(@VALOR = @outroValor*0.8)	)
						BEGIN
							set @pontos = @pontos + 20

						END
						ELSE
						BEGIN
							set @pontos = @pontos + 10
						END
					END 

					UPDATE @tabela SET pontos = @pontos where id = @id
			END			
			ELSE
			BEGIN
				delete from @tabela where id = @id 
			END

		FETCH NEXT FROM tab_cursor INTO @id

		END

		CLOSE tab_cursor
		DEALLOCATE tab_cursor

		--SELECT id as perfis FROM @tabela order by pontos desc

		select b.nome, b.SEXO, b.DESCRICAO, b.CACHORRO, b.GATO, b.FUMANTE, b.TRABALHA, b.IMAGEM, c.descricao
		from @tabela as a inner join USUARIO as b
		on a.id = b.ID_USUARIO
		inner join CURSO as c
		on b.id_curso = c.id_curso
		order by a.pontos desc

--------------------- TESTE PROCEDURES ---------------------------------------
EXEC SP_InsereUsuario_INS 'Lucas Guilherme', '123455678912', '06-17-2000', 'M', 'lucas@teste.com', '12345', 'teste do perfil lucas', 'S', 'N', 
	'N','S', 0x89504E470D0A1A0A00000, '2'

EXEC SP_InsereUsuario_INS 'Francisco', '123455678956', '01-01-2001', 'M', 'Francisco@teste.com', '12345', 'teste do perfil Francisco', 'N', 'N', 
	'N','S', 0x89504E470D0A1A0A00000, '3'

EXEC SP_InsereUsuario_INS 'Maria', '1234522378956', '01-01-2001', 'F', 'Maria@teste.com', '12345', 'teste do perfil Maria', 'S', 'N', 
	'N','S', 0x89504E470D0A1A0A00000, '1'

EXEC SP_InsereUsuario_INS 'Joana', '145755678956', '01-01-2001', 'F', 'Joana@teste.com', '12345', 'teste do perfil Joana', 'N', 'S', 
	'N','S', 0x89504E470D0A1A0A00000, '4'

EXEC SP_InsereUsuario_INS 'Afonso', '1234422378956', '01-01-2001', 'M', 'Afonso@teste.com', '12345', 'teste do perfil Afonso', 'N', 'N', 
	'S','S', 0x89504E470D0A1A0A00000, '1'

EXEC SP_InsereUsuario_INS 'Karoline', '126755677856', '01-01-2001', 'F', 'Karoline@teste.com', '12345', 'teste do perfil Karoline', 'N', 'N', 
	'S','S', 0x89504E470D0A1A0A00000, '1'

exec SP_AtualizaValoresUsuario_UPD 'Karoline','01-01-2001','12345','teste do perfil Karoline','N', 'N', 'N','S', 0x89504E470D0A1A0A00000, 
	'1', 6
----
EXEC SP_InserePreferencia_INSUPD 1, 'S', 1200, 20, 'São Paulo', 'L', 'M', 'N', 'S', 'S', 'S', 1, 'APARTAMENTO', 2
EXEC SP_InserePreferencia_INSUPD 2, 'N', 1200, 20, 'São Paulo', 'L', NULL, NULL, NULL, NULL, NULL, 1
EXEC SP_InserePreferencia_INSUPD 3, 'S', 1200, 20, 'São Paulo', 'L', 'F', 'N', 'S', 'S', 'S', 1
EXEC SP_InserePreferencia_INSUPD 4, 'N', 1200, 20, 'São Paulo', 'N', NULL, NULL, NULL, NULL, NULL, 1
EXEC SP_InserePreferencia_INSUPD 5, 'N', 1200, 20, 'São Paulo', 'O', NULL, NULL, NULL, NULL, NULL, 1
EXEC SP_InserePreferencia_INSUPD 6, 'S', 1200, 20, 'São Paulo', 'S', 'F', 'N', 'S', 'S', 'S', 1
--SELECT * FROM PREFERENCIA_USUARIO
---

EXEC SP_LOGIN_SEL  'lucas@teste.com', '12345'

EXEC sp_VisualizaPropriasinfos_SEL 1

EXEC sp_VisualizaInfosOutrosUsuarioSimplicado_SEL 1

EXEC sp_VisualizaInfosOutrosUsuario_SEL 1

select * from USUARIO

--> Afonso(5) - Maria(3)
EXEC SP_RelacionamentoUsuario_INSUPD 5,3,'S'
EXEC SP_RelacionamentoUsuario_INSUPD 3,5,'S'

EXEC SP_RelacionamentoUsuario_INSUPD 5,6,'S'
EXEC SP_RelacionamentoUsuario_INSUPD 6,5,'S'

--select * from RELACIONAMENTO_USUARIO 
--select * from CHAT_USUARIOS

EXEC SP_MostraChat_SEL 5

select dbo.FN_ExisteRelacionamento_SEL (5,3)


exec SP_SelecionaNumeroChat 5,6

EXEC SP_PerfisCompativeis_SEL 4
--> lucas : Francisco
--> francisco : Lucas, maria, joana, Afonso, Karoline
--> Maria : Joana, Karoline					
--> Joana:  Lucas, Francisco, maria, Afonso, Karoline 		
--> Afonso: Lucas, Francisco, maria, Joana, Karoline
--> Karoline : Joana, Maria	

select * from usuario

select * from CHAT_USUARIOS
select * from RELACIONAMENTO_USUARIO

delete RELACIONAMENTO_USUARIO where ID_RELACIONAMENTO not in (1,2)






