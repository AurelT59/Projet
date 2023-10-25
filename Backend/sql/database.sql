/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  24/10/2023 17:19:11                      */
/*==============================================================*/


drop table if exists ALIMENTS;

drop table if exists COMPOSITION;

drop table if exists COMPOSITION_NUTRITIVE;

drop table if exists INGREDIENTS;

drop table if exists JOURNAL;

drop table if exists NUTRIMENTS;

drop table if exists PRATIQUE_SPORTIVE;

drop table if exists RECOMMENDATIONS;

drop table if exists SEXE;

drop table if exists UTILISATEURS;

/*==============================================================*/
/* Table : ALIMENTS                                             */
/*==============================================================*/
create table ALIMENTS
(
   CODE                 int not null,
   PRODUIT              varchar(256),
   QUANTITE             int,
   PORTION              int,
   MARQUE               varchar(256),
   ENERGY_KCAL_VALUE    int,
   NUTRISCORE_GRADE     varchar(256),
   CATEGORIES           varchar(256),
   primary key (CODE)
);

/*==============================================================*/
/* Table : COMPOSITION                                          */
/*==============================================================*/
create table COMPOSITION
(
   CODE                 int not null,
   ID_INGREDIENT        int not null,
   POURCENTAGE          int,
   primary key (CODE, ID_INGREDIENT)
);

/*==============================================================*/
/* Table : COMPOSITION_NUTRITIVE                                */
/*==============================================================*/
create table COMPOSITION_NUTRITIVE
(
   CODE                 int not null,
   ID_NUTRIMENT         int not null,
   VALEUR               int,
   primary key (CODE, ID_NUTRIMENT)
);

/*==============================================================*/
/* Table : INGREDIENTS                                          */
/*==============================================================*/
create table INGREDIENTS
(
   ID_INGREDIENT        int not null,
   NOM                  varchar(40),
   primary key (ID_INGREDIENT)
);

/*==============================================================*/
/* Table : JOURNAL                                              */
/*==============================================================*/
create table JOURNAL
(
   ID_JOURNAL           int not null,
   CODE                 int not null,
   IDENTIFIANT          varchar(20) not null,
   QUANTITE             int,
   DATE                 date,
   primary key (ID_JOURNAL)
);

/*==============================================================*/
/* Table : NUTRIMENTS                                           */
/*==============================================================*/
create table NUTRIMENTS
(
   ID_NUTRIMENT         int not null,
   NOM                  varchar(40),
   primary key (ID_NUTRIMENT)
);

/*==============================================================*/
/* Table : PRATIQUE_SPORTIVE                                    */
/*==============================================================*/
create table PRATIQUE_SPORTIVE
(
   ID_SPORTIF           int not null,
   NOM                  varchar(40),
   primary key (ID_SPORTIF)
);

/*==============================================================*/
/* Table : RECOMMENDATIONS                                      */
/*==============================================================*/
create table RECOMMENDATIONS
(
   IDENTIFIANT          varchar(20) not null,
   ID_NUTRIMENT         int not null,
   QUANTITE             int,
   primary key (IDENTIFIANT, ID_NUTRIMENT)
);

/*==============================================================*/
/* Table : SEXE                                                 */
/*==============================================================*/
create table SEXE
(
   ID_SEXE              int not null,
   NOM                  varchar(40),
   primary key (ID_SEXE)
);

/*==============================================================*/
/* Table : UTILISATEURS                                         */
/*==============================================================*/
create table UTILISATEURS
(
   IDENTIFIANT          varchar(20) not null,
   ID_SPORTIF           int not null,
   ID_SEXE              int,
   MOT_DE_PASSE         varchar(30),
   PRENOM               varchar(40),
   NOM                  varchar(40),
   AGE                  int,
   primary key (IDENTIFIANT)
);

alter table COMPOSITION add constraint FK_COMPOSITION foreign key (CODE)
      references ALIMENTS (CODE) on delete restrict on update restrict;

alter table COMPOSITION add constraint FK_COMPOSITION2 foreign key (ID_INGREDIENT)
      references INGREDIENTS (ID_INGREDIENT) on delete restrict on update restrict;

alter table COMPOSITION_NUTRITIVE add constraint FK_COMPOSITION_NUTRITIVE foreign key (CODE)
      references ALIMENTS (CODE) on delete restrict on update restrict;

alter table COMPOSITION_NUTRITIVE add constraint FK_COMPOSITION_NUTRITIVE2 foreign key (ID_NUTRIMENT)
      references NUTRIMENTS (ID_NUTRIMENT) on delete restrict on update restrict;

alter table JOURNAL add constraint FK_CONTIENT2 foreign key (CODE)
      references ALIMENTS (CODE) on delete restrict on update restrict;

alter table JOURNAL add constraint FK_CONTIENT3 foreign key (IDENTIFIANT)
      references UTILISATEURS (IDENTIFIANT) on delete restrict on update restrict;

alter table RECOMMENDATIONS add constraint FK_RECOMMENDATIONS foreign key (IDENTIFIANT)
      references UTILISATEURS (IDENTIFIANT) on delete restrict on update restrict;

alter table RECOMMENDATIONS add constraint FK_RECOMMENDATIONS2 foreign key (ID_NUTRIMENT)
      references NUTRIMENTS (ID_NUTRIMENT) on delete restrict on update restrict;

alter table UTILISATEURS add constraint FK_CONTIENT4 foreign key (ID_SPORTIF)
      references PRATIQUE_SPORTIVE (ID_SPORTIF) on delete restrict on update restrict;

alter table UTILISATEURS add constraint FK_CONTIENTSEXE foreign key (ID_SEXE)
      references SEXE (ID_SEXE) on delete restrict on update restrict;

