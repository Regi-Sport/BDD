/*==============================================================*/
/* Nom de SGBD :  MySQL 4.0                                     */
/* Date de cr�ation :  02/02/2022 16:52:30                      */
/*==============================================================*/


/*drop index ASSOCIER_FK on COMPETITION;

drop index INSCRIRE2_FK on INSCRIRE;

drop index INSCRIRE3_FK on INSCRIRE;

drop index INSCRIRE_FK on INSCRIRE;

drop index CONSTITUER_FK on PERSONNE;

drop index PRATIQUER2_FK on PRATIQUER;

drop index PRATIQUER3_FK on PRATIQUER;

drop index PRATIQUER_FK on PRATIQUER;

drop table if exists COMPETITION;

drop table if exists EQUIPE;

drop table if exists INSCRIRE;

drop table if exists PERSONNE;

drop table if exists PRATIQUER;

drop table if exists SPORT;*/

/*==============================================================*/
/* Table : COMPETITION                                          */
/*==============================================================*/
create table COMPETITION
(
   ID_COMPETITION                 int                            not null,
   ID_SPORT                       int                            not null,
   LIBELLE_C                      char(60),
   DATE_DEBUT                     date,
   DATE_FIN                       date,
   RECOMPENSE                     char(60),
   VAINQUEUR                      char(60),
   NB_PARTICIPANTS                int,
   LIEU                           char(60),
   primary key (ID_COMPETITION)
)
ENGINE = InnoDB;

/*==============================================================*/
/* Index : ASSOCIER_FK                                          */
/*==============================================================*/
create index ASSOCIER_FK on COMPETITION
(
   ID_SPORT
);

/*==============================================================*/
/* Table : EQUIPE                                               */
/*==============================================================*/
create table EQUIPE
(
   ID_EQUIPE                      int                            not null,
   NOM_E                          char(60),
   EFFECTIF                       int,
   NOM_COACH                      char(60),
   VILLE                          char(60),
   primary key (ID_EQUIPE)
)
ENGINE = InnoDB;

/*==============================================================*/
/* Table : INSCRIRE                                             */
/*==============================================================*/
create table INSCRIRE
(
   ID_EQUIPE                      int                            not null,
   ID_COMPETITION                 int                            not null,
   ID_PERSONNE                    int                            not null,
   primary key (ID_EQUIPE, ID_COMPETITION, ID_PERSONNE)
)
ENGINE = InnoDB;

/*==============================================================*/
/* Index : INSCRIRE_FK                                          */
/*==============================================================*/
create index INSCRIRE_FK on INSCRIRE
(
   ID_EQUIPE
);

/*==============================================================*/
/* Index : INSCRIRE2_FK                                         */
/*==============================================================*/
create index INSCRIRE2_FK on INSCRIRE
(
   ID_COMPETITION
);

/*==============================================================*/
/* Index : INSCRIRE3_FK                                         */
/*==============================================================*/
create index INSCRIRE3_FK on INSCRIRE
(
   ID_PERSONNE
);

/*==============================================================*/
/* Table : PERSONNE                                             */
/*==============================================================*/
create table PERSONNE
(
   ID_PERSONNE                    int                            not null,
   ID_EQUIPE                      int                            not null,
   NOM_P                          char(60),
   PRENOM                         char(60),
   AGE                            int,
   DATE_NAISSANCE                 date,
   primary key (ID_PERSONNE)
)
ENGINE = InnoDB;

/*==============================================================*/
/* Index : CONSTITUER_FK                                        */
/*==============================================================*/
create index CONSTITUER_FK on PERSONNE
(
   ID_EQUIPE
);

/*==============================================================*/
/* Table : PRATIQUER                                            */
/*==============================================================*/
create table PRATIQUER
(
   ID_EQUIPE                      int                            not null,
   ID_SPORT                       int                            not null,
   ID_PERSONNE                    int                            not null,
   primary key (ID_EQUIPE, ID_SPORT, ID_PERSONNE)
)
ENGINE = InnoDB;

/*==============================================================*/
/* Index : PRATIQUER_FK                                         */
/*==============================================================*/
create index PRATIQUER_FK on PRATIQUER
(
   ID_EQUIPE
);

/*==============================================================*/
/* Index : PRATIQUER2_FK                                        */
/*==============================================================*/
create index PRATIQUER2_FK on PRATIQUER
(
   ID_SPORT
);

/*==============================================================*/
/* Index : PRATIQUER3_FK                                        */
/*==============================================================*/
create index PRATIQUER3_FK on PRATIQUER
(
   ID_PERSONNE
);

/*==============================================================*/
/* Table : SPORT                                                */
/*==============================================================*/
create table SPORT
(
   ID_SPORT                       int                            not null,
   LIBELLE_S                      char(60),
   primary key (ID_SPORT)
)
ENGINE = InnoDB;

alter table COMPETITION add constraint FK_ASSOCIER foreign key (ID_SPORT)
      references SPORT (ID_SPORT) on delete restrict on update restrict;

alter table INSCRIRE add constraint FK_INSCRIRE foreign key (ID_EQUIPE)
      references EQUIPE (ID_EQUIPE) on delete restrict on update restrict;

alter table INSCRIRE add constraint FK_INSCRIRE2 foreign key (ID_COMPETITION)
      references COMPETITION (ID_COMPETITION) on delete restrict on update restrict;

alter table INSCRIRE add constraint FK_INSCRIRE3 foreign key (ID_PERSONNE)
      references PERSONNE (ID_PERSONNE) on delete restrict on update restrict;

alter table PERSONNE add constraint FK_CONSTITUER foreign key (ID_EQUIPE)
      references EQUIPE (ID_EQUIPE) on delete restrict on update restrict;

alter table PRATIQUER add constraint FK_PRATIQUER foreign key (ID_EQUIPE)
      references EQUIPE (ID_EQUIPE) on delete restrict on update restrict;

alter table PRATIQUER add constraint FK_PRATIQUER2 foreign key (ID_SPORT)
      references SPORT (ID_SPORT) on delete restrict on update restrict;

alter table PRATIQUER add constraint FK_PRATIQUER3 foreign key (ID_PERSONNE)
      references PERSONNE (ID_PERSONNE) on delete restrict on update restrict;

