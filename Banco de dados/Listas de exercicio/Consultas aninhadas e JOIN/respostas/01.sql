SELECT f.nome
FROM funcionario f
WHERE f.salario > ANY (
  SELECT f.salario
  FROM funcionario f
  WHERE f.codDepto = 2
);
