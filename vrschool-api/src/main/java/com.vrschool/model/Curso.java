package com.vrschool.model;

import lombok.*;

import javax.persistence.*;

@Table(name = "curso")
@Entity(name="curso")
@Data
@EqualsAndHashCode(of = "codigo")
public class Curso {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long codigo;

    private String descricao;

    private String ementa;
}