package com.vrschool.repository;

import java.util.Optional;

import com.vrschool.model.Aluno;
import com.vrschool.model.Curso;
import com.vrschool.model.CursoAluno;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CursoAlunoRepository extends JpaRepository<CursoAluno, Long> {

    Optional<CursoAluno> findByAlunoCodigoAndCursoCodigo(Long codigoAluno, Long codigoCurso);

    void deleteByAlunoCodigoAndCursoCodigo(Long codigoAluno, Long codigoCurso);

    boolean existsByAluno(Aluno aluno);

    boolean existsByCurso(Curso curso);
}