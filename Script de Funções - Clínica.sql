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

-- 02 Verificar exame pelo CPF

CREATE OR REPLACE FUNCTION consultaCPF(cpf_input paciente.cpf%type)
RETURNS RECORD AS $$
DECLARE
	cst RECORD;
BEGIN
	select e.Paciente, e.Médico, e.descricao, e.Exame 
	into strict cst from
	examesolicitado e JOIN paciente p 
	ON e.paciente = p.nome
	WHERE p.cpf = cpf_input;
	return cst;
Exception
	when no_data_found then
		raise notice 'CPF não encontrado, CPF: %', cpf_input;
		return null;
	when others then
		raise notice 'Um erro aconteceu';
		raise notice 'Código do erro: %', SQLSTATE;
		raise Notice 'Mensagem: %', SQLERRM;
		return null;
END;
$$ LANGUAGE plpgsql;

select  consultaCPF('165503141429');

-- 03 Quantidade de radiografias feitas de determinado tipo

CREATE OR REPLACE FUNCTION checkRad(tipo_rad tipo.descricao%type)
RETURNS integer AS $$
DECLARE
	quant integer;
BEGIN
	select count(*) into quant from tipo t JOIN radiografia r
	ON t.codigo = r.codtipo
	WHERE upper(retira_acentuacao(t.descricao)) = upper(retira_acentuacao(tipo_rad));
	return quant;
END;
$$ LANGUAGE plpgsql;

select checkRad('Tórax');

-- 04 Quantos pacientes por Convênio
create or replace function quantPacientes(convenio_input varchar) returns integer AS $$
DECLARE
	total integer;
BEGIN
	select count(*), c.cnpj into strict total FROM Convenio c
	join Paciente p ON c.cnpj = p.convenio
	WHERE c.nome = convenio_input
	group by c.cnpj;
	return total;
	EXCEPTION
		WHEN no_data_found THEN
			Raise notice 'O convenio % não existe', convenio_input;
			return -1;
		WHEN OTHERS THEN
			raise notice 'Error: %', SQLSTATE;
			raise notice 'Message: %', SQLERRM;
			return -1;
END;
$$ language 'plpgsql';

select quantPacientes('Amil Saúde');


-- Função encontrada na internet para a remoção de acentos de texto.
-- URL: http://paposql.blogspot.com/2011/12/retirando-acentuacao-no-postgresql.html
 CREATE OR REPLACE FUNCTION retira_acentuacao(p_texto text)  
  RETURNS text AS  
 $BODY$  
 Select translate($1,  
 'áàâãäåaaaÁÂÃÄÅAAAÀéèêëeeeeeEEEÉEEÈìíîïìiiiÌÍÎÏÌIIIóôõöoooòÒÓÔÕÖOOOùúûüuuuuÙÚÛÜUUUUçÇñÑýÝ',  
 'aaaaaaaaaAAAAAAAAAeeeeeeeeeEEEEEEEiiiiiiiiIIIIIIIIooooooooOOOOOOOOuuuuuuuuUUUUUUUUcCnNyY'   
  );  
 $BODY$  
 LANGUAGE sql VOLATILE  
 COST 100;  
