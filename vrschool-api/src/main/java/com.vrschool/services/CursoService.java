package com.vrschool.services;

import com.vrschool.model.Curso;
import com.vrschool.model.dtos.CursoDTO;
import com.vrschool.repository.CursoAlunoRepository;
import com.vrschool.repository.CursoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
public class CursoService {

    @Autowired
    private CursoRepository cursoRepository;
    @Autowired
    private CursoAlunoRepository cursoAlunoRepository;


    public ResponseEntity<Object> criarCurso(String descricao, String ementa) {
        Curso curso = new Curso();
        curso.setDescricao(descricao);
        curso.setEmenta(ementa);

        Curso cursoCriado = cursoRepository.save(curso);

        CursoDTO cursoDTO = new CursoDTO(cursoCriado.getCodigo(), cursoCriado.getDescricao(), cursoCriado.getEmenta());

        return ResponseEntity.status(HttpStatus.CREATED).body(cursoDTO);
    }
    public ResponseEntity<List<Curso>> listarCursos() {
        List<Curso> cursos = cursoRepository.findAll();

        for (Curso curso : cursos) {
            boolean enrollmentsExist = cursoAlunoRepository.existsByCursoCodigo(curso.getCodigo());
            curso.setEnrollmentsExist(enrollmentsExist);
        }

        return new ResponseEntity<>(cursos, HttpStatus.OK);
    }

    public ResponseEntity<String> atualizarCurso(Long codigo, String novaDescricao, String novaEmenta) {
        Optional<Curso> optionalCurso = cursoRepository.findById(codigo);

        if (optionalCurso.isPresent()) {
            Curso curso = optionalCurso.get();
            // Atualiza a descrição se novaDescricao não for null
            if (Objects.nonNull(novaDescricao)) {
                curso.setDescricao(novaDescricao);
            }

            // Atualiza a ementa se novaEmenta não for null
            if (Objects.nonNull(novaEmenta)) {
                curso.setEmenta(novaEmenta);
            }

            // Fiz essas verificações pra caso envie vazio nao ficar null no banco

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
