package com.vrschool.controllers;

import com.vrschool.model.Aluno;
import com.vrschool.services.AlunoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/alunos")
@Api(tags = "AlunoController", description = "API para operações relacionadas ao Aluno")
public class AlunoController {

    private final AlunoService alunoService;

    @Autowired
    public AlunoController(AlunoService alunoService) {
        this.alunoService = alunoService;
    }

    @PostMapping
    @ApiOperation(value = "Cria um novo aluno")
    public ResponseEntity<String> criarAluno(
            @ApiParam(value = "Nome do aluno", required = true) @RequestParam String nome) {
        return alunoService.criarAluno(nome);
    }

    @GetMapping
    @ApiOperation(value = "Retorna todos os alunos")
    public ResponseEntity<List<Aluno>> listarAlunos() {
        return alunoService.listarAlunos();
    }

    @PutMapping("/{codigo}")
    @ApiOperation(value = "Atualiza um aluno existente")
    public ResponseEntity<String> atualizarAluno(
            @ApiParam(value = "Codigo do aluno que vai ser atualizado", required = true) @PathVariable Long codigo,
            @ApiParam(value = "Novo nome do aluno", required = true) @RequestParam String novoNome) {
        return alunoService.atualizarAluno(codigo, novoNome);
    }

    @DeleteMapping("/{codigo}")
    @ApiOperation(value = "Exclui um aluno")
    public ResponseEntity<String> excluirAluno(
            @ApiParam(value = "Codigo do aluno a ser excluído", required = true) @PathVariable Long codigo) {
        return alunoService.excluirAluno(codigo);
    }
}