-- dml.sql
-- Sistema de Gestão de Ordens de Serviço
-- PostgreSQL / Supabase
-- -------------------------------------------


INSERT INTO pessoa
(nome_psa,email_psa,rua_end,numero_end,cidade_end,estado_end)
VALUES
('Carlos Silva','carlos@gmail.com','Rua A','20','São Bernardo','SP'),
('Ana Souza','ana@gmail.com','Rua B','44','São Bernardo','SP'),
('Pedro Lima','pedro@gmail.com','Rua C','12','São Bernardo','SP'),
('Lucas Mendes','lucas@gmail.com','Rua D','55','São Bernardo','SP'),
('Fernanda Rocha','fernanda@gmail.com','Rua E','22','Santo André','SP'),
('Rafael Costa','rafael@gmail.com','Rua F','70','São Bernardo','SP');


INSERT INTO pessoa_telefone_psa
VALUES
('11999999999',1),
('11888888888',1),
('11777777777',2),
('11666666666',3),
('11555555555',4),
('11444444444',5),
('11333333333',6);


INSERT INTO cliente
VALUES
(1,'Pessoa Física','2026-01-10'),
(2,'Pessoa Física','2026-01-15'),
(3,'Residencial','2026-02-02');


INSERT INTO tecnico
VALUES
(4,'Hardware','Pleno'),
(5,'Software','Sênior'),
(6,'Redes','Júnior');


INSERT INTO equipamento
(tipo_eqpm,modelo_eqpm,serie_eqpm,
aquisicao_eqpm,id_psa)

VALUES
('Notebook','Dell G15','ABC111',
'2024-10-01',1),

('Desktop','Lenovo T5','XYZ222',
'2025-02-01',2),

('Impressora','HP Laser','HP333',
'2023-04-01',3);


INSERT INTO ordem_servico
(inicio_oserv,
desc_oserv,
status_oserv,
id_eqpm,
id_psa)

VALUES

('2026-04-01',
'Equipamento não liga',
'Concluída',
1,
1),

('2026-04-03',
'Tela azul',
'Em andamento',
2,
2),

('2026-04-08',
'Falha na impressão',
'Concluída',
3,
3);


INSERT INTO servico
(nome_serv,desc_serv,valor_serv)
VALUES
('Limpeza','Limpeza interna',100),
('Troca SSD','Substituição SSD',250),
('Atualização','Atualização software',80);


INSERT INTO peca
(valor_peca,desc_peca,quant_peca,nome_peca)
VALUES
(300,'SSD Kingston',10,'SSD'),
(180,'Memória RAM',20,'RAM'),
(220,'Fonte 500W',5,'Fonte');


INSERT INTO executa_servico
VALUES
(4,1),
(5,1),
(5,2),
(6,3);


INSERT INTO inclui
VALUES
(1,1,1),
(1,2,1),
(2,3,2),
(3,1,1);


INSERT INTO utiliza
VALUES
(1,1,1),
(2,2,2),
(3,3,1);


INSERT INTO pagamento
(valor_pag,
hora_pag,
data_pag,
metodo_pag,
status_pag,
id_oserv)

VALUES
(400,'14:00','2026-04-10',
'PIX','Pago',1),

(250,'15:30','2026-04-15',
'Cartão','Pago',1),

(220,'18:00','2026-04-12',
'PIX','Pago',3);