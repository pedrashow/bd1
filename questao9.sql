SELECT distinct a.nome FROM aluno a
INNER JOIN aluno_turma alt ON a.co_aluno = alt.co_aluno
WHERE a.co_estadocivil = 'C' AND a.co_aluno IN (SELECT f.co_aluno AS co_aluno
FROM frequencia f
INNER JOIN turma t ON t.co_turma = f.co_turma
WHERE f.frequencia = 'S' AND t.ano = 2002
GROUP BY f.co_aluno, t.co_turma
HAVING COUNT(f.frequencia) >= 8
) AND a.co_aluno NOT IN (SELECT DISTINCT alt.co_aluno FROM aluno_turma alt
INNER JOIN turma t ON t.co_turma = alt.co_turma
WHERE alt.dt_cancelamento IS NOT NULL AND t.ano = 2003)