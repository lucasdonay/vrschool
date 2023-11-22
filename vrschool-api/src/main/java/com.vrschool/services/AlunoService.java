package com.vrschool.services;

import com.vrschool.exceptions.CustomException;
import com.vrschool.model.Aluno;
import com.vrschool.model.dtos.AlunoDTOWithMatricula;
import com.vrschool.repository.AlunoRepository;
import com.vrschool.repository.CursoAlunoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class AlunoService {

    @Autowired
    private AlunoRepository alunoRepository;

    @Autowired
    private CursoAlunoRepository cursoAlunoRepository;


    public Aluno criarAluno(String nome) {
        Aluno aluno = new Aluno();
        aluno.setNome(nome);

        Aluno alunoCriado = alunoRepository.save(aluno);

        return alunoCriado;
    }

    public List<AlunoDTOWithMatricula> listarAlunos() {
        List<Aluno> alunos = alunoRepository.findAll();

        return alunos.stream()
                .map(aluno -> {
                    String cursoDescricao = alunoRepository.findNomeCursoByAlunoId(aluno.getCodigo());
                    return new AlunoDTOWithMatricula(aluno.getCodigo(), aluno.getNome(), cursoDescricao);
                })
                .collect(Collectors.toList());
    }
    public Aluno atualizarAluno(Long codigo, String novoNome) {
        Optional<Aluno> optionalAluno = alunoRepository.findById(codigo);

        if (optionalAluno.isPresent()) {
            Aluno aluno = optionalAluno.get();
            aluno.setNome(novoNome);
            return alunoRepository.save(aluno);
        } else {
            throw new CustomException("Aluno não encontrado");
        }
    }

    public ResponseEntity<String> excluirAluno(Long codigo) {
        Optional<Aluno> optionalAluno = alunoRepository.findById(codigo);

        if (optionalAluno.isPresent()) {
            Aluno aluno = optionalAluno.get();

            // Verifica se o aluno está associado a algum curso
            boolean alunoAssociadoACurso = cursoAlunoRepository.existsByAluno(aluno);

            if (alunoAssociadoACurso) {
                throw new CustomException("Não é possível excluir o aluno. Ele está associado a um curso.");
            } else {
                alunoRepository.deleteById(codigo);
                return new ResponseEntity<>("Aluno excluído com sucesso!", HttpStatus.OK);
            }
        } else {
            throw new CustomException("Aluno não encontrado");
        }
    }
}
