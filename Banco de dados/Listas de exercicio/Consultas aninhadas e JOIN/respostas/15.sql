CREATE VIEW
  atividades_por_projeto AS
SELECT
  ap.cod_projeto,
  count(ap.cod_projeto) as num
FROM
  atividade_projeto ap
GROUP BY
  ap.cod_projeto;

CREATE VIEW
  resp_atividade_proj AS
SELECT
  ap.cod_projeto,
  count(a.cod_reponsavel) AS num
FROM
  atividade_projeto ap
  JOIN atividade a ON ap.cod_atividade = a.codigo
GROUP BY
  ap.cod_projeto,
  a.cod_responsavel;

SELECT
  p.nome AS projeto,
  f.nome AS responsavel,
  app.num AS atividades,
  rap.num AS responsaveis
FROM
  projeto p
  LEFT JOIN app ON p.codigo = app.cod_projeto
  JOIN resp_atividade_proj ON rap.cod_projeto = p.codigo
  JOIN funcionario f ON f.codigo = p.cod_responsavel;