/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     20/6/2023 22:41:24                           */
/*==============================================================*/


drop index BOOKING_PK;

drop table BOOKING;

drop index PAYMENTOPERATION_PK;

drop table PAYMENTOPERATION;

/*==============================================================*/
/* Table: BOOKING                                               */
/*==============================================================*/
create table BOOKING (
   BOOKINGID            CHAR(16)             not null,
   TENNANTID            CHAR(4)              not null,
   VEHICLEID            CHAR(8)              not null,
   OWNERID              CHAR(4)              not null,
   PLID                 CHAR(8)              not null,
   PLOTID               CHAR(8)              not null,
   BOOKINGENTRYDATE     DATE                 null,
   BOOKINGDEPARTUREDATE DATE                 null,
   BOOKINGENTRYTIME     TIME                 null,
   BOOKINGDEPARTURETIME TIME                 null,
   BOOKINGCOST          DECIMAL(4,2)         null,
   constraint PK_BOOKING primary key (BOOKINGID)
);

/*==============================================================*/
/* Index: BOOKING_PK                                            */
/*==============================================================*/
create unique index BOOKING_PK on BOOKING (
BOOKINGID
);

/*==============================================================*/
/* Table: PAYMENTOPERATION                                      */
/*==============================================================*/
create table PAYMENTOPERATION (
   BOOKINGID            CHAR(16)             not null,
   POID                 CHAR(16)             not null,
   POTYPE               VARCHAR(32)          null,
   POAMOUNT             DECIMAL(8,2)         null,
   PODATE               DATE                 null,
   constraint PK_PAYMENTOPERATION primary key (BOOKINGID, POID)
);

/*==============================================================*/
/* Index: PAYMENTOPERATION_PK                                   */
/*==============================================================*/
create unique index PAYMENTOPERATION_PK on PAYMENTOPERATION (
BOOKINGID,
POID
);

alter table PAYMENTOPERATION
   add constraint FK_PAYMENTO_BOOKINGPA_BOOKING foreign key (BOOKINGID)
      references BOOKING (BOOKINGID)
      on delete restrict on update restrict;

