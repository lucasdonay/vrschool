package com.vrschool.model.dtos;

import lombok.Data;

@Data
public class AlunoDTOWithMatricula {
    private AlunoDTO aluno;
    private String cursoDescricao;

    // Construtor
    public AlunoDTOWithMatricula(Long codigoAluno, String nomeAluno, String cursoDescricao) {
        this.aluno = new AlunoDTO(codigoAluno, nomeAluno);
        this.cursoDescricao = cursoDescricao;
    }
}