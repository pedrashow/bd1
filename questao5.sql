SELECT vmatd.descricao_turnma, vmatd.co_turma, vmatd.co_aluno, vmatd.nome_aluno, round(AVG(vmatd.media_final),2) AS media_geral
FROM vw_media_aluno_turma_disciplina vmatd
WHERE vmatd.ano = 2002
GROUP BY vmatd.co_turma, vmatd.descricao_turnma, vmatd.co_turma, vmatd.nome_aluno