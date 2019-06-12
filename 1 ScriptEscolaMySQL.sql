CREATE TABLE PROFESSOR ( 
      co_professor         int NOT NULL, 
      sg_sexo              char(1) NULL, 
      nome                 varchar(20) NULL, 
      dt_nascimento        datetime NULL 
) ; 
 
ALTER TABLE PROFESSOR 
      ADD PRIMARY KEY ( co_professor) ;

CREATE TABLE CURSO ( 
      co_curso         int NOT NULL, 
      nome              char(40) NULL 
) ;
 
ALTER TABLE CURSO 
      ADD PRIMARY KEY (co_curso) ;
 
CREATE TABLE TURMA ( 
    co_turma             char(11) NOT NULL, 
    ano          char (04) null, 
    periodo         char(01)null, 
     descricao       char(50) null, 
    dt_inicial           datetime NULL, 
    dt_final             datetime NULL, 
    num_provas           int NULL, 
    co_curso                int 
) ;

ALTER TABLE TURMA 
      ADD PRIMARY KEY (co_turma) ;

CREATE TABLE DISCIPLINA ( 
      co_disciplina        char(2) NOT NULL, 
      no_disciplina        varchar(30) NULL 
) ;

ALTER TABLE DISCIPLINA 
      ADD PRIMARY KEY (co_disciplina); 

CREATE TABLE PROF_TURM_DISC ( 
      co_professor         int NOT NULL, 
      co_turma             char(11) NOT NULL, 
      co_disciplina        char(2) NOT NULL 
) ;

ALTER TABLE PROF_TURM_DISC 
      ADD PRIMARY KEY (co_professor, co_turma, co_disciplina) ;

CREATE TABLE PROVA ( 
      co_prova             char(3) NOT NULL, 
      ds_prova             varchar(20) NULL 
) ;
 
ALTER TABLE PROVA 
      ADD PRIMARY KEY (co_prova) ;

CREATE TABLE ALUNO ( 
      co_aluno             int NOT NULL, 
      dt_nascimento        datetime NULL, 
      sg_sexo              char(1) NULL, 
      nome                 varchar(20) NULL, 
      co_estadocivil       char(1) NULL, 
      no_pai               varchar(70) NULL, 
      no_mae               varchar(70) NULL 
) ;

ALTER TABLE ALUNO 
      ADD PRIMARY KEY (co_aluno) ;

CREATE TABLE ALUNO_TURMA ( 
      co_aluno             int NOT NULL, 
      co_turma             char(11) NOT NULL, 
      dt_matricula         datetime NULL, 
      dt_cancelamento      datetime NULL 
) ;
 
ALTER TABLE ALUNO_TURMA 
      ADD PRIMARY KEY  (co_aluno, co_turma) ;

CREATE TABLE AVALIACAO ( 
      co_aluno             int NOT NULL, 
      co_turma             char(11) NOT NULL, 
      co_disciplina        char(2) NOT NULL, 
      co_prova             char(3) NOT NULL, 
      dt_avaliacao         datetime NULL, 
      nt_avaliacao         float NULL 
) ;

ALTER TABLE AVALIACAO 
      ADD PRIMARY KEY (co_aluno, co_turma, co_disciplina, co_prova) ;
 
CREATE TABLE FREQUENCIA ( 
      co_aluno             int NOT NULL, 
      co_turma             char(11) NOT NULL, 
      co_disciplina        char(2) NOT NULL, 
      dt_frequencia        datetime NOT NULL, 
      frequencia           char(1) NULL 
) ;

ALTER TABLE FREQUENCIA 
      ADD PRIMARY KEY (co_aluno, co_turma, co_disciplina,dt_frequencia); 

ALTER TABLE PROF_TURM_DISC 
      ADD FOREIGN KEY (co_professor) 
                            REFERENCES PROFESSOR(co_professor)  ;

ALTER TABLE PROF_TURM_DISC 
      ADD FOREIGN KEY (co_turma) 
                            REFERENCES TURMA(co_turma)  ;

ALTER TABLE PROF_TURM_DISC 
      ADD FOREIGN KEY (co_disciplina) 
                            REFERENCES DISCIPLINA(co_disciplina)  ;

ALTER TABLE ALUNO_TURMA 
      ADD FOREIGN KEY (co_turma) 
                            REFERENCES TURMA  (co_turma) ;

ALTER TABLE ALUNO_TURMA 
      ADD FOREIGN KEY (co_aluno) 
                            REFERENCES ALUNO(co_aluno) ; 

ALTER TABLE AVALIACAO 
      ADD FOREIGN KEY (co_prova) 
                            REFERENCES PROVA(co_prova)  ;

ALTER TABLE AVALIACAO 
      ADD FOREIGN KEY (co_aluno, co_turma) 
                            REFERENCES ALUNO_TURMA(co_aluno, co_turma) ;

ALTER TABLE AVALIACAO 
      ADD FOREIGN KEY (co_disciplina) 
                            REFERENCES DISCIPLINA(co_disciplina)  ;

ALTER TABLE FREQUENCIA 
      ADD FOREIGN KEY (co_aluno, co_turma) 
                            REFERENCES ALUNO_TURMA (co_aluno, co_turma) ;

ALTER TABLE FREQUENCIA 
      ADD FOREIGN KEY (co_disciplina) 
                            REFERENCES DISCIPLINA (co_disciplina)  ;

ALTER TABLE TURMA 
      ADD FOREIGN KEY (co_curso) 
                            REFERENCES CURSO (co_curso) ;

