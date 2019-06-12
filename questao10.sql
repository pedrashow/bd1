SELECT vmatd.ano, vmatd.co_turma, ROUND(AVG(vmatd.media_final),2) AS media_turma
FROM vw_media_aluno_turma_disciplina vmatd
WHERE vmatd.ano < 2003
GROUP BY vmatd.ano, vmatd.co_turma