# ProjetoLemobs - Desenvolvedor Web

Protótipos de painéis de dashboard em conexão com banco de dados local PostgreSQL.

Pré-requisitos:

- PostgreSQL - versão 13
- pgAdmin 4 (opcional)
- PSQL ODBC - versão > 12
- Tableau Desktop/Tableau Online

Caso queira ver o dashboard que eu montei direto no navegador, clone o projeto, instale as dependências e dê o comando: <pre>ng serve --open</pre> 

A pasta de trabalho está hospedada na minha conta do Tableau Online, mas para visualizar o dashboard você <b>PRECISA</b> ter uma conta criada no Tableau Online (é grátis). O projeto foi criado pensando em um armazenamento de jogos, suas plataformas e seus gêneros. O dashboard possui 5 paineis com diferentes tipos de gráficos e visualizações, como por exemplo, a quantidade de jogos por plataforma, ou uma análise de todas as desenvolvedoras e seus jogos produzidos.

## PROCESSO DE CRIAÇÃO DO PROJETO

Antes de tudo, crie o banco de dados e popule ele.
Primeiro, entre na interface psql utilizando o comando abaixo no CMD:

<pre> psql -U postgres (ou outro usuário que você utilize) </pre>
  
Após isso, use o seguinte comando para criar o banco de dados: 

<pre>
CREATE DATABASE projetolemobs
WITH 
  OWNER = postgres
  ENCODING = 'UTF8'
  LC_COLLATE = 'Portuguese_Brazil.1252'
  LC_CTYPE = 'Portuguese_Brazil.1252'
  TABLESPACE = pg_default
  CONNECTION LIMIT = -1;
</pre>

Agora conecte no banco de dados utilizando o comando: <pre>\c projetolemobs</pre>

Agora, conectado no banco de dados, você pode executar o script .sql <b>Comandos_BD_ProjetoLemobs.sql</b>, que se encontra no diretório <b>script_postgres</b>, usando o comando: <pre>\i Comandos_BD_ProjetoLemobs.sql</pre>

Ou você pode abrir o arquivo, copiar os comandos e executa-los um por um no terminal, caso o comando acima não funcione.

Após isso, o BD estará criado e com as tableas criadas e preenchidas. Após isso, abra o Tableau Desktop e importe a pasta de trabalho <b>desafiolemobs.twbx</b> que se encontra no diretório <b>graficos_tableau</b>. Será pedido para fazer login no BD. Caso isso não ocorra, configure a fonte de dados para o BD criado anteriormente, clicando em <b>Dados</b> > <b>Nova fonte de dados</b> > <b>PostgreSQL</b> e inserindo os dados do BD <b>projetolemobs</b>. Após configurar, clique em <b>Atualizar fonte de dados</b> no mesmo menu de antes.

A pasta de trabalho terá 5 planilhas (gráficos). Para exibirmos na nossa aplicação Angular, precisamos primeiro publicar essa pasta de trabalho no Tableau Online. Clique em qualquer planilha, e após isso clique em <b>Servidor</b> na aba superior. Clique em <b>Publicar pasta de trabalho...</b> e insira seu login e senha do Tableau Online. Após isso será pedido informações para a publicação. Insira um nome para o projeto, nome da pasta de trabalho (desafiolemobs), descrição etc. Marque as opções <b>Mostrar planilhas como guias</b> e <b>Mostrar seleções</b>. Após isso, clique em <b>Publicar</b>

Será aberta uma janela do navegador com o projeto criado no Tableau Online junto com a pasta de trabalho que acabou de ser publicada. Caso não seja aberta a janela do navegador, entre em https://sso.online.tableau.com/public/idp/SSO, clique em <b>Explorar</b> na aba esquerda e entre no projeto criado.

Após entrar no projeto, entre na pasta de trabalho <b>desafiolemobs</b>. Você verá as 5 planilhas (exibições) existentes. Clique na primeira, e ela será aberta numa visualização maior na tela. Na parte superior da tela, há algumas opções, como <b>Baixar</b>, <b>Inscrever-se</b>, <b>Métricas</b>, etc. 

Clique em <b>Compartilhar</b> e depis em <b>Copiar link</b>. Esse link será algo como: https://prod-useast-b.online.tableau.com/t/projetolemobs/views/desafiolemobs_16038968081420/Jogosporconsole?:showAppBanner=false&:display_count=n&:showVizHome=n&:origin=viz_share_link

Agora no nosso projeto em Angular, este link será colado no arquivo <b>src/app/app.component.ts</b>, como valor da variável <b>vizUrl</b>. Após isso, salve o projeto e execute-o com o comando: <pre>ng serve --open</pre>

No navegador, em http://localhost:4200/, será exibido o dashboard, com as 5 telas em abas distintas.

<br>
<br>

**Autor: Leonardo de Figueiredo Meliande**

   <IMG SRC="https://pa1.narvii.com/6445/2effbe46653f3c5604386e6802c9e7ea8de0f46a_hq.gif">  

Data da ultima atualização: 29/10/2020 :-)
