-- Trigger para View de Inserção
create or replace function inserirView() returns trigger as $$
DECLARE
	matmed varchar;
	paciente integer;
	error integer;
BEGIN
	error := 1;
	select codigo into strict paciente from Paciente where nome = new.paciente;
	error := 2;
	select matricula into strict matmed From Funcionario where nome = new.medico;
	insert into Consulta(data, matmed, codpac) values (current_date, matmed, paciente);
	return null;
	EXCEPTION
		WHEN no_data_found THEN
			if (error = 1) THEN
				raise notice 'Error: 000%', error;
				raise notice 'Paciente não encontrado.';
				return null;
			else
				raise notice 'Error: 000%', error;
				raise notice 'Médico não cadastrado.';
				return null;
			end if;
END;
$$ language 'plpgsql';

CREATE TRIGGER triggerConsulta instead of insert ON detalhesconsulta
for each row
execute procedure inserirview();
-- Teste do Trigger
insert into detalhesconsulta(data, paciente, medico) values (current_date, 'Teste', 'Adam Mccray');
insert into detalhesconsulta(data, paciente, medico) values (current_date, 'Dalton Rodgers', 'Teste');
insert into detalhesconsulta(data, paciente, medico) values (current_date, 'Dalton Rodgers', 'Adam Mccray');

select * from detalhesConsulta;


-- Trigger Para Log de radiografia
create table lograd (
	usuario		varchar,
	data		date,
	operacao	varchar);

create or replace function inserirlograd() returns trigger as $$
DECLARE
	user varchar default current_user;
BEGIN
	insert into lograd values (user, current_date, TG_OP);
	return new;
END;
$$ language 'plpgsql';

create trigger logradTrigger before update or delete or insert ON Radiografia
for each row
execute procedure inserirlograd();
-- Teste do Trigger
select * from lograd;
insert into radiografia values (default, '2018-05-22', 'imagem21.png', '444357453', 4, 20);
select * from lograd;
select * from radiografia;

-- Trigger para Validação de horário em Radiografia
create or replace function validarHorarioRad() returns trigger as $$
DECLARE
	horario integer;
	horarioatual varchar;
BEGIN
	horario := Extract(hour from current_time);
	if (horario > 18) THEN
		raise exception 'Expediente finalizado.';
	end if;
	return new;
	EXCEPTION
		WHEN raise_exception THEN
			horarioatual := TO_CHAR(now(), 'hh24:mi:ss');
			raise notice 'São %, expediente finalizado.', horarioatual;
			return null;
END;
$$ language 'plpgsql';

create trigger HorarioRadTrigger before insert or update or delete ON Radiografia
for each row
execute procedure validarhorariorad();
-- Teste do Trigger
insert into radiografia values (default, '2018-05-22', 'imagem22.png', '444357453', 1, 20);