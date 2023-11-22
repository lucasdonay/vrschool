package com.vrschool.model.dtos;

import lombok.Data;

import lombok.AllArgsConstructor;
@Data
@AllArgsConstructor
public class AlunoDTOWithMatricula {
    private Long codigo;
    private String nome;
    private String cursoDescricao;
}