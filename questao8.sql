SELECT a.nome, a.dt_nascimento FROM vw_media_aluno_turma_disciplina vmatd 
INNER JOIN aluno a ON a.co_aluno = vmatd.co_aluno
WHERE a.co_estadocivil = 'S' AND
vmatd.nome_disciplina LIKE '%biologia%' AND vmatd.periodo = 2 AND vmatd.media_final > 8 AND vmatd.co_aluno IN (SELECT DISTINCT a.co_aluno
FROM aluno_turma alt
INNER JOIN turma t ON t.co_turma = alt.co_turma
INNER JOIN aluno a ON a.co_aluno = alt.co_aluno
WHERE t.ano = 2003)