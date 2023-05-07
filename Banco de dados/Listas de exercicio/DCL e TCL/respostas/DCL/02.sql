CREATE USER usu;

GRANT ALL PRIVILEGES ON DATABASE atividade_dcl TO usu;

ALTER USER usu
RENAME TO administrador2;

ALTER USER administrador2
WITH
  PASSWORD 'senha1234';

REVOKE ALL PRIVILEGES ON DATABASE atividade_dcl
FROM
  administrador2;

DROP USER administrador2;