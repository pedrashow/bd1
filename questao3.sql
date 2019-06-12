SELECT media_aluno.co_turma, media_aluno.descricao_turnma, media_aluno.co_aluno, media_aluno.nome_aluno, media_aluno.media_geral
FROM (
SELECT vmatd.co_turma AS co_turma, vmatd.descricao_turnma AS descricao_turnma, vmatd.co_aluno AS co_aluno
, vmatd.nome_aluno AS nome_aluno, ROUND(AVG(vmatd.media_final),2) AS media_geral
FROM vw_media_aluno_turma_disciplina
vmatd
WHERE vmatd.ano = 2002 AND vmatd.periodo = 1
GROUP BY vmatd.co_turma, vmatd.descricao_turnma, vmatd.co_aluno, vmatd.nome_aluno) media_aluno
LEFT JOIN (
SELECT ROUND(AVG(vmatd.media_final),2) AS media_turma_um
FROM vw_media_aluno_turma_disciplina
vmatd
WHERE vmatd.ano = 2002 AND vmatd.periodo = 1 AND vmatd.co_turma = 1) media ON media_aluno.co_aluno > 0
WHERE media_aluno.media_geral > media.media_turma_um
