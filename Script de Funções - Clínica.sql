-- Funções

-- 01 Quantidades de Consultas realizados por um dado médico

create or replace function checkConsultas(mat medico.f_matricula%type)  
returns integer AS $$
Declare
	quant integer;
Begin
	select count(*), m.crm into strict quant
	from medico m JOIN consulta c ON
	c.matmed = m.f_matricula
	where m.f_matricula = mat
	group by m.crm;
	return quant;
Exception
	when no_data_found then
		raise notice 'Médico não encontrado, Mat: %', mat;
		return -1;
	when others then
		raise notice 'Um erro aconteceu';
		raise notice 'Código do erro: %', SQLSTATE;
		raise Notice 'Mensagem: %', SQLERRM;
		return -1;
End;
$$ LANGUAGE plpgsql;


select checkConsultas('63752389');

