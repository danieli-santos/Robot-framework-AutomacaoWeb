*** Settings ***
Documentation        Essa suite testa o site da Amazon.com.br
Resource             amazon_resources.robot
Test Setup           Abrir o navegador
Test Teardown       Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletronicos"
    [Documentation]      Esse teste verifica o menu eletronicos do site da Amazon.com.br
    ...                  e verifica a categoria computadores e informatica
    [Tags]               menus         categorias
    Acessar a home do site Amazon.com.br
    Entrar no menu "Eletronicos"
    Verificar se aparece a frase "Eletronicos e tecnologia"
    Verificar se titulo da pagina fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"
    Verificar se aparece categoria "Tablets"

Caso de teste 01 - Pesquisa de um produto
    [Documentation]        Esse teste verifica a busca de um produto
    [Tags]                busca_produtos        lista_busca
    Acessar a home do site Amazon.com.br
    Digittar o nome do produtos "Xbox Series S" no campo de Pesquisa
    Clicar no botão de Pesquisa 
    Verificar o resultado da pesquisa se esta listando o produto "Console Xbox Series S"

