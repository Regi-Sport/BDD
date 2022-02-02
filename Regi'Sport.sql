/*==============================================================*/
/* Nom de SGBD :  Sybase AS Anywhere 9                          */
/* Date de cr�ation :  26/01/2022 17:25:13                      */
/*==============================================================*/

/*if exists(select 1 from sys.sysforeignkey where role='FK_COMPETIT_INSCRIT_PERSONNE') then
    alter table COMPETITION
       delete foreign key FK_COMPETIT_INSCRIT_PERSONNE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_COMPETIT_JOUER_SPORT') then
    alter table COMPETITION
       delete foreign key FK_COMPETIT_JOUER_SPORT
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_EQUIPE_INSCRIT2_PERSONNE') then
    alter table EQUIPE
       delete foreign key FK_EQUIPE_INSCRIT2_PERSONNE
end if;

if exists(select 1 from sys.sysforeignkey where role='FK_PERSONNE_PRATIQUE_SPORT') then
    alter table PERSONNE
       delete foreign key FK_PERSONNE_PRATIQUE_SPORT
end if;

if exists(
   select 1 from sys.systable 
   where table_name='COMPETITION'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table COMPETITION
end if;

if exists(
   select 1 from sys.systable 
   where table_name='EQUIPE'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table EQUIPE
end if;

if exists(
   select 1 from sys.systable 
   where table_name='PERSONNE'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table PERSONNE
end if;

if exists(
   select 1 from sys.systable 
   where table_name='SPORT'
     and table_type in ('BASE', 'GBL TEMP')
) then
    drop table SPORT
end if;*/

/*==============================================================*/
/* Table : COMPETITION                                          */
/*==============================================================*/
create table COMPETITION 
(
    ID_PERSONNE          char(10)                       not null,
    ID_COMPETITION       integer                        not null,
    ID_SPORT             char(20)                       not null,
    SPO_ID_SPORT         char(20),
    PER_NOM              char(20),
    PRENOM               char(10),
    AGE                  integer,
    DATE_NAISSANCE       date,
    NOM                  char(20),
    SPORT                char(20),
    DATE_DEBUT           date,
    DATE_FIN             date,
    VAINQUEUR            char(20),
    PRIX                 char(20),
    PARTICIPANTS         integer,
    LIEU                 char(20),
    constraint PK_COMPETITION primary key (ID_PERSONNE, ID_COMPETITION)
);

/*==============================================================*/
/* Table : EQUIPE                                               */
/*==============================================================*/
create table EQUIPE 
(
    ID_PERSONNE          char(10)                       not null,
    ID_EQUIPE            integer                        not null,
    ID_SPORT             char(20),
    PER_NOM              char(20),
    PRENOM               char(10),
    AGE                  integer,
    DATE_NAISSANCE       date,
    NOM                  char(20),
    EFFECTIF             integer,
    COACH                char(20),
    VILLE                char(30),
    constraint PK_EQUIPE primary key (ID_PERSONNE, ID_EQUIPE)
);

/*==============================================================*/
/* Table : PERSONNE                                             */
/*==============================================================*/
create table PERSONNE 
(
    ID_PERSONNE          char(10)                       not null,
    ID_SPORT             char(20)                       not null,
    NOM                  char(20),
    PRENOM               char(10),
    AGE                  integer,
    DATE_NAISSANCE       date,
    constraint PK_PERSONNE primary key (ID_PERSONNE)
);

/*==============================================================*/
/* Table : SPORT                                                */
/*==============================================================*/
create table SPORT 
(
    ID_SPORT             char(20)                       not null,
    NOM                  char(20),
    constraint PK_SPORT primary key (ID_SPORT)
);

alter table COMPETITION
   add constraint FK_COMPETIT_INSCRIT_PERSONNE foreign key (ID_PERSONNE)
      references PERSONNE (ID_PERSONNE)
      on update restrict
      on delete restrict;

alter table COMPETITION
   add constraint FK_COMPETIT_JOUER_SPORT foreign key (ID_SPORT)
      references SPORT (ID_SPORT)
      on update restrict
      on delete restrict;

alter table EQUIPE
   add constraint FK_EQUIPE_INSCRIT2_PERSONNE foreign key (ID_PERSONNE)
      references PERSONNE (ID_PERSONNE)
      on update restrict
      on delete restrict;

alter table PERSONNE
   add constraint FK_PERSONNE_PRATIQUE_SPORT foreign key (ID_SPORT)
      references SPORT (ID_SPORT)
      on update restrict
      on delete restrict;

