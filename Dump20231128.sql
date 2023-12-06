show databases;  -- mostra banco --

create database cadastro;  -- cria um banco de dados --

use cadastro;   -- usa o banco --

create table pessoas(    -- criando tabela --
id int not null auto_increment,   -- id é preenchido automático --
nome varchar(30) not null,
nascimento date,
sexo enum('M', 'F'),
peso decimal(5,2),
altura decimal(3,2),
nacionalidade varchar(20) default 'Brasil',
primary key(id)   -- id é a chave primária --
)
default charset = utf8;

insert into pessoas  -- inseri dados na tabela --
(nome, nascimento, sexo, peso, altura , nacionalidade)
values  -- valores --
('Luna', '2012-07-11', 'M', '50', '1.45', 'Japão'),
('Luan', '2012-07-10', 'M', '55', '1.45', 'Espanha');

select * from pessoas;   -- seleciona todos na tabela --

describe pessoas;  -- descreve a tabela --

alter table pessoas   -- altera a tabela --
add column codigo int first;  -- adiciona a coluna em primeiro --

alter table pessoas 
add column profissao varchar(10);  -- adicina coluna --

alter table pessoas
modify column profissao varchar(20);

alter table pessoas
rename to gafanhotos;   -- renomeia a tabela --

describe gafanhotos;

alter table gafanhotos
drop column profissao;  -- apaga uma coluna --

alter table gafanhotos
add column prof varchar(20) after nome;

alter table gafanhotos
change column profissao prof varchar(20);  -- mudar o nome da coluna --

alter table gafanhotos
drop column prof;

select * from gafanhotos;

create table if not exists cursos(
nome varchar (30) not null unique,
descricao text,
carga int unsigned,
totaulas int unsigned,
ano year default '2016'
)default charset = utf8;

describe cursos;

alter table cursos
add column idcurso int first; 

alter table cursos
add primary key(idcurso);

drop table if exists testes;   -- apaga uma tabela --

show tables;   -- mostra tabela --

insert into cursos
values
('1', 'HTML4', 'Curso de HTML5', '40', '37', '2014'),
('2', 'Algoritmos', 'Lógica de Programção', '20', '15', '2014'),
('3', 'Photoshop', 'Dicas de Photoshop CC', '10', '8', '2014'),
('4', 'PGP', 'Curso de PHPpara Iniciantes', '40', '20', '2010'),
('5', 'Jarva', 'Introdução  à Linguagem Java', '10', '29', '2000'),
('6', 'Mysql', 'Banco de Dados Mysql', '30', '15', '2016'),
('7', 'Word', 'Curso Completo de Word', '40', '30', '2016'),
('8', 'Sapateado', 'Danças Rítmicas', '40', '30', '2018'),
('9', 'Cozinha Árabe', 'Aprenda a fazer kibe', '40', '30', '2018'),
('10', 'Youtuber', 'Gerar polêmica e ganhar inscritos', '5', '2', '2018');

select * from cursos;

update cursos  -- atualize a linha --
set nome = 'Java'  -- configurando para --
where idcurso = 5;  -- onde --
 
 delete from cursos   -- apague --
 where idcurso = '8';   -- onde --
 
 delete from cursos
 where ano = '2018'
 limit 2;
 
 -- truncate cursos  -- apaga a tabela --
 
 use cadastro;
 
 select * from cursos   -- seleciona todos os cursos --
 order by nome;   -- em ordem alfabética --
 
 select * from cursos
 order by nome desc;  -- em ordem decrescente --
 
 select ano, nome, carga from cursos   -- seleciona coluna especificas --
 order by ano, nome;
 
 select * from cursos  -- seleciona o ano --
 where ano = '2016'
 order by nome;
 
 select nome, descricao, ano from cursos
 where ano <> 2016   -- <>diferente =igual <=menor igual >maior igual <menor >maior --
 order by ano, nome;
 
 select nome, ano from cursos
 where ano between 2014 and 2016   -- onde___ entre__ e __ --
 order by nome;
 
 select nome, descricao, ano from cursos
 where ano in (2014, 2016)
 order by nome;
 
 select * from cursos
 where carga >35 and totaulas < 30   -- onde  e --
 order by nome;
 
 insert into cursos
 values
('8', 'Sapateado', 'Danças Rítmicas', '40', '30', '2019'),
('9', 'Cozinha Árabe', 'Aprenda a fazer kibe', '40', '30', '2018'),
('10', 'Youtuber', 'Gerar polêmica e ganhar inscritos', '5', '2', '2018');

select * from cursos
where nome like 'P%';  --  like -> parecido e % seleciona nenhum ou vários caracteres -- 

update cursos set nome = 'PáOO' where idcurso = '9';

 select * from cursos
 where nome like '%A';  -- cursos que terminam com a letra A --
 
 select * from cursos
 where nome like '%A%';  -- onde o nome parecido com a letra A --
 
 select * from cursos
 where nome not like '%A%'; -- onde o nome não é parecido com a letra A --

update cursos set nome = 'PáOO' where idcurso = '9';

 select * from cursos
 where nome like 'ph%p';
 
  select * from gafanhotos
 where nome like '%silva%';
 
 select distinct nacionalidade from gafanhotos
 order by nacionalidade;
 
 select distinct carga from cursos
 order by carga;
 
 select count(*) from cursos; -- count -> conta tudo --
 
 select * from cursos where carga >30; -- seleciona maior que --
 
 select count(*) from cursos where carga > 30;
 
 select count(nome) from cursos;
 
 select  max(carga) from cursos;  -- max -> qual a maior --
 
 select max(totaulas) from cursos where ano = '2016';
 
 select min(totaulas) from cursos where ano ='2016'; -- menor -> qual o menor --
 
 select sum(totaulas) from cursos; -- sum -> soma --
 
 select avg(totaulas) from cursos; -- avg -> media --
 
 select * from gafanhotos;
 
 -- Exercícios --
-- 1) Uma lista com o nome de todos os gafanhotos Mulheres. --
select nome from gafanhotos where sexo = 'F';

-- 2) Uma lista com os dados de todos aqueles que nasceram entre 1/Jan/2000 e 31/Dez/2015. --
select * from gafanhotos where nascimento between '01/jan/2000' and '31/dez/2015';

 -- 3) Uma lista com o nome de todos os homens que trabalham como programadores. --
select nome from gafanhotos where prof = 'Programador' and sexo = 'M';

-- 4) Uma lista com os dados de todas as mulheres que nasceram no Brasil e que têm seu nome iniciando com a letra J. --
select * from gafanhotos where nome like 'J%' and nacionalidade = 'Brasil' and sexo ='F';

-- 5) Uma lista com o nome e nacionalidade de todos os homens que têm Silva no nome, não nasceram no Brasil e pesam menos de 100 Kg. --
select nome, nacionalidade, peso from gafanhotos where sexo = 'M' and nacionalidade != 'Brasil' and peso < '100' and nome like '%Silva%';

-- 6) Qual é a maior altura entre gafanhotos Homens que moram no Brasil? --
select max(altura) from gafanhotos where sexo = 'M' and nacionalidade = 'Brasil';

-- 7) Qual é a média de peso dos gafanhotos cadastrados? --
select avg(altura) from gafanhotos where sexo;

-- 8) Qual é o menor peso entre os gafanhotos Mulheres que nasceram fora do Brasil e entre 01/Jan/1990 e 31/Dez/2000? --
select min(peso) nome from gafanhotos where sexo = 'F' and nacionalidade != 'Brasil' and nascimento between '01/jan/1990' and '31/dez/2000';

-- 9) Quantas gafanhotos Mulheres tem mais de 1.90cm de altura? --
 select count(*) from gafanhotos where sexo ='F' and altura > '1.90';

--------------------------------------------------
select * from cursos;

select totaulas from cursos order by totaulas; -- seleciona e ordena --

select totaulas, count(*) from cursos -- seleciona e conta --
 group by totaulas -- grupo de --
 order by totaulas;  -- ordem de --
 
 select * from cursos where totaulas > 20;
 
 select carga, count(nome) from cursos where totaulas =30 group by carga;
 
 select carga,count(nome) from cursos group by carga
 having count(nome) > 3;
 
 select ano, count(*) from cursos
 where totaulas = 30
 group by ano
 having ano
 order by count(*) desc;
 
 select avg(carga) from cursos;
 
 select carga, count(*) from cursos
 where ano > 2015
 group by carga
 having carga > (select avg(carga) from cursos);
 
 select * from gafanhotos;
 -- Exercícios --
-- 1) Uma lista com as profissões dos gafanhotos e seus respectivos quantitativos. --
Select prof, count(*) from gafanhotos Group by prof;

-- 2) Quantos gafanhotos Homens (M) e quantas gafanhotos Mulheres (F) nasceram após 01/01/2005? 
select sexo, count(*) from gafanhotos where nascimento > '2005-01-01' group by sexo;

-- 3) Uma lista com os gafanhotos que nasceram fora do Brasil, mostrando o páis de origem e total de pessoas nascidas lá. --
-- Só nos interessam os países que tiverem mais de 3 gafanhotos com essa nacionalidade. --
Select nacionalidade, count(*) from gafanhotos
Where nacionalidade != 'Brasil'
Group by nacionalidade
Having count(*) > 3;

-- 4) Uma lista agrupada pela altura dos gafanhotos, mostrando quantas pessoas pesam mais de 100kg --
-- e que estão acima da média de altura de todos os cadastrados. --
Select altura, count(*) from gafanhotos
Where peso > '100'
Group by altura
Having altura > (select avg(altura) from gafanhotos);
 

