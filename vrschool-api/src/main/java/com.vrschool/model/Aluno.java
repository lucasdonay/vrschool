package com.vrschool.model;

import lombok.*;

import javax.persistence.*;

@Table(name="aluno")
@Entity(name="aluno")
@Data
@EqualsAndHashCode(of="codigo")
public class Aluno {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long codigo;
    private String nome;
}