package com.vrschool.controllers;

import com.vrschool.model.CursoAluno;
import com.vrschool.services.CursoAlunoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/curso-aluno")
@Api(tags = "CursoAlunoController", description = "API para operações relacionadas a CursoAluno")
public class CursoAlunoController {

    private final CursoAlunoService cursoAlunoService;

    @Autowired
    public CursoAlunoController(CursoAlunoService cursoAlunoService) {
        this.cursoAlunoService = cursoAlunoService;
    }

    @PostMapping
    @ApiOperation(value = "Associa um aluno a um curso")
    public ResponseEntity<String> associarAlunoCurso(
            @ApiParam(value = "Código do aluno", required = true) @RequestParam Long codigoAluno,
            @ApiParam(value = "Código do curso", required = true) @RequestParam Long codigoCurso) {
        return cursoAlunoService.associarAlunoCurso(codigoAluno, codigoCurso);
    }

    @DeleteMapping("/excluir-associacao")
    @ApiOperation(value = "Exclui a associação entre um aluno e um curso")
    public ResponseEntity<String> excluirAssociacao(
            @ApiParam(value = "Código do aluno", required = true) @RequestParam Long codigoAluno,
            @ApiParam(value = "Código do curso", required = true) @RequestParam Long codigoCurso) {
        return cursoAlunoService.excluirAssociacao(codigoAluno, codigoCurso);
    }
}