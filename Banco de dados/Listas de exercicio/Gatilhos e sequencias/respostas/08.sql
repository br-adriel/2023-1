CREATE TRIGGER queda_aviao_clientes BEFORE DELETE ON voo FOR EACH ROW BEGIN
DELETE FROM cliente
JOIN cliente_voo ON cliente.codigo = cliente_voo.cliente
WHERE
  cliente_voo.voo = OLD.codigo;

CREATE TRIGGER queda_aviao_piloto BEFORE DELETE ON voo FOR EACH ROW
DELETE FROM piloto
WHERE
  codigo = OLD.piloto;