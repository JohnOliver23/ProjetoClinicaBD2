CREATE OR REPLACE VIEW ExameSolicitado AS
Select p.nome Paciente, f.nome Médico, t.descricao, a.descricao AS Exame
FROM funcionario f JOIN medico m ON f.matricula = m.f_matricula
JOIN consulta c ON c.matmed = m.f_matricula
JOIN paciente p ON p.codigo = c.codpac
JOIN radiografia r ON r.codconsulta = c.codigo
JOIN tipo t ON t.codigo = r.codtipo
JOIN resultado_analisa a ON r.codigo = a.codrad
ORDER BY p.nome;

select * from examesolicitado