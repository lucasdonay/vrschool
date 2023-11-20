package com.vrschool.services;

import com.vrschool.model.Aluno;
import com.vrschool.repository.AlunoRepository;
import com.vrschool.repository.CursoAlunoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AlunoService {

    @Autowired
    private AlunoRepository alunoRepository;

    @Autowired
    private CursoAlunoRepository cursoAlunoRepository;

    public ResponseEntity<String> criarAluno(String nome) {
        Aluno aluno = new Aluno();
        aluno.setNome(nome);

        alunoRepository.save(aluno);

        return new ResponseEntity<>("Aluno criado com sucesso!", HttpStatus.CREATED);
    }

    public ResponseEntity<List<Aluno>> listarAlunos() {
        List<Aluno> alunos = alunoRepository.findAll();
        return new ResponseEntity<>(alunos, HttpStatus.OK);
    }

    public ResponseEntity<String> atualizarAluno(Long codigo, String novoNome) {
        Optional<Aluno> optionalAluno = alunoRepository.findById(codigo);

        if (optionalAluno.isPresent()) {
            Aluno aluno = optionalAluno.get();
            aluno.setNome(novoNome);
            alunoRepository.save(aluno);
            return new ResponseEntity<>("Aluno atualizado com sucesso!", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Aluno não encontrado", HttpStatus.NOT_FOUND);
        }
    }

    public ResponseEntity<String> excluirAluno(Long codigo) {
        Optional<Aluno> optionalAluno = alunoRepository.findById(codigo);

        if (optionalAluno.isPresent()) {
            Aluno aluno = optionalAluno.get();

            // Verifica se o aluno está associado a algum curso
            boolean alunoAssociadoACurso = cursoAlunoRepository.existsByAluno(aluno);

            if (alunoAssociadoACurso) {
                return new ResponseEntity<>("Não é possível excluir o aluno. Ele está associado a um curso.", HttpStatus.BAD_REQUEST);
            } else {
                alunoRepository.deleteById(codigo);
                return new ResponseEntity<>("Aluno excluído com sucesso!", HttpStatus.OK);
            }
        } else {
            return new ResponseEntity<>("Aluno não encontrado", HttpStatus.NOT_FOUND);
        }
    }
}
