/* Lógico_1: */

CREATE TABLE Paciente (
    Codigo serial 	PRIMARY KEY not null,
    CPF 		VARCHAR not null,
    Endereço 		VARCHAR null,
    Telefone 		VARCHAR null,
    Nome 		VARCHAR not null,
    Convenio 		VARCHAR null
);

CREATE TABLE Funcionario (
    Nome 		VARCHAR not null,
    Matricula 		VARCHAR PRIMARY KEY not null,
    Telefone 		VARCHAR null,
    Endereço 		VARCHAR null,
    CPF 		VARCHAR not null
);

CREATE TABLE Medico (
    CRM 	VARCHAR not null,
    F_Matricula VARCHAR PRIMARY KEY not null
);

CREATE TABLE Consulta (
    codigo 	serial PRIMARY KEY not null,
    Data 	DATE not null,
    MatMed 	VARCHAR not null,
    CodPac 	INTEGER not null
);

CREATE TABLE Radiografia (
    Codigo 	serial PRIMARY KEY not null,
    Data 	DATE not null,
    Imagem 	VARCHAR not null,
    MatRad 	VARCHAR null,
    CodTipo 	INTEGER null,
    CodConsulta INTEGER not null
);

CREATE TABLE Convenio (
    CNPJ VARCHAR PRIMARY KEY not null,
    Nome VARCHAR not null
);

CREATE TABLE Resultado_Analisa (
    Codigo	serial PRIMARY KEY not null,
    Descricao	VARCHAR null,
    Data	DATE not null,
    MatMed	VARCHAR not null,
    CodRad	INTEGER not null
);

CREATE TABLE Tipo (
    Codigo	serial PRIMARY KEY not null,
    Descricao	VARCHAR not null
);


CREATE TABLE Radiologista (
    CRTR 	VARCHAR not null,
    F_Matricula VARCHAR PRIMARY KEY not null
);
 
ALTER TABLE Paciente ADD CONSTRAINT FK_Paciente_1
    FOREIGN KEY (Convenio)
    REFERENCES Convenio (CNPJ)
    ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE Paciente ADD CONSTRAINT Un_Paciente
    UNIQUE (cpf);

ALTER TABLE Funcionario ADD CONSTRAINT Un_funcionario
    UNIQUE (cpf);
     
ALTER TABLE Medico ADD CONSTRAINT FK_Medico_1
    FOREIGN KEY (F_Matricula)
    REFERENCES Funcionario (Matricula)
    ON DELETE CASCADE ON UPDATE CASCADE;
 
ALTER TABLE Consulta ADD CONSTRAINT FK__Consulta_0
    FOREIGN KEY (MatMed)
    REFERENCES Medico (F_Matricula);
 
ALTER TABLE Consulta ADD CONSTRAINT FK__Consulta_1
    FOREIGN KEY (CodPac)
    REFERENCES Paciente (Codigo);
 
ALTER TABLE Radiografia ADD CONSTRAINT FK_Radiografia_1
    FOREIGN KEY (MatRad)
    REFERENCES Radiologista (F_Matricula)
    ON DELETE CASCADE ON UPDATE CASCADE;
	
ALTER TABLE Radiografia ADD CONSTRAINT FK_Radiografia_2
    FOREIGN KEY (CodTipo)
    REFERENCES Tipo (Codigo)
    ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE Radiografia ADD CONSTRAINT FK_Radiografia_3
    FOREIGN KEY (CodConsulta)
    REFERENCES Consulta (codigo)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
ALTER TABLE Resultado_Analisa ADD CONSTRAINT FK_Resultado_Analisa_1
    FOREIGN KEY (MatMed)
    REFERENCES Medico (F_Matricula);
 
ALTER TABLE Resultado_Analisa ADD CONSTRAINT FK_Resultado_Analisa_2
    FOREIGN KEY (CodRad)
    REFERENCES Radiografia (Codigo);
 
ALTER TABLE Radiologista ADD CONSTRAINT FK_Radiologista_1
    FOREIGN KEY (F_Matricula)
    REFERENCES Funcionario (Matricula)
    ON DELETE CASCADE ON UPDATE CASCADE; 
	
ALTER DATABASE "Clinica" OWNER TO adm
