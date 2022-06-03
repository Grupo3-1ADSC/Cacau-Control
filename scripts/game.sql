create database karatu;
use karatu;

create table territorio (
id_territorio int auto_increment primary key, 
nome varchar(255),
temp_media double,
umid_media double );

insert into territorio values
(null,'Farth',67,38),
(null,'Yug',40,50),
(null,'Solosan',22,32);

create table cla (
id_cla int primary key auto_increment,
nome varchar(255),
lema varchar(255),
mascote varchar(255),
fk_territorio int,
fk_aliado int,
foreign key (fk_territorio) references territorio(id_territorio),
foreign key (fk_aliado) references cla(id_cla) );

insert into cla values
(null,'Zathura','Seja terra ou mar, vencer! vencer! vencer!','Uruzutu','2',null),
(null,'Fielgooh','Um por todos, e todos por um','Coraxe','2',null),
(null,'Lapras','Vida por vida','Chamander','1','1'),
(null,'Bundim','Braços às armas feitos','Durga','3','2');

-- Para inserir aliados
update cla set fk_aliado='4' where id_cla='2';
update cla set fk_aliado='3' where id_cla='1';

create table armas (
id_arma int primary key auto_increment,
nome_arma varchar(255),
classe varchar(255),
check (classe = 'SS' OR classe = 'S' OR classe = 'A' OR classe = 'D' OR classe = 'F'),
nivel_forca int, 
distancia enum ('curto-alcance','medio-alcance','longo-alcance') );

insert into armas values
(null,'Espada Yukiê','S','700','medio-alcance'),
(null,'Machado de Assis','D','130','medio-alcance'),
(null,'Enxada Devolura','F','100','medio-alcance'),
(null,'Cajado di Silimão','S','600','longo-alcance'),
(null,'Arco da Fidelie','SS','600','longo-alcance'),
(null,'Faque 300','A','700','curto-alcance'),
(null,'Foice Khronos','A','500','longo-alcance'),
(null,'Kunai Kyrol','D','170','curto-alcance'),
(null,'Adaga Depoul','D','300','curto-alcance'),
(null,'Katana Myamotto','A','600','medio-alcance'),
(null,'Vara Hunter','F','90','longo-alcance');

create table super_poder (
id_superpoder int primary key auto_increment,
nome_poder varchar(255),
descricao_poder varchar(255) );

insert into super_poder values
(null,'Voar','O usuário desse poder ganha capacidade de voar'),
(null,'Invocar fogo','O usuário desse poder consegue invocar fogo dos céus'),
(null,'Sopro da vida','O usuário desse poder consegue transformar algo estatico em vida'),
(null,'Controlar água','O usuário desse poder ganha a habilidade de controlar qualquer coisa que contenha moléculas de água'),
(null,'Invisibilidade','O usuário desse poder ganha a habilidade de ser tornar invisivel'),
(null,'Super força','O usuário adquire a habilidade de super força'),
(null,'Velocidade da Luz','O usuário consegue correr na velocidade da luz'),
(null,'Made in Natura','O usuário dessse poder adquire a habilidade de controlar madeira'),
(null,'Relâmpago','O usuário adquire a habilidade de criar tempestades');

create table personagem (
idpersonagem int primary key auto_increment, 
nome varchar(45), 
especie varchar(45),
classe varchar (45),
nivel_inteligencia int,
nivel_forca int,
fk_cla int, foreign key (fk_cla) references cla (id_cla),
fk_arma int, foreign key (fk_arma) references armas (id_arma));

insert into personagem 
values 
(null, 'elfrost', 'humana','guerreira', 700, 500, 1, 10),
(null, 'jack', 'orc','mago', 300, 780, 1, 2),
(null, 'ryan', 'humano','mago', 100, 400, 1, 9),
(null, 'iritiel', 'orc','guerreiro', 750, 302, 1, null),
(null, 'juno', 'orc','guerreira', 800, 600,1, 5),

(null, 'nyarlathotep', 'orc','mago', 800, 200, 2, 4),
(null, 'konan', 'humano','guerreiro', 500, 900, 2, 7),
(null, 'azathoth', 'orc','guerreiro', 400, 650, 2, null),
(null, 'cthulhu', 'orc','mago', 1000, 200, 2, null), 
(null, 'nyaruko', 'humana','guerreiro', 600, 500, 2, 8),

(null, 'nameless', 'humano','guerreiro', 500, 700, 3, 6),
(null, 'tsa', 'humana','guerreira', 400, 800, 3, 7),
(null, 'belz', 'orc','mago', 700, 400, 3, 4),
(null, 'wend', 'humano','guerreiro', 800, 600, 3, 1),
(null, 'ithaqua', 'orc','guerreiro', 400, 650, 3, 11),

(null, 'penny', 'humana','bruxa', 700, 300, 4, 3),
(null, 'joseph', 'humano','guerreiro', 400, 730, 4, 9),
(null, 'jeny', 'orc','guerreira', 500, 800, 4, 10),
(null, 'nya', 'orc','mago', 700, 500, 4, 1),
(null, 'hastur', 'humano','guerreiro', 500, 810, 4, 11);