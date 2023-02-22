*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}                             chrome
${url}                                 https://www.amazon.com.br/
${MENU_ELETRONICOS}                    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${TEXTO_HEADER_ELETRONICOS}            Eletrônicos e Tecnologia
${HEADER_ELETRONICOS}                  //h1[contains(.,'Eletrônicos e Tecnologia')]
*** Keywords ***
Abrir o navegador
    Open Browser        browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home do site Amazon.com.br
    Go To    url=${URL}   
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletronicos"
    Click Element    locator=${MENU_ELETRONICOS}
Verificar se aparece a frase "Eletronicos e tecnologia"
    Wait Until Page Contains    text=${TEXTO_HEADER_ELETRONICOS}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se titulo da pagina fica "${TITULO}" 
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Scroll Element Into View    locator=(//a[@aria-label='${NOME_CATEGORIA}'])[2]
   # Wait Until Element Is Visible    locator= (//a[@aria-label='Computadores e Informática'])[2]
    Element Should Be Visible            locator=(//a[@aria-label='${NOME_CATEGORIA}'])[2]
Verificar se aparece categoria "${NOME_CATEGORIA}"
    Element Should Be Visible        locator=//a[contains(@aria-label,'${NOME_CATEGORIA}')]

Digittar o nome do produtos "${PRODUTO}" no campo de Pesquisa
    Input Text    id=twotabsearchtextbox    ${PRODUTO}

Clicar no botão de Pesquisa 
    Click Button    id=nav-search-submit-button

Verificar o resultado da pesquisa se esta listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[2]
