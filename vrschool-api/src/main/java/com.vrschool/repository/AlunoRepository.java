package com.vrschool.repository;

import com.vrschool.model.Aluno;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AlunoRepository extends JpaRepository<Aluno, Long> {
    @Query("SELECT ca.curso.descricao FROM CursoAluno ca WHERE ca.aluno.codigo = :alunoId")
    String findNomeCursoByAlunoId(@Param("alunoId") Long alunoId);
}