select a.nome, presencas.presencas, faltas.faltas from aluno a
left join (
select f.co_aluno, count(f.frequencia) as presencas from frequencia f where f.frequencia = 'S' group by f.co_aluno
) as presencas on a.co_aluno = presencas.co_aluno
left join(
select f.co_aluno, count(f.frequencia) as faltas from frequencia f where f.frequencia = 'N' group by f.co_aluno
) faltas on a.co_aluno = faltas.co_aluno
order by a.nome