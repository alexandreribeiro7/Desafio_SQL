/****1****/

CREATE TABLE BANCO(
    Codigo int not null,
    Nome varchar(150) not null
);

CREATE TABLE AGENCIA(
    Cod_banco int not null,
    Numero_agencia int zerofill not null,
    Endereco varchar(200) not null,
    primary key(Cod_banco, Numero_agencia),
    foreign key(Cod_banco) references BANCO(Codigo)
);

CREATE TABLE CLIENTE(
    Cpf varchar(14) not null,
    Nome varchar(150) not null,
    Sexo char(1) not null,
    Endereco varchar(200) not null
);

CREATE TABLE CONTA(
    Numero_conta varchar(10) not null,
    Saldo float not null,
    Tipo_conta int not null,
    Num_agencia int zerofill not null,
    primary key(Numero_conta),
    foreign key(Num_agencia) references AGENCIA(Numero_agencia)
);

CREATE TABLE HISTORICO(
    Cpf_cliente varchar(14) not null,
    Num_conta varchar(10) not null,
    Data_inicio date not null,
    primary key(Cpf_cliente, Num_conta),
    foreign key(Cpf_cliente) references CLIENTE(Cpf),
    foreign key(Num_conta) references CONTA(Numero_conta)
);

CREATE TABLE TELEFONE_CLIENTE(
    Cpf_cliente varchar(14) not null,
    Telefone  varchar(13) not null,
    primary key(Cpf_cliente, Telefone),
    foreign key(Cpf_cliente) references CLIENTE(Cpf)
); 

/****2****/

INSERT INTO BANCO(Codigo, Nome) values (1, "Banco do Brasil"), (4, "CEF");

INSERT INTO AGENCIA(Numero_agencia, Endereco, Cod_banco) values (0562, "Rua Joaquim Teixeira Alves, 1555", 4), (3153, "Av. Marcelino Pires, 1960", 1);

INSERT INTO CLIENTE(Cpf, Nome, Sexo, Endereco) values ("111.222.333-44", "Jennifer B Souza", "F", "Rua Cuiabá, 1050"), ("666.777.888-99", "Caetano K Lima", "M", "Rua Ivinhema, 869"), ("555.444.777-33", "Silvia Macedo", "F", "Rua Estados Unidos, 735");

INSERT INTO CONTA(Numero_conta, Saldo, Tipo_conta, Num_agencia) values ("86340-2", 763.05, 2, 3153), ("23584-7", 3879.12, 1, 0562);

INSERT INTO HISTORICO(Cpf, Num_conta, Data_inicio) values ('111.222.333-44', '23584-7', '17-12-1997'), ('666.777.888-99', '23584-7', '17-12-1997'), ('555.444.777-33', '86340-2', '29-11-2010');

INSERT INTO TELEFONE_CLIENTE(Cpf_cli, Telefone_cli) values ('111.222.333-44', '(67)3422-7788'), ('666.777.888-99', '(67)3422-9900'), ("666.777.888-99", "(67)8121-8833");

/****3****/

ALTER TABLE CLIENTE ADD column Email varchar(255);

ALTER TABLE CLIENTE DROP COLUMN Email;

UPDATE CLIENTE
SET Cpf_cliente = '222.444.777-33'
WHERE Cpf_cliente = 'Silva Macedo';

DELETE FROM CONTA
WHERE Numero_conta = '86340-2';

SELECT * FROM CLIENTE 
WHERE Nome = "Caetano K Lima";

SELECT C.Num_agencia, C.Numero_conta, P.Nome FROM CLIENTE AS P JOIN HISTORICO AS H ON P.Cpf = H.Cpf_cliente JOIN CONTA AS C ON C.Numero_conta = H.Num_conta; 

SELECT * FROM CLIENTE WHERE Sexo = "H";

SELECT COUNT(*) AS "Qtd. de clientes" FROM CLIENTE;

/****Winestore****/

a- CREATE DATABASE winestore;

b- SELECT id, nome, endereco, cidade, estado
FROM Cliente
UNION
SELECT id, nome, ano, valor, id_vinicula, id_tipo
FROM Vinho;

c- SELECT * FROM Reserva WHERE data = "21-01-2019";

d- SELECT * FROM Cliente e
WHERE e.id NOT IN (SELECT reservaId FROM Reserva);  

e- SELECT MONTH(STR_TO_DATE(data, "%d/10/2018"))
FROM Reserva;

