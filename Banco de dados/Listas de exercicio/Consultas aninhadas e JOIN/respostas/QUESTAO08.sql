CREATE VIEW projetosPorDepto AS
SELECT p.codDepto, COUNT(p.codigo) AS qtdProj
FROM projeto p
GROUP BY p.codDepto;

SELECT
	d.sigla AS departamento,
  f.nome AS gerente,
  ppd.qtdProj AS 'nº de projetos'
FROM departamento d
	LEFT JOIN funcionario f	ON d.codGerente = f.codigo
  LEFT JOIN projetosPorDepto ppd ON d.codigo = ppd.codDepto;