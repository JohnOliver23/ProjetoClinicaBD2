-- Consultas

-- 01 Exibir Pacientes e os nome dos médicos que os atenderam

SELECT p.nome Paciente , f.nome Médico, c.data DataConsulta 
FROM consulta c JOIN funcionario f
ON c.matmed = f.matricula
JOIN paciente p ON c.codpac = p.codigo 

-- 02 Exibir Paciente com resultado e data da analise da radiografia
SELECT p.nome Paciente , a.descricao Resultado, a.data DataAnalise FROM
paciente p JOIN consulta c ON p.codigo = c.codpac
JOIN radiografia r ON c.codigo = r.codconsulta 
JOIN resultado_analisa a ON r.codigo = a.codrad;

-- 03 Exibir Nome e Cnpj dos Convênios

SELECT nome, cnpj FROM convenio

-- 04 Exibir nome dos pacientes e seus convênios

SELECT p.nome Paciente, c.nome Convênio
FROM paciente p JOIN convenio c 
ON p.convenio = c.cnpj

-- 05 Exibir quantidade de consultas realizados por cada Médico e seu CRM

SELECT f.Nome Medico, m.crm CRM, count(*) Quantidade
FROM consulta c JOIN medico m
ON c.matmed = m.f_matricula JOIN
funcionario f ON m.f_matricula = f.matricula
GROUP BY f.nome, m.crm

-- 06 Exibir a quantidade de radiografia realizadas por cada Radiologista e seu CRTR

SELECT f.Nome Radiologista, r.crtr CTRT, count(*) Quantidade
FROM radiografia ra JOIN radiologista r
ON ra.matrad = r.f_matricula JOIN
funcionario f ON r.f_matricula = f.matricula
GROUP BY f.nome, r.crtr

-- 07 Exibir Radiografias com sua data e tipo

SELECT t.descricao TipoRad, r.data
FROM radiografia r JOIN tipo t ON
r.codtipo = t.codigo

-- 08 Exibir resultados das Análises e médicos que realizaram.

SELECT a.descricao Resultado, f.nome Médico
FROM resultado_analisa a JOIN funcionario f 
ON a.matmed = f.matricula;

-- 09 Exibir Tipo, Data, Análise das radiografias e também data que foi feita a análise.

SELECT t.descricao radiografia, r.data, a.descricao Resultado, a.data
FROM radiografia r JOIN tipo t ON r.codtipo = t.codigo 
JOIN resultado_analisa a ON a.codrad = r.codigo;

-- 10 Quantidade de Análises feitas por cada médico

SELECT f.Nome Medico, m.crm CRM, count(*) Quantidade
FROM resultado_analisa a JOIN medico m
ON a.matmed = m.f_matricula JOIN
funcionario f ON m.f_matricula = f.matricula
GROUP BY f.nome, m.crm

