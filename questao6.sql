SELECT a.co_aluno, a.nome, CASE WHEN a.co_aluno NOT IN (
SELECT DISTINCT a.co_aluno
FROM aluno_turma alt
INNER JOIN turma t ON t.co_turma = alt.co_turma
INNER JOIN aluno a ON a.co_aluno = alt.co_aluno
WHERE t.ano = 2002) THEN TRUE ELSE FALSE END AS aluno_novo
FROM aluno_turma alt
INNER JOIN turma t ON t.co_turma = alt.co_turma
INNER JOIN aluno a ON a.co_aluno = alt.co_aluno
WHERE t.ano = 2003