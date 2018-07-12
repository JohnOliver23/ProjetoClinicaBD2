select * from detalhesConsulta;

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