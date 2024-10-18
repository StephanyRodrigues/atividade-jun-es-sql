-- Atividade 1: Alunos e seus cursos -
 
select a.mat_alu, a.nom_alu,
    ( select c.nom_curso from cursos c where c.cod_curso = a.cod_curso) as nom_curso
from alunos a 
where a.COD_CURSO = (select cod_curso from cursos  where nom_curso = 'Sistemas de Informacao - Noite');

-- Atividade 2: Matrículas e disciplinas correspondentes -

select m.mat_alu, m.ano, m.semestre as matriculas,
    ( select d.nom_disc from disciplinas d where  d.cod_disc = t.cod_disc) as disciplinas
    from matriculas m, turmas t
    where m.ano = t.ano
    and m.ano = '2011';
    
-- Atividade 3: Alunos e seus históricos
  select h.mat_alu, a.nom_alu,h.ano, h.SEMESTRE,h.MEDIA
	from alunos a,historicos h
    where h.MAT_ALU = a.MAT_ALU 
    and h.media  > 7;

-- Atividade 4: Professores e disciplinas que ministram

SELECT  (select p.nom_prof from professores p where p.IDT_PROF = t.IDT_PROF) as professores,
	(select d.nom_disc from disciplinas d where d.cod_disc = t.cod_disc) as DISCIPLINAS
from  turmas T
   where ( SELECT D.CREDITOS FROM DISCIPLINAS d where d.cod_disc = t.cod_disc) > 4;
    
-- Atividade 5: Turmas e professores ---
select t.ano, t.semestre, t.cod_disc,
     (select p.NOM_PROF from professores p where  p.idt_prof = t.IDT_PROF) as professores
     from turmas t 
     where t.ano = '2010' and t.semestre = 1;

-- Atividade 6: Disciplinas e matrizes curriculares --
SELECT 
    (SELECT d.nom_disc 
     FROM disciplinas d 
     WHERE d.COD_DISC = m.cod_disc) AS disciplinas,
    m.cod_curso
FROM matrizes m
WHERE m.cod_curso = 35;

-- Atividade 7: Alunos e seus professores

select m.MAT_ALU                                                                         ,
      ( select a.nom_alu from alunos a where a.mat_alu = m.mat_alu) as alunos ,
      (select p.nom_prof from professores p where p.idt_prof = t.idt_prof) as professores 
      from matriculas m, turmas t
      where m.ano = t.ano
      and m.ANO = '2011'and m.SEMESTRE= 3;
      
-- - Atividade 8: Matrículas em um período letivo -

select  m.mat_alu, m.ano,m.semestre, 
 (select d.nom_disc from disciplinas as d where d.cod_disc = t.cod_disc) as disciplinas 
 from matriculas m, turmas t 
 where m.cod_disc = t.cod_disc
 and m.ano = 2011 and m.semestre = 3;
