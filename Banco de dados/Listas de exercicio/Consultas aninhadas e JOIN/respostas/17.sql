CREATE VIEW
  sal_gerente2 AS
SELECT
  d.codigo AS cod_depto,
  d.codGerente,
  f.salario
FROM
  departamento d
  JOIN funcionario f ON d.codigo = f.codigo
ORDER BY
  f.salario DESC;

SELECT
  p.codigo,
  p.descricao
FROM
  projeto p
  JOIN departamento d ON p.codDepto = d.codigo
WHERE
  d.codigo = (
    SELECT
      sg.cod_depto
    FROM
      sal_gerente sg
    LIMIT
      1
  )