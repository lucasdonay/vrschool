package com.vrschool.services;

import com.vrschool.model.Curso;
import com.vrschool.repository.CursoAlunoRepository;
import com.vrschool.repository.CursoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CursoService {

    @Autowired
    private CursoRepository cursoRepository;
    @Autowired
    private CursoAlunoRepository cursoAlunoRepository;


    public ResponseEntity<String> criarCurso(String descricao, String ementa) {
        Curso curso = new Curso();
        curso.setDescricao(descricao);
        curso.setEmenta(ementa);

        cursoRepository.save(curso);

        return new ResponseEntity<>("Curso criado com sucesso!", HttpStatus.CREATED);
    }

    public ResponseEntity<List<Curso>> listarCursos() {
        List<Curso> cursos = cursoRepository.findAll();
        return new ResponseEntity<>(cursos, HttpStatus.OK);
    }

    public ResponseEntity<String> atualizarCurso(Long codigo, String novaDescricao, String novaEmenta) {
        Optional<Curso> optionalCurso = cursoRepository.findById(codigo);

        if (optionalCurso.isPresent()) {
            Curso curso = optionalCurso.get();
            curso.setDescricao(novaDescricao);
            curso.setEmenta(novaEmenta);
            cursoRepository.save(curso);
            return new ResponseEntity<>("Curso atualizado com sucesso!", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Curso não encontrado", HttpStatus.NOT_FOUND);
        }
    }

        public ResponseEntity<String> excluirCurso(Long codigo) {
        Optional<Curso> optionalCurso = cursoRepository.findById(codigo);


        if (optionalCurso.isPresent()) {

            Curso curso = optionalCurso.get();

            // Verifica se há associações com o curso
            if (cursoAlunoRepository.existsByCurso(curso)) {
                return new ResponseEntity<>("Não é possível excluir o curso. Existem associações com alunos.", HttpStatus.BAD_REQUEST);
            }

            cursoRepository.deleteById(codigo);
            return new ResponseEntity<>("Curso excluído com sucesso!", HttpStatus.OK);

        } else {
            return new ResponseEntity<>("Curso não encontrado", HttpStatus.NOT_FOUND);
        }
    }
}
