-- Views

--01 Pacientes que possuem exames solicitados
CREATE OR REPLACE VIEW exameSolicitado AS
Select p.nome Paciente, f.nome Médico, t.descricao, a.descricao AS Exame
FROM funcionario f JOIN medico m ON f.matricula = m.f_matricula
JOIN consulta c ON c.matmed = m.f_matricula
JOIN paciente p ON p.codigo = c.codpac
JOIN radiografia r ON r.codconsulta = c.codigo
JOIN tipo t ON t.codigo = r.codtipo
JOIN resultado_analisa a ON r.codigo = a.codrad
ORDER BY p.nome;

select * from examesolicitado

--02 Exibe detalhes da radiografia
create VIEW detalhesRadiografia (data, imagem, Radiografia, Radiologista) AS
select r.data, r.imagem, t.descricao, f.nome from radiografia r
JOIN tipo t ON r.codtipo = t.codigo
JOIN Radiologista ra ON r.matrad = ra.f_matricula
JOIN Funcionario f ON f.matricula = ra.f_matricula
ORDER BY r.data;

select * from detalhesRadiografia;

-- View de Inserção
CREATE OR REPLACE VIEW detalhesConsulta(codigo, data, paciente, medico) AS
select c.codigo, c.data, p.nome, f.nome from consulta c
JOIN paciente p ON c.codpac = p.codigo
JOIN medico m ON c.matmed = m.f_matricula
JOIN funcionario f ON m.f_matricula = f.matricula
ORDER BY c.codigo;

select * from detalhesConsulta;
