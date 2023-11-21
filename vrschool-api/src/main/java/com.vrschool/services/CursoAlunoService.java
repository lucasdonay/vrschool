package com.vrschool.services;

import com.vrschool.exceptions.CustomException;
import com.vrschool.model.Aluno;
import com.vrschool.model.Curso;
import com.vrschool.model.CursoAluno;
import com.vrschool.model.dtos.AlunoDTO;
import com.vrschool.model.dtos.CursoAlunoDTO;
import com.vrschool.model.dtos.CursoDTO;
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

    public CursoAlunoDTO associarAlunoCurso(Long codigoAluno, Long codigoCurso) {
        Optional<Aluno> optionalAluno = alunoRepository.findById(codigoAluno);
        Optional<Curso> optionalCurso = cursoRepository.findById(codigoCurso);

        if (optionalAluno.isPresent() && optionalCurso.isPresent()) {
            Aluno aluno = optionalAluno.get();
            Curso curso = optionalCurso.get();

            // Verifique se já existe uma associação entre o aluno e o curso
            boolean associacaoExistente = cursoAlunoRepository.existsByAlunoAndCurso(aluno, curso);

            if (associacaoExistente) {
                throw new CustomException("Essa associação já existe no banco de dados");
            }

            // Crie o objeto de associação
            CursoAluno cursoAluno = new CursoAluno();
            cursoAluno.setAluno(aluno);
            cursoAluno.setCurso(curso);

            // Salve o objeto de associação no banco de dados
            CursoAluno cursoAlunoCriado = cursoAlunoRepository.save(cursoAluno);

            // Crie objetos DTO para representar a resposta
            AlunoDTO alunoDTO = new AlunoDTO(aluno.getCodigo(), aluno.getNome());
            CursoDTO cursoDTO = new CursoDTO(curso.getCodigo(), curso.getDescricao(), curso.getEmenta());

            // Retorne a resposta usando a classe DTO específica
            return new CursoAlunoDTO(cursoAlunoCriado.getCodigo(), alunoDTO, cursoDTO);
        } else {
            throw new CustomException("Aluno ou curso não encontrado");
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