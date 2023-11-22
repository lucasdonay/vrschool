package com.vrschool.controllers;

import com.vrschool.model.Curso;
import com.vrschool.services.CursoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/cursos")
@Api(tags = "CursoController", description = "API para operações relacionadas ao Aluno")
public class CursoController {

    private final CursoService cursoService;

    @Autowired
    public CursoController(CursoService cursoService) {
        this.cursoService = cursoService;
    }

    @PostMapping
    @ApiOperation(value = "Cria um novo curso")
    public ResponseEntity<Object> criarCurso(
            @RequestParam(value = "descricao", required = true) String descricao,
            @RequestParam(value = "ementa", required = true) String ementa) {
        return cursoService.criarCurso(descricao, ementa);
    }

    @GetMapping
    @ApiOperation(value = "Retorna todos os cursos")
    public ResponseEntity<List<Curso>> listarCursos() {
        return cursoService.listarCursos();
    }

    @PutMapping("/{codigo}")
    @ApiOperation(value = "Atualiza um curso existente")
    public ResponseEntity<String> atualizarCurso(
            @ApiParam(value = "Código do curso que será atualizado", required = true) @PathVariable Long codigo,
            @ApiParam(value = "Novo nome do curso") @RequestParam(required = false) String novaDescricao,
            @ApiParam(value = "Nova ementa do curso") @RequestParam(required = false) String novaEmenta) {
        return cursoService.atualizarCurso(codigo, novaDescricao, novaEmenta);
    }

    @DeleteMapping("/{codigo}")
    @ApiOperation(value = "Exclui um curso")
    public ResponseEntity<String> excluirCurso(
            @ApiParam(value = "Codigo do curso a ser excluído", required = true) @PathVariable Long codigo) {
        return cursoService.excluirCurso(codigo);
    }
}