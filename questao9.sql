SELECT distinct a.nome FROM aluno a
INNER JOIN aluno_turma alt ON a.co_aluno = alt.co_aluno
WHERE a.co_estadocivil = 'C' AND a.co_aluno IN (SELECT f.co_aluno AS co_aluno, COUNT(f.frequencia) AS presencas
FROM frequencia f
INNER JOIN turma t ON f.co_turma = t.co_turma
WHERE f.frequencia = 'S' AND t.ano = 2002
GROUP BY f.co_aluno
)