show databases;

create database banco_botocorderosa;

use banco_botocorderosa;

create table pessoa (
id int primary key auto_increment,
nome varchar(200),
email varchar(200),
linkedin varchar(200),
cidade varchar(100),
estado varchar(100),
pais varchar(100),
tempo double
);

show tables;
desc pessoa;

create table formacao (
id int primary key auto_increment,
idpessoa int,
data varchar(10),
ensinomedio varchar(50),
ensinosuperior varchar(50),
posgraduacao varchar(50),
mestrado varchar(50),
doutourado varchar(50),
foreign key (idpessoa) references pessoa(id)
);

show tables;
desc formacao;

create table idioma(
id int primary key auto_increment,
idpessoa int,
lingua varchar(100),
nivel varchar(50),
foreign key (idpessoa) references pessoa(id)
);

show tables;
desc idioma;

create table curriculo(
id int primary key auto_increment,
idpessoa int,
contato varchar(1000),
competencia varchar(1000),
certificado varchar(1000),
idioma varchar(1000),
resumo varchar(1000),
experiencia varchar(1000),
formacao varchar(1000),
textocompleto varchar(2000),
foreign key (idpessoa) references pessoa(id)
);

/* *************************************** Nivel de formação *************************************** */
select * from pessoa
inner join formacao on pessoa.id = formacao.idpessoa
where ensinomedio = '1' and
ensinosuperior = '1' and
posgraduacao = '1' and
mestrado = '1' and
doutourado = '1';

/* *************************************** Idioma *************************************** */
select * from pessoa
inner join idioma on pessoa.id = idioma.idpessoa
where idioma.lingua = '{lingua}';
-- and idioma.nivel = '{nivel}';

/* *************************************** Tempo de experiencia *************************************** */
select * from pessoa;
-- where tempo <= {tempo};

/* *************************************** Região *************************************** */		
select * from pessoa
-- where estado <= {estado};


/* ************************************************************************************ */
/* *************************************** CRUD *************************************** */
/* ************************************************************************************ */

/* --------------------------------  INSERT  ----------------------------------------- */
/* ********************************** PESSOA ************************************** */
INSERT INTO pessoa (nome, email, linkedin, cidade, estado, pais, tempo)
VALUES ('nome', 'email', 'linkedin', 'cidade', 'estado', 'pais', 'tempo');

select * from pessoa;
INSERT INTO pessoa (nome, email, linkedin, cidade, estado, pais, tempo)
VALUES ('Richard Clarindo', 'richard_clarindo@gmail.com', 'richard_clarindo@linkedin.com', 'Manaus', 'Amazonas', 'Brazil', '3');

INSERT INTO pessoa (nome, email, linkedin, cidade, estado, pais, tempo)
VALUES ('Victor Vasconcelos', 'victor.vasconcelos@gmail.com', 'vasconcelos@linkedin.com', 'Manaus', 'Amazonas', 'Brazil', '4');

INSERT INTO pessoa (nome, email, linkedin, cidade, estado, pais, tempo)
VALUES ('Warlison Santos', 'warlison.santos@hotmail.com', 'warlison@linkedin.com', 'Parintins', 'Amazonas', 'Brazil', '1.5');

INSERT INTO pessoa (nome, email, linkedin, cidade, estado, pais, tempo)
VALUES ('Livia Andrade', 'liviaandrade@gmail.com', 'liviaandrade@linkedin.com', 'Sao Paulo', 'Sao Paulo', 'Brazil', '4');


-- FALTA DEFINIR O TEMPO, SE É ANO/ MESES/ HORA

/* ********************************** FORMACAO ************************************** */
INSERT INTO formacao (idpessoa, data, ensinomedio, ensinosuperior, posgraduacao, mestrado, doutourado)
VALUES ('idpessoa', 'data', 'ensinomedio', 'ensinosuperior', 'posgraduacao', 'mestrado', 'doutourado');

select * from pessoa;
select * from formacao;
INSERT INTO formacao (idpessoa, data, ensinomedio, ensinosuperior, posgraduacao, mestrado, doutourado)
VALUES ('1', '20/12/2013', '1', '1', '1', '0', '1');
INSERT INTO formacao (idpessoa, data, ensinomedio, ensinosuperior, posgraduacao, mestrado, doutourado)
VALUES ('2', '20/12/2013', '1', '1', '0', '1', '1');
INSERT INTO formacao (idpessoa, data, ensinomedio, ensinosuperior, posgraduacao, mestrado, doutourado)
VALUES ('3', '20/12/2022', '1', '1', '0', '0', '0');
INSERT INTO formacao (idpessoa, data, ensinomedio, ensinosuperior, posgraduacao, mestrado, doutourado)
VALUES ('4', '20/12/2013', '1', '1', '1', '0', '0');


-- O CAMPO DATA NÃO FAZ SENTIDO, DATA DE QUE?

/* ********************************** IDIOMA ************************************** */
INSERT INTO idioma (idpessoa, lingua, nivel)
VALUES ('idpessoa', 'lingua', 'nivel');

select * from pessoa;
select * from idioma;

INSERT INTO idioma (idpessoa, lingua, nivel)
VALUES ('1', 'Ingles', 'Intermediario');

INSERT INTO idioma (idpessoa, lingua, nivel)
VALUES ('1', 'Espanhol', 'Basico');

INSERT INTO idioma (idpessoa, lingua, nivel)
VALUES ('1', 'Frances', 'Intermediario');

INSERT INTO idioma (idpessoa, lingua, nivel)
VALUES ('2', 'Ingles', 'Avancado');

INSERT INTO idioma (idpessoa, lingua, nivel)
VALUES ('2', 'Espanhol', 'Avancado');

INSERT INTO idioma (idpessoa, lingua, nivel)
VALUES ('3', 'Ingles', 'Basico');

INSERT INTO idioma (idpessoa, lingua, nivel)
VALUES ('4', 'Espanhol', 'Intermediario');

delete from idioma where id = 5; 

/* ********************************** CURRICULO ************************************** */
INSERT INTO curriculo (idpessoa, contato, competencia, certificado, idioma, resumo, experiencia, formacao, textocompleto)
VALUES ('idpessoa', 'contato', 'competencia', 'certificado', 'idioma', 'resumo', 'experiencia', 'formacao', 'textocompleto');

ALTER TABLE curriculo MODIFY experiencia varchar(5000);
ALTER TABLE curriculo MODIFY textocompleto varchar(5000);

-- Texto completo é impossivel salvar, temos limite de 8000 caracteres.
-- Precisamos ver uma forma de pegar o texto completo salvando em alguma plataforma

delete from curriculo where id = 1;
select * from curriculo;
select * from pessoa;
desc curriculo;
INSERT INTO curriculo (idpessoa, contato, competencia, certificado, idioma, resumo, experiencia, formacao, textocompleto)
VALUES ('1', 'Contato
richard.clarindo@gmail.com
www.linkedin.com/in/richardclarindo (LinkedIn)
', 
'Microsoft Excel
Atendimento ao Cliente
Microsoft Office
', 
'Flexbox: o guia completo
Fundamentos da Gestão de Riscos
em Projetos
Entendendo e documentando REST/
RESTful APIs
CSS Grid: o sistema definitivo de
layouts
Laravel 5.5 com Vue JSLaravel 5.5
com Vue JS', 
'Ingles', 
'', 
'Instituto de Pesquisas Eldorado
4 anos 1 mês
Analista de Software Júnior
fevereiro de 2022 - Present (2 anos 1 mês)
Manaus, Amazonas, Brasil
Analista de Software Trainee
setembro de 2021 - janeiro de 2022 (5 meses)
Manaus, Amazonas, Brasil
Developer Internship
fevereiro de 2020 - setembro de 2021 (1 ano 8 meses)
• Atuação em time responsável pela adaptação de produtos para novas
versões do Android
• Apoio no processo de liberação de releases para as operadoras de telefonia
móvel, com ampla atuação em validações de software.
• Analise e acompanhamento de requisitos para todos os produtos do
cliente antes do lançamento no mercado. Direcionamento dos problemas
encontrados para o respectivo time técnico além de coleta de logs e
informações.
• Aumento da qualidade do software e correção de problemas críticos antes
de atingirem o mercado. Experimentos e testes relacionados a experiência
do usuário, entregando um serviço dentro de parâmetros de qualidade
especificados.
• Realização de testes para garantir um software sem defeitos.
PMZ Peças e Pneus / PEMAZA
1 ano 1 mês
Auxiliar de programação
maio de 2019 - janeiro de 2020 (9 meses)
Manaus
Full Stack.
Estagiário Desenvolver PHP
janeiro de 2019 - abril de 2019 (4 meses)
Page 1 of 3
Manaus
Programação web em PHP, JavaScript e JQuery, com experiência com HTML
e CSS com uso de templates, Smarty Templates System e Tecnologia AJAX;
Gerenciamento de dados através dos bancos de dados da Oracle e
PostgreSql;
Desenvolvimento de sites e aplicações para uso na intranet.
Jabil
Estagiário de TI
setembro de 2018 - janeiro de 2019 (5 meses)
Manaus e Região, Brasil
Atendimento do Service Desk usando o conceito da ITIL, atuando no nível
STN1 (registra, qualifica, prioriza, resolve ou encaminha), sendo o primeiro
contato com o usuário, servindo como suporte em informática.
Instituto Federal de Educação, Ciência e Tecnologia do Amazonas -
IFAM
Instrutor de Informática
fevereiro de 2018 - agosto de 2018 (7 meses)
MANAUS, AMAZONAS
Responsável pela padronização / montagem / apresentação do plano,
frequência, nota, conteúdo, relatório e assuntos das aulas a serem
ministradas de forma presencial.
MRC SERVIÇOS DE ARMAZENAMENTO LTDA
Estagiário Desenvolvedor de software
janeiro de 2016 - janeiro de 2017 (1 ano 1 mês)
Manaus e Região, Brasil
Programação web em PHP, JavaScript e JQuery, com experiência com HTML
e CSS com uso de templates, Smarty Templates System e Tecnologia AJAX;
Gerenciamento de dados através dos bancos de dados da Oracle e
PostgreSql.
Instituto Federal de Educação, Ciência e Tecnologia do Amazonas -
IFAM
Instrutor de Informática
fevereiro de 2016 - dezembro de 2016 (11 meses)
Responsável pela padronização / montagem / apresentação do plano,
frequência, nota, conteúdo, relatório e assuntos das aulas a serem
ministradas de forma presencial.
Page 2 of 3
Instituto Federal de Educação, Ciência e Tecnologia do Amazonas -
IFAM
Monitor de informática
junho de 2015 - dezembro de 2015 (7 meses)
Manaus
Atendimento ao cliente e diagnóstico de problemas envolvendo a área da
informática;
Sony Brasil
Aprendiz - Operador de Linha de Montagem
agosto de 2011 - 2013 (2 anos)
Manaus e Região, Brasil', 
'UniNorte (Centro Universitário do Norte)
Graduação, Ciência da Computação · (2018 - 2021)
Instituto Federal de Educação, Ciência e Tecnologia do Amazonas -
IFAM
Técnico, Técnico em Informática · (2015 - 2016)', 
'Contato
richard.clarindo@gmail.com
www.linkedin.com/in/richardclarindo (LinkedIn)
Principais competências
Microsoft Excel
Atendimento ao Cliente
Microsoft Office
Certifications
Flexbox: o guia completo
Fundamentos da Gestão de Riscos
em Projetos
Entendendo e documentando REST/
RESTful APIs
CSS Grid: o sistema definitivo de
layouts
Laravel 5.5 com Vue JSLaravel 5.5
com Vue JS
Richard Clarindo
Analista de Software Jr | Instituto de Pesquisas Eldorado
Manaus, Amazonas, Brasil
Experiência
Instituto de Pesquisas Eldorado
4 anos 1 mês
Analista de Software Júnior
fevereiro de 2022 - Present (2 anos 1 mês)
Manaus, Amazonas, Brasil
Analista de Software Trainee
setembro de 2021 - janeiro de 2022 (5 meses)
Manaus, Amazonas, Brasil
Developer Internship
fevereiro de 2020 - setembro de 2021 (1 ano 8 meses)
• Atuação em time responsável pela adaptação de produtos para novas
versões do Android
• Apoio no processo de liberação de releases para as operadoras de telefonia
móvel, com ampla atuação em validações de software.
• Analise e acompanhamento de requisitos para todos os produtos do
cliente antes do lançamento no mercado. Direcionamento dos problemas
encontrados para o respectivo time técnico além de coleta de logs e
informações.
• Aumento da qualidade do software e correção de problemas críticos antes
de atingirem o mercado. Experimentos e testes relacionados a experiência
do usuário, entregando um serviço dentro de parâmetros de qualidade
especificados.
• Realização de testes para garantir um software sem defeitos.
PMZ Peças e Pneus / PEMAZA
1 ano 1 mês
Auxiliar de programação
maio de 2019 - janeiro de 2020 (9 meses)
Manaus
Full Stack.
Estagiário Desenvolver PHP
janeiro de 2019 - abril de 2019 (4 meses)
Page 1 of 3
Manaus
Programação web em PHP, JavaScript e JQuery, com experiência com HTML
e CSS com uso de templates, Smarty Templates System e Tecnologia AJAX;
Gerenciamento de dados através dos bancos de dados da Oracle e
PostgreSql;
Desenvolvimento de sites e aplicações para uso na intranet.
Jabil
Estagiário de TI
setembro de 2018 - janeiro de 2019 (5 meses)
Manaus e Região, Brasil
Atendimento do Service Desk usando o conceito da ITIL, atuando no nível
STN1 (registra, qualifica, prioriza, resolve ou encaminha), sendo o primeiro
contato com o usuário, servindo como suporte em informática.
Instituto Federal de Educação, Ciência e Tecnologia do Amazonas -
IFAM
Instrutor de Informática
fevereiro de 2018 - agosto de 2018 (7 meses)
MANAUS, AMAZONAS
Responsável pela padronização / montagem / apresentação do plano,
frequência, nota, conteúdo, relatório e assuntos das aulas a serem
ministradas de forma presencial.
MRC SERVIÇOS DE ARMAZENAMENTO LTDA
Estagiário Desenvolvedor de software
janeiro de 2016 - janeiro de 2017 (1 ano 1 mês)
Manaus e Região, Brasil
Programação web em PHP, JavaScript e JQuery, com experiência com HTML
e CSS com uso de templates, Smarty Templates System e Tecnologia AJAX;
Gerenciamento de dados através dos bancos de dados da Oracle e
PostgreSql.
Instituto Federal de Educação, Ciência e Tecnologia do Amazonas -
IFAM
Instrutor de Informática
fevereiro de 2016 - dezembro de 2016 (11 meses)
Responsável pela padronização / montagem / apresentação do plano,
frequência, nota, conteúdo, relatório e assuntos das aulas a serem
ministradas de forma presencial.
Page 2 of 3
Instituto Federal de Educação, Ciência e Tecnologia do Amazonas -
IFAM
Monitor de informática
junho de 2015 - dezembro de 2015 (7 meses)
Manaus
Atendimento ao cliente e diagnóstico de problemas envolvendo a área da
informática;
Sony Brasil
Aprendiz - Operador de Linha de Montagem
agosto de 2011 - 2013 (2 anos)
Manaus e Região, Brasil
Formação acadêmica
UniNorte (Centro Universitário do Norte)
Graduação, Ciência da Computação · (2018 - 2021)
Instituto Federal de Educação, Ciência e Tecnologia do Amazonas -
IFAM
Técnico, Técnico em Informática · (2015 - 2016)
');


select * from curriculo;
INSERT INTO curriculo (idpessoa, contato, competencia, certificado, idioma, resumo, experiencia, formacao, textocompleto)
VALUES ('idpessoa', 'contato', 'competencia', 'certificado', 'idioma', 'resumo', 'experiencia', 'formacao', 'textocompleto');


/* --------------------------------  DELETE  ----------------------------------------- */
/* ********************************** PESSOA ************************************** */
DELETE FROM pessoa where id = {id};
/* ********************************** FORMACAO ************************************** */
DELETE FROM formacao where id = {id};
/* ********************************** IDIOMA ************************************** */
DELETE FROM idioma where id = {id};
/* ********************************** CURRICULO ************************************** */
DELETE FROM curriculo where id = {id};

/* --------------------------------  SELECT  ----------------------------------------- */
/* ********************************** PESSOA ************************************** */
SELECT * FROM pessoa;
desc pessoa;
alter table pessoa modify nome varchar(200) not null;
alter table pessoa modify email varchar(200) not null;
alter table pessoa modify linkedin varchar(200) not null;
alter table pessoa modify cidade varchar(100) not null;
alter table pessoa modify estado varchar(100) not null;
alter table pessoa modify pais varchar(100) not null;
alter table pessoa modify tempo double not null;

/* ********************************** FORMACAO ************************************** */
SELECT * FROM formacao;
desc formacao;

alter table formacao modify idpessoa int not null;
alter table formacao modify data varchar(10) not null;
alter table formacao modify ensinomedio varchar(50) not null;
alter table formacao modify ensinosuperior varchar(50) not null;
alter table formacao modify posgraduacao varchar(50) not null;
alter table formacao modify mestrado varchar(50) not null;
alter table formacao modify doutorado varchar(50) not null;

ALTER TABLE formacao change column doutourado doutorado varchar(50);
/* ********************************** IDIOMA ************************************** */
SELECT * FROM idioma;
Desc idioma;

alter table idioma modify idpessoa int not null;
alter table idioma modify lingua varchar(100) not null;
alter table idioma modify nivel varchar(50) not null;

/* ********************************** CURRICULO ************************************** */
SELECT * FROM curriculo;
desc curriculo;

alter table curriculo modify idpessoa int not null;


/* --------------- ATUALIZANDO BD ----------------- */
SELECT * FROM PESSOA;
DESC PESSOA;
UPDATE PESSOA SET TEMPO = 2 WHERE ID =3;
alter table PESSOA modify tempo int not null;

ALTER TABLE PESSOA DROP COLUMN PAIS;

show tables;
select * from pessoa;
select * from curriculo;