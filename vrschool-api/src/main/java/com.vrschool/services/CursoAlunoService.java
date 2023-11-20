package com.vrschool.services;

import com.vrschool.model.Aluno;
import com.vrschool.model.Curso;
import com.vrschool.model.CursoAluno;
import com.vrschool.repository.AlunoRepository;
import com.vrschool.repository.CursoAlunoRepository;
import com.vrschool.repository.CursoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Optional;

@Service
public class CursoAlunoService {

    @Autowired
    private CursoAlunoRepository cursoAlunoRepository;

    @Autowired
    private CursoRepository cursoRepository;

    @Autowired
    private AlunoRepository alunoRepository;
    public ResponseEntity<String> associarAlunoCurso(Long codigoAluno, Long codigoCurso) {

        Optional<Aluno> optionalAluno = alunoRepository.findById(codigoAluno);
        Optional<Curso> optionalCurso = cursoRepository.findById(codigoCurso);

        if (optionalAluno.isPresent() && optionalCurso.isPresent()) {
            CursoAluno cursoAluno = new CursoAluno();
            cursoAluno.setAluno(alunoRepository.findById(codigoAluno).orElse(null));
            cursoAluno.setCurso(cursoRepository.findById(codigoCurso).orElse(null));
            cursoAlunoRepository.save(cursoAluno);
            return new ResponseEntity<>("Associação criada com sucesso!", HttpStatus.CREATED);
        } else {
            return new ResponseEntity<>("Aluno ou curso não encontrado", HttpStatus.NOT_FOUND);
        }

    }

    @Transactional
    public ResponseEntity<String> excluirAssociacao(Long codigoAluno, Long codigoCurso) {
        Optional<CursoAluno> optionalAssociacao = cursoAlunoRepository
                .findByAlunoCodigoAndCursoCodigo(codigoAluno, codigoCurso);

        if (optionalAssociacao.isPresent()) {
            cursoAlunoRepository.deleteByAlunoCodigoAndCursoCodigo(codigoAluno, codigoCurso);
            return new ResponseEntity<>("Associação excluída com sucesso!", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Associação não encontrada", HttpStatus.NOT_FOUND);
        }
    }
}