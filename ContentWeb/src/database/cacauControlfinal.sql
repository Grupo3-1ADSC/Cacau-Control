create database CacauControl;

use CacauControl;

create table Cliente(
idCliente int primary key auto_increment,
Nome varchar (45),
CEP char (9),
Numero char (9),
CNPJ char (19),
Email varchar (30),
Celular varchar (20),
Telefone varchar (20),
Hectares varchar (15),
Plano char (10),
check( Plano='Gold' or Plano='Premium' or Plano='Personalizado' ),
SituaçãoDoPlano char (15),
check( SituaçãoDoPlano= 'Ativo' or SituaçãoDoPlano='Inativo'),
DataDeAquisicao datetime,
CodigoLiberacao char (10)
);

insert into cliente (nome,cep,numero,cnpj,email,celular,telefone,hectares,plano,situaçãodoplano,datadeaquisicao,codigoliberacao)
values ('Cacau Nações','02452-017','1800','75.934.882/0001-29','naçõescacau@outlook.com','94174-2081','2317-6600','20','Premium','Ativo','2020-07-05','3582174967');

insert into cliente (nome,cep,numero,cnpj,email,celular,telefone,hectares,plano,situaçãodoplano,datadeaquisicao,codigoliberacao)
values ('Choc Fronteiras','09763-045','2437','46.789.638/0001-22','Chocfron@hotmail.com','97093-8002','1742-5099','15','Gold','Ativo','2021-05-18','0398147632');

insert into cliente (nome,cep,numero,cnpj,email,celular,telefone,hectares,plano,situaçãodoplano,datadeaquisicao,codigoliberacao)
values ('Krochocolate','08317-935','589','96.325.298/0001-34','chocolatekroc@gmail.com','998321269','4283-1269','45','Premium','Ativo','2019-08-23','1823679244');

Insert into cliente (nome,cep,numero,cnpj,email,celular,telefone,hectares,plano,situaçãodoplano,datadeaquisicao,codigoliberacao)
values ('indico cacau','04796-235','2479','87.894.143/0001-20','cacauindico@gmail.com','973185489','4002-8742','50','Gold','inativo','2018-11-30','7463215980');

select * from cliente;

create table usuario(
idUsuario int primary key auto_increment,
nome varchar (40),
cpf char (15),
email varchar(30),
senha varchar(45)
-- FkCliente int,
-- foreign key (FkCliente) references Cliente(idCliente)
);

-- remoção do fk Cliente por hora
Insert into usuario (nome, cpf, email, senha)
values ('João Rosa', 589325416-89, 'joao123@hotmail.com', 125874);

Insert into Usuarios (nome, cpf, email, senha)
values ('Jefferson Pires', 123479620-25, 'jefferson.pires38@gmail.com', 'jeff853');

Insert into Usuarios (nome, cpf, email, senha)
values ('Ayrton Cleyton', 236541897-65, 'cleyton453@indicocacau.com', 'cacauindico895');

Insert into Usuarios (nome, cpf, email, senha)
values ('Cleide Pereira', 87420136589-45, 'cleide.pere452@outlook.com', 'pereira873');

Insert into Usuarios (nome, cpf, email, senha)
values ('Conceição silva', 02136846-87, 'conceisil@outlook.com', 'conceicaosilsil's);

select* from usuarios;

create table Sensor(
idSensor int primary key auto_increment,
NumeroSerial char(30),
Latitude varchar(50),
Longitude varchar(50),
TemperaturaMaxima varchar (50),
TemperaturaMinima varchar (50),
UmidadeMaxima varchar (50),
UmidadeMinima varchar (50),
FkCliente int,
foreign key (FkCliente) references Cliente(idCliente)
);

Insert into Sensor (NumeroSerial, Latitude, Longitude, TemperaturaMaxima, TemperaturaMinima, UmidadeMaxima, UmidadeMinima, Fkcliente)
values ('1549862304', '16º 10 59 S', '50º 46 47 W', '25°', '22°', '60%', '45%', 3);

Insert into Sensor (NumeroSerial, Latitude, Longitude, TemperaturaMaxima, TemperaturaMinima, UmidadeMaxima, UmidadeMinima, Fkcliente)
values ('1478953245', '18º 25 47 S', '40º 87 74 W', '26°', '21°', '55%', '43%', 2);

Insert into Sensor (NumeroSerial, Latitude, Longitude, TemperaturaMaxima, TemperaturaMinima, UmidadeMaxima, UmidadeMinima, Fkcliente)
values ('5874632578', '25º 74 54 S', '47º 89 25 W', '23°', '25°', '60%', '40%', 1);

Insert into Sensor (NumeroSerial, Latitude, Longitude, TemperaturaMaxima, TemperaturaMinima, UmidadeMaxima, UmidadeMinima, Fkcliente)
values ('2035874985', '17º 14 76 S', '32º 74 02 W', '25°', '22°', '60%', '45%', 4);

select* from sensor;

create table Registro(
idRegistro int primary key  auto_increment,
Temperatura varchar(50),
Umidade varchar (50),
DataHora datetime,
Alerta char(15),
check( Alerta='Critico' or Alerta= 'Estavel'),
FkSensor int,
foreign key (FkSensor) references Sensor(idSensor)
);

Insert into Registro (Temperatura, Umidade, DataHora, Alerta, Fksensor)
values ('23°', '55%', '2022-04-16','Estavel', 1);

Insert into Registro (Temperatura, Umidade, DataHora, Alerta, Fksensor)
values ('21°', '47%', '2022-04-16','Estavel', 2);

Insert into Registro (Temperatura, Umidade, DataHora, Alerta, Fksensor)
values ('24°', '39%', '2022-04-16','Critico', 3);

Insert into Registro (Temperatura, Umidade, DataHora, Alerta, Fksensor)
values ('23°', '53%', '2022-04-16','Estavel', 4);

select* from Registro;

