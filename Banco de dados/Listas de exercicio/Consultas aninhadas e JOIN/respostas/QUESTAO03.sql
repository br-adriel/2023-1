SELECT f.nome, f.dtNasc
FROM funcionario f
WHERE
	TIMESTAMPDIFF(YEAR, f.dtNasc, CURDATE()) > 21
	AND
  f.codigo <> ALL (
    SELECT d.codGerente
    FROM departamento d
    WHERE d.codGerente IS NOT NULL
  )
