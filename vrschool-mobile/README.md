
## <a name="what-is-this-api">📋 Introdução ao Projeto Mobile Flutter</a>

<h3>‎Recursos Principais: </h3>

**Aba Home:**

- Visualizar cards alunos :
  <br>
⠀- Editar aluno
     <br>
⠀- Deletar Aluno
      <br>⠀- Criar Aluno caso não tenha nenhum card criado
      <br>
- Visualizar cards cursos:<BR>
 ⠀- Criar Curso caso não tenha nenhum card criado
<BR>⠀- Editar curso
<br>⠀- Deletar curso

**Aba Alunos:**

- Acesso aos cards alunos :
<br> ⠀- Editar aluno<br>
⠀- Deletar Aluno
      <br> ⠀- Matricular Aluno
   <br>
⠀- Criar aluno
<br>⠀- Pesquisar alunos na lista
<br>

**Aba cursos:**

- Acesso aos cards cursos :
<br>- Criar curso
<br>- Editar curso
     <br>- Deletar curso
<br>- Pesquisar cursos na lista
<br>



## <a name="installation">🔨 Installation</a>
Versão flutter: **3.16.0**
<br>
sdk: **>=2.19.6 <3.0.0**


<br>
 Pra rodar a aplicação é necessário usar as versões informadas acima.
<br>
Projeto foi criado dando suporte as plataformas android kotlin e ios swift.

```bash
# Comandos pra iniciar a aplicação:

   1- flutter clean
   
   2- flutter pub get
   
   3- flutter packages pub run build_runner build --delete-conflicting-outputs


```

Observações:

Ao abrir o projeto dentro da pasta lib/app/config existe o arquivo client.dart necessário colocar a url do servidor da aplicação backend em java.
```bash
# Trocar o _dio.options.baseUrl:

class Client {
  Dio init() {
    Dio _dio = Dio();
    _dio.options.baseUrl =
        "*URL DO SERVIDOR LOCALHOST GERADO NO BACKEND*/vrschool-api";
    _dio.options.sendTimeout = Duration(milliseconds: 60000);
    _dio.options.connectTimeout = Duration(milliseconds: 40000);
    _dio.options.receiveTimeout = Duration(milliseconds: 60000);
    return _dio;
  }
}


```


## <a name="build">🚀 Build</a>

Para executar a aplicação basta digitar no terminal :

```bash
# Usando terminal windowns pra build android
flutter run

# Usando terminal pra build ios
flutter build ios

# Gerar apk pra teste em device fisico
flutter build apk

```
Pode ser usado o android studio / Vscode também pra buildar a aplicação e testa-la criando um device emulador.
## <a name="license">©️ License</a>

Este projeto foi criado para teste prático.

