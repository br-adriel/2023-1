SELECT
	p.nome AS nomeProjeto,
  pd.sigla AS deptoProjeto,
  f.nome AS responsavel,
  fd.sigla AS deptoResponsavel
FROM projeto p
	JOIN departamento pd ON p.codDepto = pd.codigo
  JOIN funcionario f ON p.codResponsavel = f.codigo
  JOIN departamento fd ON f.codDepto = fd.codigo;
