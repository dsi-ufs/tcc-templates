%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Template LaTeX de Proposta de Monografia do Departamento de Sistemas de          %
%% Informação (DSI) da Universidade Federal de Sergipe (UFS)                        %
%% Elaborado por Breno Santana Santos (http://brenosantos.bssystems.com.br).        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dsi-tcc1}[01/04/2025 v1.0 Modelo DSI (TCC 1)]

% Repassa todos os parâmetros à classe article.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[12pt,a4paper,oneside,fleqn]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PACOTES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definição do encoding do texto. Isto é, habilita o uso de caracteres acentuados e especiais.
\usepackage[utf8]{inputenc}
% Definição do idioma de escrita do texto, bem como as regras de hifenização.
\usepackage[brazil]{babel}
% Estilo de citação da ABNT.
\usepackage[alf]{abntex2cite}
% Espaçamento entre linhas.
\usepackage{setspace}
% Fonte Times New Roman.
\usepackage{mathptmx}
% Indentação do primeiro parágrafo de cada seção.
\usepackage{indentfirst}
% Inclusão de gráficos e manipulação de imagens.
\usepackage{graphicx}
% Melhoria de justificação do texto.
\usepackage{microtype}
\usepackage{ragged2e}
% Uso de urls.
\usepackage{url}
% Listagem de código-fonte e pseudo-código.
\usepackage{listings}
\usepackage[portuguese,boxed,lined,linesnumbered,commentsnumbered]{algorithm2e}
% Definição das margens.
\usepackage{geometry}
% Uso de símbolos matemáticos.
\usepackage{amssymb}
% Apresentação e formatação de fórmulas/equações matemáticas.
\usepackage{amsmath}
% Formatação especial de textos para apresentar comandos e códigos.
\usepackage{verbatim}
% Personalização de enumerações e marcadores.
\usepackage{enumitem}
% Mesclagem de linhas de tabelas.
\usepackage{multirow}
% Customização de elementos gráficos (tabela, figura, etc) e/ou flutuantes.
\usepackage[font=small,labelsep=endash]{caption}
% Criação de diagramas Gantt para cronogramas.
\usepackage{pgfgantt}
% Uso de condicionais no LaTeX.
\usepackage{ifthen}
% Para personalizar legendas de elementos flutuantes.
\usepackage[skip=0pt]{caption}
% Para criar ambientes flutuantes.
\usepackage{float}

% Definição das margens conforme regras da ABNT.
\geometry{a4paper, left=3cm, right=2cm, bottom=2cm, top=3cm}
% Definição de Espaçamento de 1,5cm (conforme regras da ABNT).
\onehalfspacing
% Definição de Recuo de 1,25cm da primeira linha do parágrafo (conforme regras da ABNT).
\setlength{\parindent}{1.25cm}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%% DEFINIÇÃO DE COMANDOS %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\universidade}[1]{\def\universidade{\noindent\textbf{#1}\\}}
\newcommand{\centroCampus}[1]{\def\centroCampus{\noindent\textbf{#1}\\}}
\newcommand{\departamento}[1]{\def\departamento{\noindent\textbf{#1}\\}}
\newcommand{\titulo}[1]{\def\titulo{#1}}
\newcommand{\orientador}[1]{\def\orientador{\noindent\textbf{Orientador:} \textit{#1}\\}}

\newcommand{\namecoadvisor}{0}
\newcommand{\coorientador}[1]{\renewcommand{\namecoadvisor}{\noindent\textbf{Co-orientador:} \textit{#1}\\}}

\newcommand{\aluno}[1]{\def\aluno{\noindent\textbf{Aluno(s):} {#1}\\}}
\newcommand{\fonte}[1]{\par\noindent\small{Fonte: {#1}}}
\newcommand{\nota}[1]{\par\noindent\justifying{\small{\noindent Nota: {#1}}}}
\newcommand{\referencias}[1]
{
    \section{Fontes de Pesquisa}
    \renewcommand{\section}[2]{}
    \bibliography{#1}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CABEÇALHO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\cabecalho}
{
    \universidade
    \centroCampus
    \departamento

    \noindent\textbf{Título do Projeto}

    \titulo

    \orientador
    \ifthenelse{\equal{\namecoadvisor}{0}}{}{
        % Exibindo o co-orientador, caso exista.
        \namecoadvisor
    }
    \aluno
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ASSINATURAS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\assinaturas}
{
    \newpage
    \singlespacing
    \begin{center}
        \bigskip\bigskip\bigskip\bigskip\bigskip\bigskip
        Itabaiana/SE, \rule{1cm}{0.4pt} de \rule{2cm}{0.4pt} de 20 \rule{1cm}{0.4pt}
        \bigskip\bigskip\bigskip\bigskip\bigskip \\
        \rule{7cm}{0.4pt} \\
        Orientador
        \bigskip\bigskip
        \ifthenelse{\equal{\namecoadvisor}{0}}{}{
            \bigskip \\
            \rule{7cm}{0.4pt} \\
            Co-orientador
            \bigskip\bigskip
        }
        \bigskip \\
        \rule{7cm}{0.4pt} \\
        Orientado(a)
    \end{center}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% AMBIENTE CÓDIGO %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\floatstyle{plaintop}
\newfloat{codigo}{htbp}{loc}
\floatname{codigo}{Código}

\floatstyle{plaintop}
\newfloat{algoritmo}{htbp}{loc}
\floatname{algoritmo}{Algoritmo}

\definecolor{mygreen}{rgb}{0,0.6,0}
\definecolor{mygray}{rgb}{0.5,0.5,0.5}
\definecolor{mymauve}{rgb}{0.58,0,0.82}
\lstset{
    aboveskip=0.8em,
    belowskip=0pt,
    basicstyle=\ttfamily\small,
    numberstyle=\footnotesize,
    numbers=left,
    backgroundcolor=\color{gray!10},
    frame=single,
    tabsize=2,
    rulecolor=\color{black!30},
    breaklines=true,
    breakatwhitespace=true,
    commentstyle=\color{mygreen},
    escapeinside={\%*}{*)},
    keywordstyle=\color{blue},
    stringstyle=\color{mymauve},
    showstringspaces=false,
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% AMBIENTE QUADRO %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\floatstyle{plaintop}
\newfloat{quadro}{htbp}{loc}
\floatname{quadro}{Quadro}