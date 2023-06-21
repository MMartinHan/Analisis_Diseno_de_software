/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     20/6/2023 12:19:04                           */
/*==============================================================*/


drop table ADDRESS;

drop table OWNER;

drop table PARKINGLAND;

drop table PARKINGLOT;

/*==============================================================*/
/* Table: ADDRESS                                               */
/*==============================================================*/
create table ADDRESS (
   ADDRESSID            CHAR(16)             not null,
   ADDRESSMAINSTREET    VARCHAR(32)          null,
   ADDRESSBACKSTREET    VARCHAR(32)          null,
   ADDRESSLATITUDE      DECIMAL(9,7)         null,
   ADDRESSLONGITUDE     DECIMAL(9,7)         null,
   constraint PK_ADDRESS primary key (ADDRESSID)
);

/*==============================================================*/
/* Table: OWNER                                                 */
/*==============================================================*/
create table OWNER (
   OWNERID              CHAR(4)              not null,
   OWNERNAME            VARCHAR(32)          null,
   OWNERLASTNAME        VARCHAR(32)          null,
   OWNERBIRTHDATE       DATE                 null,
   OWNERUSERNAME        VARCHAR(32)          null,
   OWNERPASSWORD        VARCHAR(32)          null,
   OWNEREMAIL           VARCHAR(64)          null,
   OWNERSCORE           DECIMAL(2,1)         null,
   constraint PK_OWNER primary key (OWNERID)
);

/*==============================================================*/
/* Table: PARKINGLAND                                           */
/*==============================================================*/
create table PARKINGLAND (
   OWNERID              CHAR(4)              not null,
   PLID                 CHAR(8)              not null,
   ADDRESSID            CHAR(16)             not null,
   PLSIZE               NUMERIC(2,0)         null,
   PLPROPERTYDOCUMENT   CHAR                 null,
   constraint PK_PARKINGLAND primary key (OWNERID, PLID)
);

/*==============================================================*/
/* Table: PARKINGLOT                                            */
/*==============================================================*/
create table PARKINGLOT (
   OWNERID              CHAR(4)              not null,
   PLID                 CHAR(8)              not null,
   PLOTID               CHAR(8)              not null,
   PLOTSTATUS           VARCHAR(16)          null,
   PLOTLENGTH           DECIMAL(4,2)         null,
   PLOTWIDTH            DECIMAL(4,2)         null,
   constraint PK_PARKINGLOT primary key (OWNERID, PLID, PLOTID)
);

alter table PARKINGLAND
   add constraint FK_PARKINGL_ADDRESSPA_ADDRESS foreign key (ADDRESSID)
      references ADDRESS (ADDRESSID)
      on delete restrict on update restrict;

alter table PARKINGLAND
   add constraint FK_PARKINGL_OWNERPARK_OWNER foreign key (OWNERID)
      references OWNER (OWNERID)
      on delete restrict on update restrict;

alter table PARKINGLOT
   add constraint FK_PARKINGL_PLANDPLOT_PARKINGL foreign key (OWNERID, PLID)
      references PARKINGLAND (OWNERID, PLID)
      on delete restrict on update restrict;

