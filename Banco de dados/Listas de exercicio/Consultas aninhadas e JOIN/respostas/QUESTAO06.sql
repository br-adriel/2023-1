SELECT f.nome, f.salario, d.descricao
FROM funcionario f LEFT JOIN departamento d ON f.codDepto = d.codigo;
