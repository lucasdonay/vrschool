
## <a name="what-is-this-api">📋 Introdução à API da Escola</a>

<h3>‎Recursos Principais: </h3>

**Alunos:**

**GET vrschool-api/alunos** => Retorna todos os alunos e o curso matriculado, caso não tenha retorna null.
<br>
**POST vrschool-api/alunos** => Cria um aluno passando apenas o nome.
<br>
**PUT vrschool-api/alunos/codigo** => Edita um aluno passando o codigo e o novo nome.
<br>
**DELETE vrschool-api/alunos/codigo** => Deleta um aluno passando o codigo,  mas pra deletar o aluno não pode estar vinculado em nenhum curso.

**Cursos:**

**GET vrschool-api/cursos** => Retorna todos os cursos criados,
<br>
**POST vrschool-api/cursos** => Cria um curso passando descricao e ementa do curso.
<br>
**PUT vrschool-api/cursos/codigo** => Edita um curso passando o codigo e descricao ou ementa que queira atualizar.
<br>
**DELETE vrschool-api/cursos/codigo** => Deleta um curso passando o codigo, mas pra deletar o curso não pode estar vinculado em nenhum aluno.

**Matriculas:**

**POST vrschool-api/curso-aluno** => Cria uma matricula passando o codigo do curso e codigo do aluno.
<br>
**DELETE vrschool-api/cursos-aluno/excluir-associacao** => Deleta a matricula criada passando o codigo do aluno.
<br>

## <a name="installation">🔨 Installation</a>
Versão java: **17**
<br>
Versão Spring Boot: **2.7.17**

Pra rodar o backend é necessário usar o sdk do Java 17 e ter o maven instalado para instalar as dependencias.

Observações:
```bash
# Tem uma migration que vai ser rodada ao startar a aplicação e criar as tabelas usando a query abaixo.
# A migration esta sendo usada pra controle de versão do banco de dados.

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

```

Não sendo necessário a criação do banco de dados manualmente, pois ele está hospedaddo no https://api.elephantsql.com/

## <a name="build">🚀 Build</a>

Para executar a aplicação basta digitar no terminal :

```bash
# Build the app
mvn spring-boot:run

```
## <a name="license">©️ License</a>

Este projeto foi criado para teste prático.

