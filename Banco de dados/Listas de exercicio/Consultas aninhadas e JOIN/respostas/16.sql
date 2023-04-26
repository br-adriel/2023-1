CREATE VIEW
  sal_gerente AS
SELECT
  d.codigo AS cod_depto,
  d.codGerente,
  f.salario
FROM
  departamento d
  JOIN funcionario f ON d.codigo = f.codigo;

CREATE VIEW
  ganha_mais_gerente AS
SELECT
  f.codigo
FROM
  funcionario f
  JOIN sal_gerente sg ON sg.cod_depto = f.codDepto
WHERE
  f.salario > sg.salario;

SELECT
  f.nome
FROM
  projeto p
  JOIN funcionario f ON p.codResponsavel = f.codigo
WHERE
  p.codResponsavel IN (
    SELECT
      d.codigo
    FROM
      departamento d
  )
  OR p.codResponsavel IN (
    SELECT
      codigo
    FROM
      ganha_mais_gerente
  );