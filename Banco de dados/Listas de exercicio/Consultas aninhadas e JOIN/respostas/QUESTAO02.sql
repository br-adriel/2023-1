SELECT f.nome
FROM funcionario f
WHERE f.dtNasc <> (
  SELECT f.dtNasc
  FROM funcionario f
  ORDER BY f.dtNasc ASC
  LIMIT 1
);
