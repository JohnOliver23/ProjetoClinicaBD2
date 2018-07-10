-- Insert Convenio --
select * from convenio;
insert into convenio values('13.223.975/0001-20','Caixa Saúde');
insert into convenio values('92.693.118/0001-60','Bradesco Saúde');
insert into convenio values('29.309.127/0001-79','Amil Saúde');
insert into convenio values('02.812.468/0001-06','Unimed');
insert into convenio values('08.708.980/0001-93','Amr Saúde');


-- Insert Tipo --
select * from tipo;
insert into tipo values (default,'Tórax');
insert into tipo values (default,'Abdómen');
insert into tipo values (default,'Coluna');
insert into tipo values (default,'Ombro');
insert into tipo values (default,'Bacia');
insert into tipo values (default,'Joelho');
insert into tipo values (default,'Outros');


-- Inser Funcionário --
select * from funcionario;
insert into Funcionario  values ('Tana Randolph','637523689','(83)99124-6259','P.O. Box 428, 8483 Non Avenue','1633092782099');
insert into Funcionario  values ('Adam Mccray','152484192','(83)99663-2668','Ap #214-5849 Eleifend Av.','1679070298499');
insert into Funcionario  values ('Ralph Moses','347715070','(83)99913-3932','P.O. Box 753, 4858 Mi Road','1673013046199');
insert into Funcionario  values ('Carl Bell','605660224','(83)99173-8341','Ap #176-8028 Pede. Avenue','1686031094099');
insert into Funcionario  values ('Caesar Rivera','736192006','(83)98853-5233','9431 Magna. St.','1676010547199');
insert into Funcionario  values ('Gannon Cleveland','633043336','(83)98745-4436','8321 Ac Road','1666101470099');
insert into Funcionario  values ('Henry William','213822877','(83)99125-5986','P.O. Box 781, 9820 Magna Av.','1612051467599');
insert into Funcionario  values ('Susan Reilly','224319418','(83)98718-7741','239-7107 Lorem. St.','1655012984799');
insert into Funcionario  values ('Mary Warren','444357453','','515-9199 Purus Rd.','1636040797199');
insert into Funcionario  values ('Ali Hubbard','336665294','(83)98880-7081','P.O. Box 419, 3875 At, Avenue','1645032953899');


-- Insert Médico --
select * from medico;
DO $$
DECLARE 
	funcs CURSOR for select * from funcionario;
	i integer;
	crmStart integer;
BEGIN
	i = 1;
	crmStart = 6356;
 	FOR f IN funcs LOOP
		if (i = 6) then
			return;
		end if;
		insert into Medico values(to_char(crmStart + i, '9999'), f.matricula);
		i = i + 1;
	END LOOP;
END$$;


-- Insert Radiologista --
select * from radiologista;
DO $$
DECLARE 
	funcs CURSOR for select * from funcionario;
	i integer;
	crtrStart integer;
BEGIN
	i = 1;
	crtrStart = 1252;
 	FOR f IN funcs LOOP
		if (i >= 6) then
			insert into Radiologista values(to_char(crtrStart + i, '9999'), f.matricula);
		end if;
		i = i + 1;
	END LOOP;
END$$;


-- Insert Paciente --
insert into Paciente (codigo,cpf,endereço,telefone,nome) values (default,'1655031414299','398-3440 Varius. Street','(83)98780-7811','Dalton Rodgers');
insert into Paciente (codigo,cpf,endereço,telefone,nome) values (default,'1630052278899','9638 Aliquam St.','(83)99972-1623','Dominic Guerrero');
insert into Paciente (codigo,cpf,endereço,telefone,nome) values (default,'1607031950199','932-209 Fringilla. Av.','(83)98790-0180','Sarah Serrano');
insert into Paciente (codigo,cpf,endereço,telefone,nome) values (default,'1640010705999','335-9808 Mattis St.','(83)98793-1956','Timothy Brock');
insert into Paciente (codigo,cpf,endereço,telefone,nome) values (default,'1605122621099','Ap #842-2733 Nulla St.','(83)98714-6069','Sade Hebert');
insert into Paciente (codigo,cpf,endereço,telefone,nome) values (default,'1630080161299','7907 Metus Ave','(83)99667-0041','Rogan May');
insert into Paciente (codigo,cpf,endereço,telefone,nome) values (default,'1679012419999','3512 Morbi St.','(83)98873-2538','Sydney Nguyen');
insert into Paciente (codigo,cpf,endereço,telefone,nome) values (default,'1619040878799','739-7159 In St.','(83)99922-3588','Emily Vargas');
insert into Paciente (codigo,cpf,endereço,telefone,nome) values (default,'1673020970899','P.O. Box 217, 2734 Sed Rd.','(83)98715-9862','David Morrow');
insert into Paciente (codigo,cpf,endereço,telefone,nome) values (default,'1601021273999','P.O. Box 191, 7128 Mauris Road','(83)99950-1249','Mufutau Thompson');
insert into Paciente (codigo,cpf,endereço,telefone,nome) values (default,'1633060432799','2325 Massa Rd.','(83)99134-1440','Eleanor Cote');
insert into Paciente (codigo,cpf,endereço,telefone,nome) values (default,'1694032888199','P.O. Box 983, 2434 Dui Ave','(83)98757-0926','Kamal Becker');
insert into Paciente (codigo,cpf,endereço,telefone,nome) values (default,'1617080930799','P.O. Box 994, 5448 Sed St.','(83)99650-4076','Steel Quinn');
insert into Paciente (codigo,cpf,endereço,telefone,nome) values (default,'1684120689399','3824 Nisl. Road','(83)98732-4796','Gisela Best');
insert into Paciente (codigo,cpf,endereço,telefone,nome) values (default,'1607030880199','868-1712 Ornare Road','(83)99962-4791','Todd Knapp');
insert into Paciente (codigo,cpf,endereço,telefone,nome) values (default,'1661011604799','8532 Quisque St.','(83)98797-6645','Jescie Garner');
insert into Paciente (codigo,cpf,endereço,telefone,nome) values (default,'1650082581099','Ap #327-6524 Phasellus Street','(83)99145-5141','Xyla Owens');
insert into Paciente (codigo,cpf,endereço,telefone,nome) values (default,'1632042617599','6994 Libero. Road','(83)98711-6179','Amena Whitfield');
insert into Paciente (codigo,cpf,endereço,telefone,nome) values (default,'1619050854599','379-6279 Fermentum Street','(83)98828-1565','Winter Hogan');
insert into Paciente (codigo,cpf,endereço,telefone,nome) values (default,'1696102789199','Ap #250-8952 Interdum Ave','(83)99184-0399','Belle Orr');

select * from paciente;
select * from convenio;

DO $$
DECLARE 
	convs CURSOR for select * from convenio;
	pacs  CURSOR for select * from paciente;
	x convenio%rowtype;
	random integer;
BEGIN
	Open convs;
	FOR pac in pacs LOOP
		SELECT floor(random() * 5 + 1)::int into random;
		fetch ABSOLUTE random FROM convs into x;
		update paciente set convenio = x.cnpj
		where codigo = pac.codigo;
	END LOOP;
END$$;

select p.nome, c.nome from paciente p join convenio c
on p.convenio = c.cnpj;

-- Insert Consulta --
select * from consulta;
select * from medico;
select * from paciente;

insert into consulta values ('2018-05-10', '637523689', 1);
insert into consulta values ('2018-05-10', '637523689', 2);
insert into consulta values ('2018-05-11', '637523689', 3);
insert into consulta values ('2018-05-11', '637523689', 4);
insert into consulta values ('2018-05-12', '637523689', 5);
insert into consulta values ('2018-05-10', '152484192', 6);
insert into consulta values ('2018-05-10', '152484192', 7);
insert into consulta values ('2018-05-11', '152484192', 8);
insert into consulta values ('2018-05-11', '152484192', 9);
insert into consulta values ('2018-05-12', '152484192', 10);
insert into consulta values ('2018-05-15', '347715070', 11);
insert into consulta values ('2018-05-16', '347715070', 12);
insert into consulta values ('2018-05-16', '347715070', 13);
insert into consulta values ('2018-05-17', '347715070', 14);
insert into consulta values ('2018-05-18', '605660224', 15);
insert into consulta values ('2018-05-18', '605660224', 16);
insert into consulta values ('2018-05-19', '605660224', 17);
insert into consulta values ('2018-05-19', '736192006', 18);
insert into consulta values ('2018-05-19', '736192006', 19);
insert into consulta values ('2018-05-20', '736192006', 20);


-- Insert Radiografia --
select * from radiografia;
select * from radiologista;
select * from tipo;

insert into radiografia values (default, '2018-05-13', 'imagem01.png', '633043336', 1);
insert into radiografia values (default, '2018-05-13', 'imagem02.png', '633043336', 1);
insert into radiografia values (default, '2018-05-13', 'imagem03.png', '633043336', 2);
insert into radiografia values (default, '2018-05-13', 'imagem04.png', '213822877', 2);
insert into radiografia values (default, '2018-05-13', 'imagem05.png', '213822877', 3);
insert into radiografia values (default, '2018-05-15', 'imagem06.png', '224319418', 4);
insert into radiografia values (default, '2018-05-15', 'imagem07.png', '224319418', 1);
insert into radiografia values (default, '2018-05-15', 'imagem08.png', '224319418', 3);
insert into radiografia values (default, '2018-05-15', 'imagem09.png', '444357453', 3);
insert into radiografia values (default, '2018-05-15', 'imagem10.png', '444357453', 5);
insert into radiografia values (default, '2018-05-16', 'imagem11.png', '336665294', 6);
insert into radiografia values (default, '2018-05-16', 'imagem12.png', '336665294', 6);
insert into radiografia values (default, '2018-05-16', 'imagem13.png', '336665294', 6);
insert into radiografia values (default, '2018-05-16', 'imagem14.png', '336665294', 6);
insert into radiografia values (default, '2018-05-17', 'imagem15.png', '213822877', 5);
insert into radiografia values (default, '2018-05-17', 'imagem16.png', '213822877', 5);
insert into radiografia values (default, '2018-05-17', 'imagem17.png', '444357453', 1);
insert into radiografia values (default, '2018-05-17', 'imagem18.png', '444357453', 1);
insert into radiografia values (default, '2018-05-18', 'imagem19.png', '444357453', 2);
insert into radiografia values (default, '2018-05-18', 'imagem20.png', '444357453', 2);

-- Insert Resultado_Analisa --

select * from resultado_analisa;
select * from medico;
select * from radiografia;

DO $$
DECLARE 
	radios CURSOR for select * from radiografia;
	meds  CURSOR for select * from medico;
	x medico%rowtype;
	random integer;
BEGIN
	Open meds;
	FOR radio in radios LOOP
		SELECT floor(random() * 5 + 1)::int into random;
		fetch ABSOLUTE random FROM meds into x;
		insert into resultado_analisa values (default,'Resultado da consulta:',radio.data,x.f_matricula,radio.codigo);
	END LOOP;
END$$;




