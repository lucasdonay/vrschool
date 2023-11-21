package com.vrschool.model.dtos;

import com.vrschool.model.Aluno;
import com.vrschool.model.Curso;
import lombok.Data;

@Data
public class CursoAlunoDTO {
    private Long codigo;
    private AlunoDTO aluno;
    private CursoDTO curso;

    public CursoAlunoDTO(Long codigo, AlunoDTO aluno, CursoDTO curso) {
        this.codigo = codigo;
        this.aluno = aluno;
        this.curso = curso;
    }
}