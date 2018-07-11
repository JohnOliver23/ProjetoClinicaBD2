-- Consultas

-- 01 Exibir Pacientes e os nome dos médicos que os atenderam

select p.nome Paciente , f.nome Médico, c.data DataConsulta 
from consulta c JOIN funcionario f
ON c.matmed = f.matricula
JOIN paciente p ON c.codpac = p.codigo 

-- 02 Exibir Paciente e resultados da radiografia e sua data
select p.nome Paciente , r.descricao Resultado, c.data DataConsulta 


select * from resultado_analisa
select * from radiografia
select * from consulta

-- 03 Exibir Nome e Cnpj dos Convênios

select nome, cnpj from convenio

-- 04 Exibir nome dos pacientes e seus convênios

select p.nome Paciente, c.nome Convênio
from paciente p JOIN convenio c 
ON p.convenio = c.cnpj

-- 05 Exibir quantidade de consultas realizados por cada Médico e seu CRM

select f.Nome Medico, m.crm CRM, count(*) Quantidade
from consulta c join medico m
ON c.matmed = m.f_matricula JOIN
funcionario f ON m.f_matricula = f.matricula
GROUP BY f.nome, m.crm

-- 06 Exibir a quantidade de radiografia realizadas por cada Radiologista e seu CRTR

select f.Nome Radiologista, r.crtr CTRT, count(*) Quantidade
from radiografia ra join radiologista r
ON ra.matrad = r.f_matricula JOIN
funcionario f ON r.f_matricula = f.matricula
GROUP BY f.nome, r.crtr

-- 07 Exibir Radiografias com sua data e tipo

select t.descricao TipoRad, r.data
from radiografia r JOIN tipo t ON
r.codtipo = t.codigo

-- 08


