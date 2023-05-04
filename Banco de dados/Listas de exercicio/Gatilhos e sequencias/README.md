# Lista de exercícios sobre gatilhos e sequências

Considere o banco de dados abaixo para responder às questões 4 a 9:

| Esquema para às questões 4 a 9                               |
| ------------------------------------------------------------ |
| cliente (**codigo**, nome, endereco)                         |
| piloto (**codigo**, nome, num_voos)                          |
| voo (**codigo**, tipo, _piloto_, num_passageiros, distancia) |
| milhas (_**cliente**_, quantidade)                           |
| cliente_voo (_**cliente**_, _**voo**_, classe)               |

obs: **primary key**, _foreign key_.

## Questões

1. Escreva os seguintes comandos relacionados com Sequences no MariaDB 10.3.

   ```sql
   CREATE SEQUENCE s START WITH 100 INCREMENT BY 10;
   CREATE SEQUENCE s2 START WITH -100 INCREMENT BY -10;
   CREATE SEQUENCE s3 START WITH -100 INCREMENT BY 10 MINVALUE=-100 MAXVALUE=1000;
   ```

   Execute:

   ```sql
   SELECT NEXTVAL(s);
   SELECT NEXTVAL(s);
   SELECT NEXTVAL(s);
   ```

   Teste também para s2 e s3;

2. Crie e teste o seguinte esquema relacional:

   ```sql
   create sequence s1;
   create table t1 (
     a int default (next value for s1),
     b int,
     primary key (a)
   );
   insert into t1 (b) values (5), (7);
   insert into t1 (b) values (8);
   select * from t1;
   ```

3. Estude os comandos:

   ```sql
   CREATE SEQUENCE; ALTER SEQUENCE; DROP SEQUENCE;
   NEXT VALUE FOR;
   PREVIOUS VALUE FOR;
   SETVAL();
   AUTO INCREMENT;
   ```

4. Crie um gatilho que ao se adicionar um novo cliente, seja criado para ele um
   cartão de milhagem com 0 milhas.

5. Crie um gatilho que ao se adicionar um voo, seja adicionado +1 voo para o
   piloto daquele voo.

6. Crie um gatilho que some milhas ao cartão de milhagem sempre que um cliente é
   adicionado a um voo. (considere que é adicionado 1 milha no cartão para cada
   10 milhas de distância percorrida em um voo).

   ```sql
   create trigger add_milhas after insert cliente_voo as
    UPDATE milhas SET quantidade = quantidade +
    (SELECT distancia FROM voo, cliente_voo
      WHERE new.voo = voo.codigo
    ) / 10
    WHERE cliente = new.cliente;
   ```

7. Crie um gatilho que adicione mais um passageiro a um voo sempre que um
   cliente entre em um voo. (Dica: lembre da relação cliente_voo).

   ```sql
   create trigger add_milhas after insert cliente_voo as
   UPDATE voo SET num_passageiros = num_passageiros + 1;
   ```

8. Crie um gatilho que delete todos os clientes de um voo sempre que aquele voo
   for deletado e mais um gatilho para deletar o piloto. (Para efeito de
   informação, considere que o avião caiu).

9. Cadastre um cartão de milhagem para um cliente qualquer e logo após crie um
   gatilho que cadastre um cartão de milhagem para aquele cliente quando suas
   informações forem atualizadas. Veja e explique o que acontece quando esse
   procedimento for realizado. Utilize PostgreSQL para as questões 10 a 14
   (testem no MariaDB 10.3).

10. Crie uma sequência que inicia em 1 e pode ir até 1000.

11. Verifique qual o próximo valor da sequência criada na questão 10.

12. Crie uma tabela chamada cliente que contenha um código. O código do cliente
    deve ser igual ao próximo valor da sequência criada na questão 10.

13. Crie e exiba o próximo valor de uma sequência chamada 100_em_diante que
    inicie no valor 100 e não tenha limite máximo definido.

14. Altere a sequência criada na questão 10 adicionando valor máximo 200
