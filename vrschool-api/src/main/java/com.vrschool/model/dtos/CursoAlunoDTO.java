package com.vrschool.model.dtos;

import lombok.Data;

@Data
public class CursoAlunoDTO {
    private Long codigo;
    private Long codigoAluno;
    private Long codigoCurso;

    public CursoAlunoDTO(Long codigo, Long codigoAluno, Long codigoCurso) {
        this.codigo = codigo;
        this.codigoAluno = codigoAluno;
        this.codigoCurso = codigoCurso;
    }
}