CREATE VIEW salarioGerente AS
SELECT
	f.salario AS salario,
	d.codigo AS codDepto
FROM
	departamento d JOIN funcionario f ON d.codGerente=f.codigo;

CREATE VIEW projetosPorResponsavel AS
SELECT
	f.codigo AS responsavel,
	COUNT(p.codigo) AS numProjetos
FROM projeto p JOIN funcionario f ON p.codResponsavel=f.codigo
GROUP BY f.codigo;

SELECT
	f.nome,
  ppr.numProjetos,
  f.salario
FROM funcionario f
  JOIN projetosPorResponsavel ppr ON f.codigo=ppr.responsavel
  JOIN salarioGerente sg ON sg.codDepto=f.codDepto
WHERE f.salario > sg.salario;
