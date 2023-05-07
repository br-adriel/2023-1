-- Cria o usuário
CREATE USER adriel
WITH
  PASSWORD 'adriel123';

-- Cria a tabela que será dada o acesso
CREATE TABLE
  funcionario (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL
  );

-- Dá acesso ao usuario
GRANT INSERT,
UPDATE,
DELETE ON TABLE funcionario TO adriel;