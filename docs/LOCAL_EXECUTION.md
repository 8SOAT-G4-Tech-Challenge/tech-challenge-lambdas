## Como provisionar os recursos na AWS localmente

### Pré-requisitos

- Instalação e configuração do [CLI AWS](https://docs.aws.amazon.com/pt_br/cli/latest/userguide/getting-started-install.html)
- Acesso ao [AWS Academy](https://awsacademy.instructure.com/)

### Passo a passo

1.  Clone o repositório:

```sh
  git clone https://github.com/8SOAT-G4-Tech-Challenge/tech-challenge-lambdas.git
  cd tech-challenge-lambdas
```

2. Instale e configure a CLI da AWS, pois ela será utilizada para realizar a execução dos comandos para acessar os recursos da AWS depois de conectada.

\*Obs: Vá para o passo 12 caso já esteja com o ambiente da aws ativo.

3. Acesse o portal da [AWS Academy](https://docs.aws.amazon.com/pt_br/cli/latest/userguide/getting-started-install.html)

4. Ao acessar o menu Painel de Controle, deve aparecer um ou mais cursos habilitados para que você possa fazer e utilizar o laboratório. Selecione um dos cursos disponíveis

5. No menu lateral esquerda aparece 3 opções e uma delas é respectiva aos _Módulos_. Clique nela;

6. Aparecerão todos os módulos respectivos ao curso. Navegue até o módulo _Laboratório de aprendizagem da AWS Academy_ e selecione a opção _Iniciar os laboratórios de aprendizagem da AWS Academy_

7. A tela com as informações respectivas a AWS estarão disponíveis, você poderá consultar e realizar açõe de iniciar laboratório e finalizar laboratório. Nesse passo clique na opção de iniciar laboratório

8. Espere até iniciar o laboratório(O ícone na tela fica verde)

9. Depois de iniciado, acesse o menu AWS details e em seguida clique em show _AWS CLI_

10. Aparecerão as informações necessárias para a configuração da AWS CLI. Em sessões normais é utilizado o comando `aws configure` via linha de comando local, porém nesse caso como trata-se de um laboratório, precisamos fornecer a informção de token de sessão, pois o laboratório renova esse token a cada 4 horas. Fique ligado para realizar esses mesmos passos quando acontecer uma atualização.

11. Copie todo conteúdo destacado contendo as credencias de configuração e cole no arquivo ~/.aws/credentials. Caso já exista uma configuração [default], substitua. Pronto, seu AWS CLI esta configurado para executar comandos dentro da AWS presente no laboratório.

12. Execute os comandos abaixo no terminal da sua maquina ou IDE:

```sh
  export AWS_ACCOUNT_ID=ACCOUNT_ID_DA_SUA_CONTA_DA_AWS
  export DB_USER=postgres
  export DB_AWS_HOST=ENDPOINT_DO_RDS_GERADO_PELO_TERRAFORM_DO_REPOSITÓRIO_DATABASE
  export DB_DATABASE=tech-challenge-database
  export DB_PASSWORD=Senha\!123456
  export DB_PORT=5432
```

13. Execute agora o comando abaixo, fazendo as devidas confirmações também

```sh
  ./scripts/build.sh
  ./scripts/deploy.sh
```

\*Obs: Caso receba erro de permissão, execute o seguinte comando na raiz do projeto e depois execute o comando acima novamente:

```sh
  chmod -R 777 scripts
```

14. Pronto, a lambda deve ser comprimida e posteriormente deve ser realizado o deploy com base nas informações passadas nas variáveis exportadas no passo 12.
