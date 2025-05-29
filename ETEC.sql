create database ETEC;
use ETEC;

create table curso (
    idcurso int primary key,
    nome varchar(100),
    cargahoraria int
);

create table professor (
    idprofessor int primary key,
    nome varchar(100),
    formacao varchar(100),
    email varchar(100)
);

create table disciplina (
    iddisciplina int primary key,
    nome varchar(100),
    idcurso int,
    foreign key (idcurso) references curso(idcurso)
);

create table aluno (
    idaluno int primary key,
    nome varchar(100),
    datanascimento date,
    email varchar(100),
    idcurso int,
    foreign key (idcurso) references curso(idcurso)
);

create table atribuicao (
    idatribuicao int primary key,
    idprofessor int,
    iddisciplina int,
    foreign key (idprofessor) references professor(idprofessor),
    foreign key (iddisciplina) references disciplina(iddisciplina)
);


alter table professor add telefone varchar(20);


create table sala (
    idsala int primary key,
    nomesala varchar(50),
    capacidade int
);

alter table atribuicao add idsala int;

alter table atribuicao add foreign key (idsala) references sala(idsala);


insert into curso (idcurso, nome, cargahoraria) values
(1, 'informatica', 1200),
(2, 'administracao', 1000);

insert into professor (idprofessor, nome, formacao, email, telefone) values
(1, 'carlos silva', 'engenharia da computacao', 'carlos@etec.com', '119966666888'),
(2, 'ana souza', 'administracaoo', 'ana@etec.com', '119998790007');

insert into disciplina (iddisciplina, nome, idcurso) values
(1, 'logica de programacao', 1),
(2, 'administracao', 2);

insert into aluno (idaluno, nome, datanascimento, email, idcurso) values
(1, 'joão oliveira', '2005-06-15', 'joao@gmail.com', 1),
(2, 'maria costa', '2004-12-22', 'maria@gmail.com', 2);

insert into sala (idsala, nomesala, capacidade) values
(1, 'sala 101', 40),
(2, 'sala 202', 35);

insert into atribuicao (idatribuicao, idprofessor, iddisciplina, idsala) values
(1, 1, 1, 1),
(2, 2, 2, 2);


alter table professor drop column formacao;

