SELECT distinct a.nome FROM aluno a
INNER JOIN aluno_turma alt ON a.co_aluno = alt.co_aluno
WHERE a.co_estadocivil = 'C' AND a.co_aluno IN (SELECT f.co_aluno AS co_aluno
FROM frequencia f
INNER JOIN turma t ON t.co_turma = f.co_turma
WHERE f.frequencia = 'S' AND t.ano = 2002
GROUP BY f.co_aluno
HAVING COUNT(f.frequencia) >= 8
)