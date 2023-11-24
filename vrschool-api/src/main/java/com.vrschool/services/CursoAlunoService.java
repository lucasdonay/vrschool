package com.vrschool.services;

import com.vrschool.model.Aluno;
import com.vrschool.model.Curso;
import com.vrschool.model.CursoAluno;
import com.vrschool.model.dtos.CursoAlunoDTO;
import com.vrschool.repository.AlunoRepository;
import com.vrschool.repository.CursoAlunoRepository;
import com.vrschool.repository.CursoRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class CursoAlunoService {

    @Autowired
    private CursoAlunoRepository cursoAlunoRepository;

    @Autowired
    private CursoRepository cursoRepository;

    @Autowired
    private AlunoRepository alunoRepository;

    public CursoAlunoDTO associarAlunoCurso(Long codigoAluno, Long codigoCurso) {
        Optional<Aluno> optionalAluno = alunoRepository.findById(codigoAluno);
        Optional<Curso> optionalCurso = cursoRepository.findById(codigoCurso);

        if (optionalAluno.isPresent() && optionalCurso.isPresent()) {
            Optional<CursoAluno> cursoAtual = cursoAlunoRepository.findByAluno(optionalAluno.get());

            if (cursoAtual.isPresent()) {
                CursoAluno cursoAlunoExistente = cursoAtual.get();
                cursoAlunoExistente.setCurso(optionalCurso.get());
                cursoAlunoRepository.save(cursoAlunoExistente);

                return new CursoAlunoDTO(
                        cursoAlunoExistente.getCodigo(),
                        cursoAlunoExistente.getAluno().getCodigo(),
                        cursoAlunoExistente.getCurso().getCodigo()
                );
            } else {
                CursoAluno cursoAluno = new CursoAluno();
                cursoAluno.setAluno(optionalAluno.get());
                cursoAluno.setCurso(optionalCurso.get());
                CursoAluno cursoAlunoCriado = cursoAlunoRepository.save(cursoAluno);

                return new CursoAlunoDTO(
                        cursoAlunoCriado.getCodigo(),
                        cursoAlunoCriado.getAluno().getCodigo(),
                        cursoAlunoCriado.getCurso().getCodigo()
                );
            }
        } else {
            throw new EntityNotFoundException("Aluno ou curso não encontrado");
        }
    }

    @Transactional
    public ResponseEntity<String> excluirAssociacao(Long codigoAluno) {
        List<CursoAluno> associacoes = cursoAlunoRepository.findByAlunoCodigo(codigoAluno);

        if (!associacoes.isEmpty()) {
            cursoAlunoRepository.deleteByAlunoCodigo(codigoAluno);
            return new ResponseEntity<>("Associações excluídas com sucesso!", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Nenhuma associação encontrada para o aluno", HttpStatus.NOT_FOUND);
        }
    }
}