
-- dql.sql
-- Sistema de Gestão de Ordens de Serviço
-- -----------------------------------------


-- Consulta 1
-- Objetivo:
-- Exibir ordens de serviço concluídas junto ao cliente
-- e equipamento associado.
--
-- Relevância:
-- Permite visualizar atendimentos finalizados,
-- facilitando consultas históricas e acompanhamento
-- do serviço realizado.


SELECT

o.id_oserv,
p.nome_psa,
e.modelo_eqpm,
o.status_oserv,
o.inicio_oserv

FROM ordem_servico o

JOIN cliente c
ON o.id_psa = c.id_psa

JOIN pessoa p
ON c.id_psa = p.id_psa

JOIN equipamento e
ON o.id_eqpm = e.id_eqpm

WHERE o.status_oserv='Concluída'

ORDER BY o.inicio_oserv DESC;




-- Consulta 2
-- Objetivo:
-- Mostrar quantas ordens cada técnico executou.
--
-- Relevância:
-- Permite analisar produtividade dos técnicos
-- e identificar distribuição de atendimentos.

SELECT

p.nome_psa,

COUNT(es.id_oserv)
AS total_ordens

FROM tecnico t

JOIN pessoa p
ON t.id_psa=p.id_psa

JOIN executa_servico es
ON t.id_psa=es.id_psa

GROUP BY p.nome_psa

ORDER BY total_ordens DESC;




-- Consulta 3
-- Objetivo:
-- Exibir clientes cujo total gasto foi superior
-- à média geral das ordens registradas.
--
-- Relevância:
-- Permite identificar clientes com maior volume
-- financeiro e analisar comportamento de consumo.

SELECT

p.nome_psa,

SUM(pg.valor_pag)
AS total_gasto

FROM pessoa p

JOIN cliente c
ON p.id_psa=c.id_psa

JOIN ordem_servico os
ON c.id_psa=os.id_psa

JOIN pagamento pg
ON os.id_oserv=pg.id_oserv

GROUP BY p.nome_psa

HAVING

SUM(pg.valor_pag)
>

(

SELECT AVG(total)

FROM(

SELECT
SUM(valor_pag)
AS total

FROM pagamento

GROUP BY id_oserv

) x

)

ORDER BY total_gasto DESC;