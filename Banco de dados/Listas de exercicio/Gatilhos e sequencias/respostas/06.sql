CREATE TRIGGER add_milhas AFTER INSERT ON cliente_voo FOR EACH ROW
UPDATE milhas
SET
  quantidade = quantidade + (
    SELECT
      distancia
    FROM
      voo
    WHERE
      new.voo = voo.codigo
  ) / 10
WHERE
  cliente = new.cliente;