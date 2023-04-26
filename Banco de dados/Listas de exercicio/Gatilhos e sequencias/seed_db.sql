USE db_lista_sequence;

INSERT INTO
  cliente (nome, endereco)
VALUES
  ('João da Silva', 'Rua 1, número 123'),
  ('Maria Souza', 'Avenida 2, número 456'),
  ('Pedro Santos', 'Rua 3, número 789'),
  ('Carlos Oliveira', 'Avenida 5, número 321'),
  ('Ana Maria', 'Rua 6, número 654'),
  ('Rafaela Santos', 'Rua 7, número 987');

INSERT INTO
  piloto (nome, num_voos)
VALUES
  ('João Silva', 10),
  ('Maria Santos', 5),
  ('Pedro Oliveira', 2),
  ('Ana Costa', 0);

INSERT INTO
  voo (tipo, piloto, num_passageiros, distancia)
VALUES
  ('Doméstico', 1, 100, 500),
  ('Internacional', 2, 200, 1500),
  ('Doméstico', 3, 50, 300),
  ('Internacional', 4, 150, 2000);

INSERT INTO
  milhas (cliente, quantidade)
VALUES
  (1, 1000),
  (2, 500),
  (3, 2000),
  (4, 300),
  (5, 100),
  (6, 1500);

INSERT INTO
  cliente_voo (cliente, voo, classe)
VALUES
  (1, 1, 'Econômica'),
  (2, 1, 'Executiva'),
  (3, 2, 'Econômica'),
  (4, 2, 'Econômica'),
  (5, 3, 'Econômica'),
  (6, 3, 'Executiva');