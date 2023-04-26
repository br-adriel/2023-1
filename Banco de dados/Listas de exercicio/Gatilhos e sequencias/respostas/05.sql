CREATE TRIGGER voo_piloto_add AFTER INSERT ON voo FOR EACH ROW
UPDATE piloto p
SET
  num_voos = num_voos + 1
WHERE
  p.codigo = NEW.piloto;