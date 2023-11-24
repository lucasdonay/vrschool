package com.vrschool.controllers;

import com.vrschool.exceptions.CustomException;
import com.vrschool.model.Aluno;
import com.vrschool.model.dtos.AlunoDTOWithMatricula;
import com.vrschool.services.AlunoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
    public ResponseEntity<?> criarAluno(@ApiParam(value = "Nome do aluno", required = true) @RequestParam String nome) {
        Aluno alunoCriado = alunoService.criarAluno(nome);

        if (alunoCriado != null) {
            return ResponseEntity.status(HttpStatus.CREATED).body(alunoCriado);
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Falha ao criar o aluno");
        }
    }

    @GetMapping
    @ApiOperation(value = "Retorna todos os alunos")
    public ResponseEntity<List<AlunoDTOWithMatricula>> listarAlunos() {
        List<AlunoDTOWithMatricula> alunosComMatriculas = alunoService.listarAlunos();
        return ResponseEntity.ok(alunosComMatriculas);
    }

    @PutMapping("/{codigo}")
    @ApiOperation(value = "Atualiza um aluno existente")
    public ResponseEntity<?> atualizarAluno(@ApiParam(value = "Código do aluno que será atualizado", required = true) @PathVariable Long codigo,
                                            @ApiParam(value = "Novo nome do aluno", required = true) @RequestParam String novoNome) {

        try {
            Aluno alunoAtualizado = alunoService.atualizarAluno(codigo, novoNome);
            return ResponseEntity.ok(alunoAtualizado);
        } catch (CustomException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Erro interno ao processar a solicitação");
        }
    }

    @DeleteMapping("/{codigo}")
    @ApiOperation(value = "Exclui um aluno")
    public ResponseEntity<?> excluirAluno(@ApiParam(value = "Codigo do aluno a ser excluído", required = true) @PathVariable Long codigo) {
        try {
            Aluno alunoExcluido = alunoService.excluirAluno(codigo);
            return ResponseEntity.ok(alunoExcluido);
        } catch (CustomException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Erro interno ao processar a solicitação");
        }
    }
}