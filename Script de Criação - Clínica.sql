/* Lógico_1: */

CREATE TABLE Paciente (
    Codigo serial PRIMARY KEY,
	CPF VARCHAR,
    Endereço VARCHAR,
    Telefone VARCHAR,
    Nome VARCHAR,
    Convenio VARCHAR
);

CREATE TABLE Funcionario (
    Nome VARCHAR,
    Matricula VARCHAR PRIMARY KEY,
    Telefone VARCHAR,
    Endereço VARCHAR,
    CPF VARCHAR
);

CREATE TABLE Medico (
    CRM VARCHAR,
    F_Matricula VARCHAR PRIMARY KEY
);

CREATE TABLE Consulta (
    Data DATE,
    MatMed VARCHAR,
    CodPac INTEGER
);

CREATE TABLE Radiografia (
    Codigo serial PRIMARY KEY,
    Data DATE,
    Imagem VARCHAR,
    MatRad VARCHAR,
	CodTipo INTEGER
);

CREATE TABLE Convenio (
    CNPJ VARCHAR PRIMARY KEY,
    Nome VARCHAR
);

CREATE TABLE Resultado_Analisa (
    Codigo serial PRIMARY KEY,
    Descricao VARCHAR,
    Data DATE,
    MatMed VARCHAR,
    CodRad INTEGER
);

CREATE TABLE Tipo (
    Codigo serial PRIMARY KEY,
    Descricao VARCHAR
);


CREATE TABLE Radiologista (
    CRTR VARCHAR,
    F_Matricula VARCHAR PRIMARY KEY
);
 
ALTER TABLE Paciente ADD CONSTRAINT FK_Paciente_1
    FOREIGN KEY (Convenio)
    REFERENCES Convenio (CNPJ)
    ON DELETE SET NULL ON UPDATE CASCADE;
 
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
