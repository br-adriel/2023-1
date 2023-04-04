SELECT
  p.nome AS nomeProjeto,
  p.dataInicio AS dataInicioProjeto,
  p.dataFim AS dataFimProjeto,
  a.descricao AS descricaoAtividade,
  a.dataInicio AS dataInicioAtividade,
  a.dataFim AS dataFimAtividade
FROM projeto p
	JOIN atividadeProjeto ap ON p.codigo = ap.codProjeto
  JOIN atividade a ON a.codigo = ap.codAtividade;