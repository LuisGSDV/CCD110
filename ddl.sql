-- ddl.sql
-- Sistema de Gestão de Ordens de Serviço
-- PostgreSQL / Supabase
-- ------------------------------------------


CREATE TABLE pessoa (

    id_psa SERIAL PRIMARY KEY,
    nome_psa VARCHAR(120) NOT NULL,
    email_psa VARCHAR(120) NOT NULL UNIQUE,
    rua_end VARCHAR(100) NOT NULL,
    numero_end VARCHAR(10) NOT NULL,
    cidade_end VARCHAR(80) NOT NULL,
    estado_end CHAR(2) NOT NULL

);


CREATE TABLE pessoa_telefone_psa(

    telefone_psa VARCHAR(15),
    id_psa INT,

    PRIMARY KEY(
        telefone_psa,
        id_psa
    ),
    FOREIGN KEY(id_psa)
    REFERENCES pessoa(id_psa)
    ON DELETE CASCADE

);


CREATE TABLE cliente(

    id_psa INT PRIMARY KEY,
    tipo_cli VARCHAR(30)
    NOT NULL,
    data_cad_cli DATE
    NOT NULL,

    FOREIGN KEY(id_psa)
    REFERENCES pessoa(id_psa)

);


CREATE TABLE tecnico(

    id_psa INT PRIMARY KEY,
    especialidade_tec VARCHAR(60) NOT NULL,
    nivel_tec VARCHAR(20) NOT NULL,

    FOREIGN KEY(id_psa)
    REFERENCES pessoa(id_psa)

);


CREATE TABLE equipamento(

    id_eqpm SERIAL PRIMARY KEY,
    tipo_eqpm VARCHAR(50) NOT NULL,
    modelo_eqpm VARCHAR(80) NOT NULL,
    serie_eqpm VARCHAR(50) UNIQUE NOT NULL,
    aquisicao_eqpm DATE,
    id_psa INT NOT NULL,

    FOREIGN KEY(id_psa)
    REFERENCES cliente(id_psa)

);


CREATE TABLE ordem_servico(

    id_oserv SERIAL PRIMARY KEY,
    inicio_oserv DATE NOT NULL,
    conclusao_oserv DATE,
    desc_oserv TEXT,
    status_oserv VARCHAR(20) NOT NULL,
    id_eqpm INT NOT NULL,
    id_psa INT NOT NULL,

    FOREIGN KEY(id_eqpm)
    REFERENCES equipamento(id_eqpm),

    FOREIGN KEY(id_psa)
    REFERENCES cliente(id_psa),

    CHECK(
        status_oserv IN
        ('Aberta',
        'Em andamento',
        'Concluída',
        'Cancelada')
    )

);


CREATE TABLE servico(

    id_serv SERIAL PRIMARY KEY,
    nome_serv VARCHAR(80) NOT NULL,
    desc_serv TEXT,
    valor_serv NUMERIC(10,2) CHECK(valor_serv>=0)

);


CREATE TABLE peca(

    id_peca SERIAL PRIMARY KEY,
    valor_peca NUMERIC(10,2),
    desc_peca TEXT,
    quant_peca INT,
    nome_peca VARCHAR(80)

);


CREATE TABLE executa_servico(

    id_psa INT,
    id_oserv INT,

    PRIMARY KEY(
        id_psa,
        id_oserv
    ),

    FOREIGN KEY(id_psa)
    REFERENCES tecnico(id_psa),

    FOREIGN KEY(id_oserv)
    REFERENCES ordem_servico(id_oserv)

);


CREATE TABLE inclui(

    id_oserv INT,
    id_serv INT,
    qntd_serv INT,

    PRIMARY KEY(
        id_oserv,
        id_serv
    ),

    FOREIGN KEY(id_oserv)
    REFERENCES ordem_servico(id_oserv),

    FOREIGN KEY(id_serv)
    REFERENCES servico(id_serv)

);


CREATE TABLE utiliza(

    id_oserv INT,
    id_peca INT,
    qntd_utilizada INT,

    PRIMARY KEY(
        id_oserv,
        id_peca
    ),

    FOREIGN KEY(id_oserv)
    REFERENCES ordem_servico(id_oserv),

    FOREIGN KEY(id_peca)
    REFERENCES peca(id_peca)

);


CREATE TABLE pagamento(

    id_pag SERIAL PRIMARY KEY,
    valor_pag NUMERIC(10,2),
    hora_pag TIME,
    data_pag DATE,
    metodo_pag VARCHAR(30),
    status_pag VARCHAR(20),
    id_oserv INT,

    FOREIGN KEY(id_oserv)
    REFERENCES ordem_servico(id_oserv)

);