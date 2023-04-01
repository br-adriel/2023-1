SELECT f.nome, f.salario, f.codDepto
FROM funcionario f
WHERE f.codigo <> ALL (
  SELECT d.codGerente
  FROM departamento d
  WHERE d.codGerente IS NOT NULL
)
ORDER BY f.codDepto;
