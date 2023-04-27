CREATE TRIGGER add_passageiro AFTER INSERT ON cliente_voo FOR EACH ROW
UPDATE voo
SET
  num_passageiros = num_passageiros + 1;