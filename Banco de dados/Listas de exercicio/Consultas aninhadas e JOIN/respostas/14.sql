CREATE VIEW
  num_atividades AS
SELECT
  a.cod_responsavel,
  COUNT(a.cod_responsavel) AS quantidade
FROM
  atividade a
GROUP BY
  a.cod_responsavel;

SELECT
  f.nome,
  na.quantidade
FROM
  funcionario f
  JOIN num_atividades na ON f.codigo = na.cod_responsavel;