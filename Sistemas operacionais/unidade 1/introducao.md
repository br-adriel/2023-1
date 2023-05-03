# Introdução

## Sistema computacional

Um sistema computacional consiste em

- Um ou mais processadores
- Memória principal
- Dispositivos de entrada e saída

Qual a função de um sistema computacional?

- Atender as necessidades dos usuários
- Auxiliar os usuários em suas tarefas
- Servir de ferramenta de apoio ao trabalho dos usuários

Como um usuário pode se beneficiar de um sistema computacional?

- Por meio da utilização de programas

Implementando programas

- Programas são implementados para utilizar recursos do hardware
- Recursos do sistema são compartilhados

Sistema operacional

- É um programa colocado entre o hardware e os programas dos usuários de forma a
  garantir o correto funcionamento de um sistema computacional

### Componentes de um sistema computacional

- Hardware
- Sistema operacional
  - Controla e coordena o uso do hardware entre vários aplicativos e usuários
- Programas aplicativos
  - Define os modos como os recursos do sistema serão usados para resolver
    problemas dos usuários
- Usuários
  - Pessoas, máquinas, outros computadores

## Sistema operacional

- Programa que controla a execução de programas aplicativos
- Interface entre aplicativos e hardware
- Pode ser visto de duas formas
  - Alocador de recursos
    - Gerencia todos os recursos
    - Decide entre requisições conflitantes para uso eficiente e justo dos
      recursos
  - Programa de controle
    - Controla a execução de programas para prevenir erros e usos indevidos do
      computador
- Uma corrente afirma que o SO é o kernel
  - Programa que executa durante todo o funcionamento do computador
  - Coração do sistema
  - Todos os outros processos que ocorrem são programas de sistema ou
    aplicativos
- Outra corrente define como um conjunto de aplicativos, dentre eles, o kernel

### Funções do sistema operacional

- Máquina estendida
  - Interface entre programas e hardware
  - Permite uma interface genérica de acesso a vários dispositivos
- Gerenciador de recursos
  - Programa que controla a execução de outros programas
  - Permite que múltiplos programas sejam executados ao mesmo tempo
  - Gerencia e protege a memória, os dispositivos de entrada e saída e outros
    recursos

### Objetivos do sistema operacional

- Tornar mais conveniente a utilização do computador
  - Escolher detalhes internos de funcionamento
- Tornar mais eficiente a utilização do computador
  - Gerenciamento justo dos recursos do sistema
- Facilitar a evolução do sistema
  - Desenvolvimento, teste e atualização de novas facilidades

### Visões do sistema operacional

#### Visão do usuário

- Interface oferecida ao usuário para ter acesso a recursos do sistema
  - Chamadas de sistema
  - Programas de sistema

#### Visão de projeto

- Organização interna do sistema operacional
- Mecanismos empregados para gerenciar recursos do sistema

### Histórico dos sistemas operacionais

#### Primórdios

- Sistema operacional inexistente
- Usuário é o programador e operador da máquina
- Alocação do recurso "computador" feito por planilha

Evolução motivada por

- Melhor utilização de recursos
- Avanços tecnológicos
  - Novos tipos de hardware
- Adição de novos serviços

#### Sistema em lote (batch)

- Introdução de operadores profissionais
  - Usuário não era mais o operador da máquina
- Job (tarefa)
  - Programa a ser compilado e executado, acompanhado dos dados de execução
    (cartões perfurados)
  - Organizados em lote (batch)
  - Necessidades semelhantes
    - Mesmo compilador
- Passagem entre diferentes jobs continua sendo manual

#### Monitor residente

- Evolução
  - Sequenciamento automático de jobs, transferindo o controle de um job a outro
  - Primeiro sistema operacional (rudimentar)
- Programa que fica permanentemente em memória
- Execução inicial
- Controle é transferido para o job (cartões de controle)
- Quando o job termina, o controle retorna ao monitor
- Centraliza as rotinas de acesso a periféricos disponibilizando aos programas
  de usuário

#### Sistema batch multiprogramado (multitarefa)

- Monitor residente permite a execução de apenas um programa por vez
- Desperdício de CPU com operações de entrada e saída
- Evolução
  - Manter diversos programas na memória ao mesmo tempo
  - Enquanto um programa realiza entrada/saída, outro pode ser executado

### Multiprogramação

- Mais de um programa em execução "simultaneamente"
- Invocações de hardware possibilitaram seu surgimento
  - Interrupções (sinalização de eventos)
  - Discos magnéticos
    - Acesso randômico a diferentes jobs no disco
    - Melhor desempenho em acesoss de leitura e escrita

Sistemas de tempo compartilhado

- Tipo de multiprogramação
- Para os programas parece que apenas ele está em execução
- Cada progrmaa executa em um momento distinto

Sistemas operacionais podem ser monousuário ou multiusuário.

- Exemplos de sistema monousuário
  - MS-DOS
  - Windows 3.x
  - Windows 9x
  - Milenium
- Exemplos de sistema multiusuário
  - Windows NT (2000)
  - UNIX

Sistemas podem ser monotarefa ou multitarefa

- Monotarefa
  - Capaz de executar apenas uma tarefa por vez
    - MS-DOS
- Multitarefa
  - Capaz de executar várias tarefas "simultaneamente"
  - Pode ser não preemptivo/cooperativo ou preemptivo
    - Preemptivo
      - A troca de execução pode ser forçada pelo sistema
      - Windows NT, OS/2, UNIX, Windows 9x (aplicativos 32 bits)
    - Nãp preemptivo/cooperativo
      - A troca de execução só ocorre quando um programa libera a sua vez
      - Windows 3.x, Windows 9x (aplicativos 16 bits)

### Serviços do sistema operacional

- Interface com o usuário
- Execução de programas
  - O sistema deve estar apto a carregar um programa na memória e executá-lo,
    terminar a execução, seja normalmente ou de forma anormal
- Operações de entrada e saída
  - Um programa em execução pode requisitar E/S, o que poderá envolver um
    arquivo ou um dispositivo de E/S
- Manipulação de sistemas de arquivos
- Criação de programas
  - Editores, depuradores, compiladores
- Execução de programas
  - Carga de programas em memória
- Acesso a dispositivos de E/S
- Controle de acesso a arquivos
- Acesso a recursos de sistema
  - Proteção entre usuários
- Estatísticas
  - Quantos usuários estão executando, quantos arquivos tem, tamanho dos
    arquivos
- Detecção de erros
  - Hardware
    - Erros de memória
    - Falha em dispositivos de entrada e saída
  - Software
    - Overflow
    - Acesso não autorizado a posições de memória

### Execução de um sistema operacional

Quando a máquina é ligada o sistema operacional é carregado para a memória pela
BIOS, e sua execução é iniciada.

- CPU e controladores de dispositivos se comunicam através de um barramento
  comum, tendo acesso a memória compartilhada
- Dispositivos de E/S e CPU podem executar concorrentemente
- Cada controlador se encarrega de um tipo de dispositivo
- Cada controlador de dispositivo possui um buffer local
- CPU move os dados entre a memória principal e os buffers locais
- E/S move do dispositivo para o buffer local do controlador
- Controladores informam à CPU que suas operações terminaram por meio de
  interrupções
- Alguns dispositivos possuem acesso direto à memória (DMA)

O sistema operacional opera em dois modos: modo de usuário e modo de kernel.

No modo de usuário as execuções possuem menor prioridade e é usado para ações
que não necessitam de privilégio, como ler a hora do relógio, por exemplo.

Já o modo kernel executa códigos de sistema que permitem operações priveligiadas
como acesso a dados no disco, gerenciar a memória, e liberar espaço de memória
não utilizado.

Quando um processo de usuário precisa realizar alguma ação que requer
privilégios ele realiza uma chamada de sistema que faz com que a CPU pare aquele
processo, mude para o modo kernel e realize a operação, em seguida ela volta ao
modo usuário e retoma o processo.

#### Chamadas de sistema

- Forma com que os programas solicitam serviços ao sistema operacional
- Interface de programação aos serviços fornecidos pelo SO
- Tipicamente escritos em uma linguagem de alto nı́vel (C or C++)
- Parecido com funções
  - Transferem o controle para o sistema operacional ao invés de transferir para
    outro ponto do programa.
- É o núcleo do sistema operacional que implementa as chamadas de sistema
  - As chamadas mudam o modo de operação para modo kernel, executam suas
    instruções, e retornam para o modo usuário com o retorno da chamada
- APIs mais comuns
  - Win32 API para Windows
  - POSIX API para sistemas baseados em POSIX
    - Inclui virtualmente todas as versões de UNIX, Linux, e Mac OS X
- Tipicamente um número é associado a cada chamada de sistema
  - A interface das chamadas de sistema mantém uma tabela indexada de
    acordo com esses números
- A interface das chamadas de sistema evoca a chamada pretendida no kernel e
  retorna o status e quaisquer valores de retorno
- O chamador não precisa saber nada da implementação da chamada de sistema

#### Passagem de parâmetros nas chamadas de sistema

- Passar parâmetros em registradores
- Parâmetros armazenados em um bloco na memória, e o endereço do bloco é passado
  como parâmetro em um registrador
  - Usado no Linux e Solaris
- Parâmetros colocados na pilha pelo programa e removidos pelo sistema
  operacional

#### Tipos de chamada de sistema

- Controle de processos
- Gerencia de memória
- Gerenciamento de arquivos
- Gerenciamento de dispositivos de entrada e saída
- Manutenção de informações
- Comunicações
- Proteção

### Temporizadores

O sistema operacional usa temporizadores para manter o controle da CPU

- Interrupções de relógio
  - Interrompem a operação do computador, dando o processamento ao SO
  - Utiliza mecanismo de watchdog
    - Um temporizador é decrementado a cada intervalo de tempo, quando chear a 0
      uma interrupção é gerada
  - Útil para impedir que um programa de usuário fique em loop
  - Permite que o SO possa gerenciar os programas em execução
