package com.vrschool.model;

import lombok.*;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

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