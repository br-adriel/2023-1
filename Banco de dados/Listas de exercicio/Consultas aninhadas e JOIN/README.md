# Lista de exercícios sobre Consultas aninhadas e JOIN

[Documento original disponibilizado no SIGAA](https://docs.google.com/document/d/1S8QITJFW59ss9CIAiw8UznCbxKVvDAlu4ir75fNoBF0/edit)

[Script parcial do banco de dados usado na tarefa](https://github.com/tacianosilva/bsi-tasks/tree/master/bd/scripts/AtividadesBD)

## Esquema

| funcionário |    |                       |
| ----------- | -- | --------------------- |
| codigo      | PK |                       |
| nome        |    |                       |
| sexo        |    |                       |
| dtNasc      |    |                       |
| salario     |    |                       |
| codDepto    | FK | departamento (codigo) |

| departamaneto |    |                  |
| ------------- | -- | ---------------- |
| codigo        | PK |                  |
| descricao     |    |                  |
| codGerente    | FK | gerente (codigo) |

| projeto        |    |                       |
| -------------- | -- | --------------------- |
| codigo         | PK |                       |
| nome           |    |                       |
| descricao      |    |                       |
| dataInicio     |    |                       |
| dataFim        |    |                       |
| codDepto       | FK | departamento (codigo) |
| codResponsavel | FK | responsavel (codigo)  |

| atividade      |    |                      |
| -------------- | -- | -------------------- |
| codigo         | PK |                      |
| nome           |    |                      |
| descricao      |    |                      |
| dataInicio     |    |                      |
| dataFim        |    |                      |
| codResponsavel | FK | responsavel (codigo) |

| atividadeProjeto |        |                    |
| ---------------- | ------ | ------------------ |
| codProjeto       | PK, FK | projeto (codigo)   |
| codAtividade     | PK, FK | atividade (codigo) |

## Questões

1. Faça uma consulta que selecione o nome dos funcionários que recebem salários
superiores aos salários pagos no departamento 2.

2. Faça uma consulta que selecione o nome de todos os funcionários, exceto o
mais idoso.

3. Faça uma consulta que selecione o nome e a data de nascimento dos
funcionários com idade superior a 21 anos que não são gerentes.

4. Faça uma consulta que selecione o nome, o salário e o departamento dos
funcionários que não são gerentes, ordenando pelo Código do Departamento.

5. Responda as perguntas:

    a. Explique os problemas de termos valores nulos nos dados.

    b. Explique o funcionamento do Right e do Left Join.

    c. Explique o funcionamento do Full Outer Join e como pode ser feito no
    MySQL ou MariaDB que não tem mais o comando Full.

6. Faça uma consulta que selecione o nome, o salário dos funcionários e a
descrição do departamento, mesmo que eles não tenham departamentos associados.

7. Faça uma consulta que selecione o nome do departamento, o nome do gerente, e
o número de funcionários de cada departamento. Deve aparecer os departamentos
sem gerente e sem funcionários. Crie uma view para totalizar o número de
funcionários em cada departamento e utilize-a na consulta.

8. Faça uma consulta que selecione o nome do departamento, o nome do gerente,
e o número de projetos de cada departamento. Deve aparecer os departamentos sem
gerente e sem projetos. Crie e use views na consulta, se necessário.

9. Faça uma consulta que selecione o nome dos funcionários responsáveis por
projetos, o número de projetos que este funcionário é responsável e seus
salários, mas apenas os funcionários que ganhem mais que o gerente do seu
departamento. Crie e use views na consulta.

10. Faça uma consulta que selecione o nome do projeto, o nome do departamento do
projeto, o nome do funcionário responsável pelo projeto, o nome do departamento
do funcionário responsável.

11. Faça uma consulta que selecione o nome do projeto, o nome do departamento do
projeto, o nome do funcionário responsável pelo projeto, o nome do departamento
do funcionário responsável, mas apenas os projetos que o responsável é de outro departamento.

12. Faça uma consulta que selecione o nome do projeto, data de início e fim do
projeto, a descrição da atividade do projeto, data de início e fim da atividade.

13. Faça uma consulta que selecione o nome do projeto, data de início e fim do
projeto, o nome da atividade do projeto, data de início e fim da atividade. Só
devem ser exibidas as atividades que começarem antes da data de início do
projeto ou que terminarem depois do final do projeto.

14. Faça uma consulta que selecione o nome dos funcionários responsáveis por
atividades, o número de atividades que este funcionário é responsável. Crie e
use views na consulta.

15. Faça uma consulta que selecione o nome dos projetos e o nome dos
funcionários responsáveis por esses projetos, a quantidade de atividades do
projeto e a quantidade de responsáveis pelas atividades (os responsáveis por
atividades só devem ser contados uma única vez no projeto). Crie e use views na
consulta.

16. Faça uma consulta que selecione o nome dos responsáveis de projeto que
também são gerentes de departamento ou que ganham mais que o gerente de seu
departamento. Use views se necessário.

17. Faça uma consulta que selecione o código  e descrição do projeto cujo
gerente do departamento que ele faz parte ganhe mais que os outros gerentes de
departamento.

18. Faça uma consulta que selecione o nome dos funcionários com maior salário de
seu departamento, mesmo que não tenha departamento associado, e o nome dos
respectivos departamentos. Exiba em ordem crescente de acordo com o salário.

19. Faça uma consulta que selecione o código  e descrição do projeto cujo
gerente do departamento que ele faz parte ganhe mais que a média dos outros
gerentes de departamento.
