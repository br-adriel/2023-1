CREATE TRIGGER milhagem_cliente_add AFTER INSERT ON cliente FOR EACH ROW
INSERT INTO
  milhas (cliente, quantidade)
VALUES
  (NEW.codigo, 0);