CREATE VIEW funcionariosPorDepto AS
SELECT f.codDepto, COUNT(f.codigo) AS qtdFunc
FROM funcionario f
GROUP BY f.codDepto;

SELECT
	d.sigla as departamento,
  f.nome as gerente,
  fpd.qtdFunc as 'nº de funcinarios'
FROM departamento d
	LEFT JOIN funcionario f	ON d.codGerente = f.codigo
  LEFT JOIN funcionariosPorDepto fpd ON d.codigo = fpd.codDepto;
