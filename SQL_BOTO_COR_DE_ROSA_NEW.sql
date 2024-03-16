create database banco_botocorderosa;

use banco_botocorderosa;

create table pessoa (
id int primary key auto_increment,
nome varchar(200),
email varchar(200),
linkedin varchar(200),
tempoexperiencia int,
ensinomedio int,
ensinosuperior int,
posgraduacao int,
mestrado int,
doutorado int
);
-- drop table pessoa;
desc pessoa;

-- Query para selecionar todos os curriculos cadastradas
select * from pessoa;

-- Query para selecionar usuarios especificos atraves do filtro
select * from pessoa 
-- Montar funcao
where tempoexperiencia = {opcao1} 
and ensinomedio = {opcao2}
and ensinosuperior = {opcao2}
and posgraduacao = {opcao2}
and mestrado = {opcao2}
and doutourado = {opcao2};

-- Query para inserir na tabela pessoa
INSERT INTO pessoa (nome, email, linkedin, tempoexperiencia, ensinomedio, ensinosuperior, posgraduacao, mestrado, doutorado)
VALUES ('nome', 'email', 'linkedin', 123 , 1, 1, 1, 1, 1);

