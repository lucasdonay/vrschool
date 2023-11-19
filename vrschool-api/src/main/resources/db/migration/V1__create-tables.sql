CREATE TABLE Aluno
(
    codigo SERIAL PRIMARY KEY,
    nome   VARCHAR(50)
);

CREATE TABLE Curso
(
    codigo    SERIAL PRIMARY KEY,
    descricao VARCHAR(50),
    ementa    TEXT
);

CREATE TABLE curso_aluno
(
    codigo       SERIAL PRIMARY KEY,
    codigo_aluno INTEGER REFERENCES Aluno (codigo),
    codigo_curso INTEGER REFERENCES Curso (codigo)
);



