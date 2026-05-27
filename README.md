# ReciclaAqui - ETL com SSIS e Power BI

Projeto de ETL utilizando SQL Server, SSIS e Power BI para extração, transformação e visualização de dados a partir de uma planilha Excel.

## Contexto do Projeto

A sustentabilidade e a reciclagem têm se tornado temas cada vez mais importantes dentro das organizações, principalmente em empresas de grande porte que possuem alto volume de consumo e descarte de materiais.

Diante desse cenário, a Unimed identificou dificuldades relacionadas ao acompanhamento de indicadores de reciclagem, controle de resíduos e análise dos dados ambientais gerados internamente. Com isso, a empresa disponibilizou uma base de dados para que nosso grupo Recicla Aqui desenvolvesse um projeto de Business Intelligence (B.I.), com o objetivo de transformar os dados em informações estratégicas e de fácil visualização.

O projeto foi desenvolvido utilizando processos de ETL no SSIS, armazenamento em SQL Server e visualização de dados no Power BI, permitindo:

- Extração dos dados da planilha Excel;
- Transformação e tratamento das informações;
- Armazenamento estruturado no banco de dados;
- Criação de dashboards interativos para análise dos indicadores de sustentabilidade e reciclagem.

Através deste projeto, foi possível demonstrar como ferramentas de B.I. podem auxiliar na tomada de decisão e no acompanhamento de métricas ambientais de forma mais eficiente.

---

## Pré-requisitos

Antes de iniciar, certifique-se de possuir os seguintes programas instalados:

- SQL Server
- SQL Server Management Studio (SSMS)
- Visual Studio com a extensão SSIS instalada
- Power BI Desktop


## Passo a passo para execução

### 1. Clonar ou baixar o projeto

Clone este repositório ou faça o download do arquivo `.zip`.



### 2. Criar o banco de dados

1. Abra o **SQL Server Management Studio (SSMS)**.
2. Realize a conexão com o seu SQL Server.
3. Vá em:

```text
Arquivo -> Abrir -> Arquivo
```

4. Selecione o arquivo no diretório:

```text
SQL/SQLQuery.sql
```

5. Execute a consulta para criação do banco de dados e tabelas necessárias para o projeto.

### 3. Abrir o projeto SSIS

1. Abra o arquivo da solução localizado em:

```text
ETL/ETL ReciclaAqui.sln
```

### 4. Configurar a conexão Excel

1. No Visual Studio, vá até a seção **Gerenciadores de Conexões**.
2. Configure a conexão Excel.
3. Em **Caminho do arquivo do Excel**, clique em **Procurar**.
4. Selecione o arquivo:

```text
Base de Dados/Base de Dados.xlsx
```

5. Clique em **OK**.


### 5. Configurar a conexão com o SQL Server

1. Ainda em **Gerenciadores de Conexões**, configure a conexão com o banco de dados.
2. Em:

```text
Enter a server or file name
```

3. Insira o nome do seu servidor SQL Server.
4. Clique em **OK**.

### 6. Executar o pacote ETL

1. Execute o pacote clicando no botão **Iniciar**.

2. Aguarde a conclusão da execução do processo ETL.

### 7. Abrir o Power BI

1. Abra o arquivo:

```text
ReciclaAqui.pbix
```

localizado no diretório raiz do projeto.


### 8. Configurar a fonte de dados no Power BI

1. No Power BI, vá em:

```text
Configurações da Fonte de Dados
```

2. Altere a fonte para o seu servidor SQL Server local.
3. Clique em **OK**.

### 9. Atualizar o painel

Após concluir todas as configurações:

1. Atualize o painel no Power BI.
2. Verifique que:
   - Os dados foram extraídos da planilha Excel;
   - As transformações foram realizadas pelo SSIS;
   - Os dados foram carregados e visualizados corretamente no Power BI.

---

## Resultado esperado

O projeto demonstra um fluxo completo de ETL:

- Extração de dados do Excel;
- Transformação utilizando SSIS;
- Armazenamento no SQL Server;
- Visualização final no Power BI.

---

## Obrigado pela atenção!