SELECT t.periodo AS periodo, t.co_turma AS codigo_turma, ativo.qtd_aluno AS alunos_iniciaram, cancelado.qtd_aluno AS alunos_cancelaram
FROM turma t
LEFT JOIN (
SELECT COUNT(alt.co_aluno) AS qtd_aluno, alt.co_turma
FROM aluno_turma alt
WHERE alt.dt_cancelamento IS NULL group BY alt.co_turma) ativo ON ativo.co_turma = t.co_turma
LEFT JOIN (
SELECT COUNT(alt.co_aluno) AS qtd_aluno, alt.co_turma
FROM aluno_turma alt
WHERE alt.dt_cancelamento IS not NULL group BY alt.co_turma) cancelado ON cancelado.co_turma = t.co_turma
WHERE t.ano = 2002
ORDER BY t.periodo