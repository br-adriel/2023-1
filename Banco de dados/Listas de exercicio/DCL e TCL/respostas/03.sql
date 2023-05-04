CREATE DATABASE db_atividade;

CREATE TABLE funcionario (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    idade INT NOT NULL
);
