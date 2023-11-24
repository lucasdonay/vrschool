package com.vrschool.repository;

import java.util.List;
import java.util.Optional;

import com.vrschool.model.Aluno;
import com.vrschool.model.Curso;
import com.vrschool.model.CursoAluno;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CursoAlunoRepository extends JpaRepository<CursoAluno, Long> {

    List<CursoAluno> findByAlunoCodigo(Long codigoAluno);

    void deleteByAlunoCodigo(Long codigoAluno);
    boolean existsByAluno(Aluno aluno);

    boolean existsByCursoCodigo(Long codigoCurso);
    Optional<CursoAluno> findByAluno(Aluno aluno);

    boolean existsByCurso(Curso curso);
}