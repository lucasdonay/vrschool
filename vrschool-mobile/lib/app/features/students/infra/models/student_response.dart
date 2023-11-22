
class AlunoResponse {
  final int codigo;
  String nome;
  String cursoDescricao;

  AlunoResponse({
    required this.codigo,
    required this.nome,
    required this.cursoDescricao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'codigo': codigo,
      'nome': nome,
      'cursoDescricao': cursoDescricao,
    };
  }

  factory AlunoResponse.fromMap(Map<String, dynamic> map) {

    return AlunoResponse(
      codigo: (map['codigo'] ?? 0) as int,
      nome: (map['nome'] ?? '') as String,
      cursoDescricao: (map['cursoDescricao'] ?? '') as String,
    );
  }
}