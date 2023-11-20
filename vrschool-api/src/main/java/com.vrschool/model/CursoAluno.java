package com.vrschool.model;

import io.swagger.annotations.ApiModel;
import lombok.*;

import javax.persistence.*;

@ApiModel(description = "Informações sobre a relação entre Aluno e Curso")
@Entity(name = "curso_aluno")
@Table(name = "curso_aluno")
@Data
@EqualsAndHashCode(of = "codigo")
public class CursoAluno {
    // Se necessário, adicione @ApiModelProperty para campos específicos
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long codigo;

    @ManyToOne
    @JoinColumn(name = "codigo_aluno")
    private Aluno aluno;

    @ManyToOne
    @JoinColumn(name = "codigo_curso")
    private Curso curso;
}