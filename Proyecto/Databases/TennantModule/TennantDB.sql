/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     20/6/2023 22:34:03                           */
/*==============================================================*/


drop index TENNANT_PK;

drop table TENNANT;

drop index VEHICLE_PK;

drop table VEHICLE;

/*==============================================================*/
/* Table: TENNANT                                               */
/*==============================================================*/
create table TENNANT (
   TENNANTID            CHAR(4)              not null,
   TENNANTNAME          VARCHAR(32)          null,
   TENNATLASTNAME       VARCHAR(32)          null,
   TENNANTBIRTHDATE     DATE                 null,
   TENNANTUSERNAME      VARCHAR(32)          null,
   TENNANTPASSWORD      VARCHAR(32)          null,
   TENNANTEMAIL         VARCHAR(64)          null,
   TENNNANTSCORE        DECIMAL(2,1)         null,
   constraint PK_TENNANT primary key (TENNANTID)
);

/*==============================================================*/
/* Index: TENNANT_PK                                            */
/*==============================================================*/
create unique index TENNANT_PK on TENNANT (
TENNANTID
);

/*==============================================================*/
/* Table: VEHICLE                                               */
/*==============================================================*/
create table VEHICLE (
   TENNANTID            CHAR(4)              not null,
   VEHICLEID            CHAR(8)              not null,
   VEHICLEBRAND         VARCHAR(32)          null,
   VEHICLEMODEL         VARCHAR(32)          null,
   VEHICLEPLATE         VARCHAR(8)           null,
   VEHICLECOLOR         VARCHAR(32)          null,
   constraint PK_VEHICLE primary key (TENNANTID, VEHICLEID)
);

/*==============================================================*/
/* Index: VEHICLE_PK                                            */
/*==============================================================*/
create unique index VEHICLE_PK on VEHICLE (
TENNANTID,
VEHICLEID
);

alter table VEHICLE
   add constraint FK_VEHICLE_TENNANTVE_TENNANT foreign key (TENNANTID)
      references TENNANT (TENNANTID)
      on delete restrict on update restrict;

