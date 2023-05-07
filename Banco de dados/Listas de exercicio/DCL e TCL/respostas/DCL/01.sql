-- Criação do banco de dados
CREATE DATABASE atividade_dcl;

-- Criação do usuário
CREATE USER administrador
WITH
  PASSWORD 'senha1234';

-- Concessão de privilégios
GRANT ALL PRIVILEGES ON DATABASE atividade_dcl TO administrador;