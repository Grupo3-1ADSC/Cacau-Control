create database CoolCacau;

use CoolCacau;

create table Clientes (
ID int primary key auto_increment,
Nome varchar(30),
Tipo_De_Comercio varchar(30),
CEP char(9),
CNPJ char(18),
Telefone varchar(20),
Email varchar(50),
Nome_do_representante varchar(50),
Tipo_de_sensor varchar(50),
IdSensor int,
Hectares int); 

create table Monitoramento (
IdMonitoramento int primary key auto_increment,
Tipo_de_sensor varchar(50),
Temperatura_C int,
Umidade_UR int,
Data_hora datetime,
IdCliente int);

create table Sensor (
IdSensor int primary key auto_increment,
Numero_Serial int,
Localizacao varchar(50),
Tipo_sensor varchar(30));

select * from Clientes;
select * from Monitoramento;
select * from Sensor;

INSERT INTO Clientes (Nome, Tipo_de_comercio, CEP, CNPJ, Telefone, Email, Nome_do_representante , Tipo_de_sensor, IdSensor , Hectares)
			  VALUES ('choconice', 'agronegocio', '06706-070','85.170.800/0001-03', '11998756423', 'choconice@sptech.school', 'Gerson', 'DHT11', 1, 4),
			         ('chocolight', 'agronegocio', '08587-400','65.194.370/0001-52', '1196358742', 'chocolight@sptech.school' , 'Denise', 'DHT11', 2 , 5),
                     ('chocolovers', 'agronegocio', '09912-060','94.489.510/0001-18', '11987456321', 'chocolovers@sptech.school', 'Rosa', 'DHT11', 3, 2);
               
INSERT INTO Monitoramento (Tipo_de_sensor, Temperatura_C, Umidade_UR, Data_hora, IdCliente)
	               VALUES ('DHT11', '24', '81', '2022-01-05 09:15:20', '1'),
						  ('DHT11', '21', '83', '2021-12-28 09:20:02', '2'),
                          ('DHT11', '22', '78', '2022-03-14 09:25:01', '3');

INSERT INTO Sensor (Numero_Serial, Localizacao, Tipo_sensor)
			VALUES ('5786', 'Sao Paulo', 'temperatura e umidade'),
				   ('9621', 'Sao Paulo', 'temperatura e umidade'),
                   ('7059', 'Sao Paulo', 'temperatura e umidade');