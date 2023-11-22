package com.vrschool.model;

import lombok.*;

import javax.persistence.*;

@Table(name="aluno")
@Data
@EqualsAndHashCode(of="codigo")
@Entity(name="Aluno")
public class Aluno {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long codigo;
    private String nome;
}