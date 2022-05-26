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
check( Plano='Gold' or Plano='Premium'),
SituaçãoDoPlano char (15),
check( SituaçãoDoPlano= 'Ativo' or SituaçãoDoPlano='Inativo'),
DataDeAquisicao datetime
);

insert into cliente values
(null, 'Cacau Nações','02452-017','1800','75.934.882/0001-29','naçõescacau@outlook.com','94174-2081','2317-6600','20','Premium','Ativo','2020-07-05'),

(null, 'Choc Fronteiras','09763-045','2437','46.789.638/0001-22','Chocfron@hotmail.com','97093-8002','1742-5099','15','Gold','Ativo','2021-05-18'),

(null,'Krochocolate','08317-935','589','96.325.298/0001-34','chocolatekroc@gmail.com','998321269','4283-1269','45','Premium','Ativo','2019-08-23'),

(null,'indico cacau','04796-235','2479','87.894.143/0001-20','cacauindico@gmail.com','973185489','4002-8742','50','Gold','inativo','2018-11-30');

select * from cliente;

create table usuario(
idUsuario int primary key auto_increment,
nome varchar (40),
cpf char (15),
email varchar(30),
senha varchar(45),
FkCliente int,
foreign key (FkCliente) references Cliente(idCliente)
);

select* from usuario;

create table Sensor(
idSensor int primary key auto_increment,
n_serial char(30),
Latitude varchar(50),
Longitude varchar(50),
FkCliente int,
foreign key (FkCliente) references Cliente(idCliente)
);

insert into sensor values
('1','1010','-23.655526', '-46.973499','1'),
('2','1011','-12.086504', '-40.529983','2'),
('3','1012','-10.157197', '-38.685469','3');
select*from sensor;

create table hist_medicao(
idHist int primary key  auto_increment,
dht11_umidade decimal(10,2),
dht11_temperatura decimal(10,2),
luminosidade decimal(10,2),
lm35_temperatura decimal(10,2),
chave int,
momento datetime default current_timestamp,
Alerta_Temperatura char(15),
check( Alerta_Temperatura='critico' or Alerta_Temperatura= 'normal' or Alerta_Temperatura='alerta'),
Alerta_Umidade char(15),
check(Alerta_Umidade ='critico' or Alerta_Umidade= 'normal' or Alerta_Umidade='alerta'),
FkSensor_dht11 int,
foreign key (FkSensor_dht11) references Sensor(idSensor)
);

insert into hist_medicao(dht11_umidade,dht11_temperatura,alerta_temperatura,alerta_umidade,FkSensor_dht11) values
('50','40','normal','normal','2');




create table Cliente(
idCliente int primary key identity,
Nome varchar (45),
CEP char (9),
Numero char (9),
CNPJ char (19),
Email varchar (30),
Celular varchar (20),
Telefone varchar (20),
Hectares varchar (15),
Plano char (10),
check( Plano='Gold' or Plano='Premium'),
SituaçãoDoPlano char (15),
check( SituaçãoDoPlano= 'Ativo' or SituaçãoDoPlano='Inativo'),
DataDeAquisicao datetime
);

/*

!!!! script sql serve !!!!

create table usuario(
idUsuario int primary key identity,
nome varchar (40),
cpf char (15),
email varchar(30),
senha varchar(45),
FkCliente int,
foreign key (FkCliente) references Cliente(idCliente)
);

create table Sensor(
idSensor int primary key identity,
n_serial char(30),
Latitude varchar(50),
Longitude varchar(50),
FkCliente int,
foreign key (FkCliente) references Cliente(idCliente)
);

create table hist_medicao(
idHist int primary key  identity,
dht11_umidade decimal(10,2),
dht11_temperatura decimal(10,2),
luminosidade decimal(10,2),
lm35_temperatura decimal(10,2),
chave int,
momento datetime default current_timestamp,
Alerta_Temperatura char(15),
check( Alerta_Temperatura='critico' or Alerta_Temperatura= 'normal' or Alerta_Temperatura='alerta'),
Alerta_Umidade char(15),
check(Alerta_Umidade ='critico' or Alerta_Umidade= 'normal' or Alerta_Umidade='alerta'),
FkSensor_dht11 int,
foreign key (FkSensor_dht11) references Sensor(idSensor)
); 

 */