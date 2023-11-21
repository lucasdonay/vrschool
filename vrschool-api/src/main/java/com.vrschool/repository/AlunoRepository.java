package com.vrschool.repository;

import com.vrschool.model.Aluno;
import com.vrschool.model.dtos.AlunoDTOWithMatricula;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AlunoRepository extends JpaRepository<Aluno, Long> {
    @Query(value = "SELECT a.codigo as codigo, a.nome as nome, c.descricao as cursoDescricao " +
            "FROM aluno a " +
            "LEFT JOIN curso_aluno ca ON a.codigo = ca.codigo_aluno " +
            "LEFT JOIN curso c ON ca.codigo_curso = c.codigo", nativeQuery = true)
    List<AlunoDTOWithMatricula> listarAlunos();
}