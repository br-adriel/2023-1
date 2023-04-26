CREATE VIEW
  maior_sal_depto AS
SELECT
  f.codigo,
  f.codDepto,
  MAX(f.salario),
  f.nome
FROM
  funcionario f
GROUP BY
  f.codDepto;

SELECT
  msd.nome,
  d.sigla
FROM
  maior_sal_depto msd
  LEFT JOIN departamento d ON msd.codDepto = d.codigo
ORDER BY
  msd.salario;