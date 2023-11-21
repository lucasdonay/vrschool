package com.vrschool.model.dtos;

import lombok.Data;

@Data
public class CursoDTO {
    private Long codigo;
    private String descricao;
    private String ementa;

    public CursoDTO(Long codigo, String descricao, String ementa) {
        this.codigo = codigo;
        this.descricao = descricao;
        this.ementa = ementa;
    }
}