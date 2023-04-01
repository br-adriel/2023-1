# Questão 05

## Letra a

Os valores nulos podem levar a interpretações equivocadas dos dados, como achar
que um departamento não tem gerente por ele admitir o valor nulo nesse campo.

## Letra b

Quando se usa o JOIN em duas tabelas, as linhas trazidas da tabela A são apenas
aquelas que tem uma relação com alguma outra linha da tabela B, e vice-versa. No
caso do LEFT JOIN e do RIGHT JOIN o comportamento é diferente, pois além de
trazer as linhas que apresentam essa relação, as linhas que não apresentam
nenhuma relação de uma das tableas também são trazidas. No caso do LEFT JOIN a
tabela à esquerda do JOIN é quem tem todas as suas linhas selecionadas, enquanto
no RIGHT JOIN apenas a tabela à direita do JOIN tem todas as suas linhas
selecionadas.

## Letra c

O FULL OUTER JOIN funciona de forma similar ao LEFT JOIN e ao RIGHT JOIN, exceto
que ao invés de trazer todas as linhas apenas de uma das tabelas, ele traz todas
as linhas de ambas as tabelas, independentemente se existe ou não uma relação
entre elas.

Para realizar o FULL OUTER JOIN MySQL ou no MariaDB, basta fazer a união de um
LEFT JOIN com um RIGHT JOIN.

```sql
(
  SELECT *
  FROM tabela1 t1
    LEFT JOIN tabela2 t2
    ON t1.PK=t2.FK
) UNION (
  SELECT *
  FROM tabela1 t1
    RIGHT JOIN tabela2 t2
    ON t1.PK=t2.FK
)
```
