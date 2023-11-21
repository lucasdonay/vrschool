package com.vrschool.model.dtos;

import lombok.Data;

@Data
public class AlunoDTO {
    private Long codigo;
    private String nome;
    private String cursoDescricao;

    // Construtor
    // Construtor
    public AlunoDTO(Long codigo, String nome) {
         this.cursoDescricao = null;
    }

    public void setCursoDescricao(String cursoDescricao) {
        this.cursoDescricao = cursoDescricao;
    }
}