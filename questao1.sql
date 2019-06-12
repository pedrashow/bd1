SELECT t.ano AS ano, t.periodo AS periodo, t.descricao AS descricao_turnma, a.nome AS nome_aluno, d.no_disciplina AS nome_disciplina, ROUND(snatd.somatorio/t.num_provas,2) AS media_final
FROM aluno_turma alt
INNER JOIN aluno a ON a.co_aluno = alt.co_aluno
INNER JOIN turma t ON alt.co_turma = t.co_turma
INNER JOIN prof_turm_disc ptd ON t.co_turma = ptd.co_turma
INNER JOIN disciplina d ON d.co_disciplina = ptd.co_disciplina
LEFT JOIN vw_soma_nota_aluno_turma_disciplina snatd ON a.co_aluno = snatd.co_aluno AND t.co_turma = snatd.co_turma AND d.co_disciplina = snatd.co_disciplina
WHERE t.ano = 2002 AND alt.dt_cancelamento IS NULL
ORDER BY t.ano, t.periodo, a.nome