SELECT
  p.nome as projeto,
  p.dataInicio,
  p.dataFim,
  a.descricao as atividade,
  a.dataInicio,
  a.dataFim
FROM
  projeto p
  JOIN atividade a ON a.codProjeto = p.codigo
WHERE
  a.dataInicio < p.dataInicio
  OR a.dataFim > p.dataFim;