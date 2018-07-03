DROP TABLE "SCHIV2_BLOCKED_STUDENTS" cascade constraints;
DROP TABLE "SCHIV2_INSCRIPTIONS"cascade constraints;
DROP TABLE "SCHIV2_MEETINGS" cascade constraints;
DROP TABLE "SCHIV2_USERS" cascade constraints;
DROP TABLE "SCHIV2_FACULTIES" cascade constraints;
DROP TABLE "SCHIV2_ROOT" cascade constraints;
DROP TABLE "SCHIV2_MEETING_TEXT" cascade constraints;

CREATE TABLE "SCHIV2_FACULTIES"
   (    "FACULTYID" NUMBER(3,0) NOT NULL ENABLE,
    "FACULTY" VARCHAR2(255) NOT NULL ENABLE,
     CONSTRAINT "SCHIV2_FACULTIES_PK" PRIMARY KEY ("FACULTYID") ENABLE,
     CONSTRAINT "SCHIV2_FACULTIES_UK1" UNIQUE ("FACULTY") ENABLE
   ) ;

CREATE OR REPLACE TRIGGER  "BI_SCHIV2_FACULTIES"
  before insert on "SCHIV2_FACULTIES"
  for each row
declare
  id SCHIV2_FACULTIES.FACULTYID%TYPE;
begin
  if :NEW."FACULTYID" is null then
    select count(facultyid) into id from schiv2_faculties;
      if id = 0 then
          :NEW."FACULTYID" := 1;
      else
          select MIN(facultyid) -1 into id from SCHIV2_faculties;
          if id = 0 then
              select case when MAX(facultyid) = count(facultyid) then 0 else 1 end into id from SCHIV2_faculties;
              if id = 1 then
                  select facultyid + 1 into id from (select facultyid, lead(facultyid) over(order by facultyid) nextuserid from SCHIV2_faculties) where facultyid <> facultyid - 1 AND rownum <= 1;
              end if;
          end if;
          if id != 0 then
              :NEW."FACULTYID" := id;
          else
              select MAX(facultyid) +1 into :NEW."FACULTYID" from schiv2_faculties;
          end if;
      end if;
  end if;
end;
/
ALTER TRIGGER  "BI_SCHIV2_FACULTIES" ENABLE;


----------------------------------------------------------------------------------


CREATE TABLE "SCHIV2_USERS" (
    "USERID" NUMBER(10,0) NOT NULL ENABLE,
    "FIRSTNAME" VARCHAR2(64) NOT NULL ENABLE,
    "LASTNAME" VARCHAR2(64) NOT NULL ENABLE,
    "EMAIL" VARCHAR2(255) NOT NULL ENABLE,
    "PASSWORD" VARCHAR2(4000) NOT NULL ENABLE,
    "PASSWORDHASH" NUMBER(10) NOT NULL ENABLE,
    "DOZENT" NUMBER(1,0) NOT NULL ENABLE,
    "ADMIN" NUMBER(1,0) NOT NULL ENABLE,
    "DISABLED" NUMBER(1,0) NOT NULL ENABLE,
    "FACULTYID" NUMBER(3,0),
    "LASTLOGIN" TIMESTAMP NOT NULL ENABLE,
     CONSTRAINT "SCHIV2_USERS_PK" PRIMARY KEY ("USERID") ENABLE,
     CONSTRAINT "SCHIV2_USERS_UK1" UNIQUE ("EMAIL") ENABLE
   ) ;
 ALTER TABLE  "SCHIV2_USERS" ADD CONSTRAINT "SCHIV2_USERS_FK" FOREIGN KEY ("FACULTYID")
      REFERENCES  "SCHIV2_FACULTIES" ("FACULTYID") ON DELETE SET NULL ENABLE;


create or replace TRIGGER "BI_SCHIV2_USERS"
  before insert on "SCHIV2_USERS"
for each row
declare
  id SCHIV2_USERS.USERID%TYPE;
begin
  if :NEW."USERID" is null then
      select count(userid) into id from schiv2_users;
      if id = 0 then
          :NEW."USERID" := 1;
      else
          select MIN(userid) -1 into id from SCHIV2_USERS;
          if id = 0 then
              select case when MAX(userid) = count(userid) then 0 else 1 end into id from SCHIV2_USERS;
              if id = 1 then
                  select userid + 1 into id from (select userid, lead(userid) over(order by userid) nextuserid from SCHIV2_USERS) where userid <> nextuserid - 1 AND rownum <= 1;
              end if;
          end if;
          if id != 0 then
              :NEW."USERID" := id;
          else
              select MAX(userid) +1 into :NEW."USERID" from schiv2_users;
          end if;
      end if;
  end if;
  if :NEW."DOZENT" is null then
      :new."DOZENT" := 0;
  end if;
  if :NEW."ADMIN" is null then
      :NEW."ADMIN" := 0;
  end if;
  if :NEW."DISABLED" is null then
      :NEW."DISABLED" := 0;
  end if;
  if :NEW."LASTLOGIN" is null then
      :NEW."LASTLOGIN" := sysdate;
  end if;
  if :NEW."PASSWORDHASH" is not null then
      :NEW."PASSWORDHASH" := NULL;
  end if;
  if :NEW."PASSWORD" is not null AND :NEW."PASSWORD" != 'password' then
      select ORA_HASH(:NEW."PASSWORD") into :NEW."PASSWORDHASH" from dual;
      :NEW."PASSWORD" := 'password';
  end if;
end;

/
ALTER TRIGGER "BI_SCHIV2_USERS" ENABLE;

create or replace TRIGGER "BU_SCHIV2_USERS"
  before update on "SCHIV2_USERS"
for each row
declare
  id SCHIV2_USERS.USERID%TYPE;
begin
  if :NEW."PASSWORD" is not null AND :NEW."PASSWORD" != 'password' then
      select ORA_HASH(:NEW."PASSWORD") into :NEW."PASSWORDHASH" from dual;
      :NEW."PASSWORD" := 'password';
  end if;
end;

/
ALTER TRIGGER "BU_SCHIV2_USERS" ENABLE;


----------------------------------------------------------------------------------


CREATE TABLE  "SCHIV2_MEETINGS"
   (    "MEETINGID" NUMBER(10,0) NOT NULL ENABLE,
    "DOZENTID" NUMBER(10,0) NOT NULL ENABLE,
    "DESCRIPTION" VARCHAR2(255) NOT NULL ENABLE,
    "TIMEFROM" TIMESTAMP NOT NULL ENABLE,
    "TIMETO" TIMESTAMP NOT NULL ENABLE,
    "UNITS" NUMBER(5,0) NOT NULL ENABLE,
    "AUTOCONFIRMATION" NUMBER(1,0) NOT NULL ENABLE,
    "DELETED" NUMBER(1,0) NOT NULL ENABLE,
     CONSTRAINT "SCHIV2_MEETINGS_PK" PRIMARY KEY ("MEETINGID") ENABLE
   ) ;
 ALTER TABLE  "SCHIV2_MEETINGS" ADD CONSTRAINT "SCHIV2_MEETINGS_FK" FOREIGN KEY ("DOZENTID")
      REFERENCES  "SCHIV2_USERS" ("USERID") ON DELETE CASCADE ENABLE;

create or replace TRIGGER  "BI_SCHIV2_MEETINGS"
  before insert on "SCHIV2_MEETINGS"
  for each row
declare
    id SCHIV2_MEETINGS.MEETINGID%TYPE := 0;
begin
    if :NEW."MEETINGID" is null then
        select count(meetingid) into id from schiv2_meetings;
        if id = 0 then
            :NEW."MEETINGID" := 1;
        else
            select MIN(MEETINGID) -1 into id from SCHIV2_MEETINGS;
            if id = 0 then
                select case when MAX(meetingid) = count(meetingid) then 0 else 1 end into id from SCHIV2_MEETINGS;
                if id = 1 then
                    select MEETINGID + 1 into id from (select MEETINGID, lead(MEETINGID) over(order by MEETINGID) nextmeeetingid from SCHIV2_MEETINGS) where MEETINGID <> nextmeeetingid - 1 AND rownum <= 1;
                end if;
            end if;
            if id != 0 then
                :NEW."MEETINGID" := id;
            else
                select MAX(meetingid) +1 into :NEW."MEETINGID" from schiv2_meetings;
            end if;
        end if;
    end if;
    if :NEW."AUTOCONFIRMATION" is null then
        :NEW."AUTOCONFIRMATION" := 0;
    end if;
    if :NEW."DELETED" is null then
        :NEW."DELETED" := 0;
    end if;
end;
/
ALTER TRIGGER  "BI_SCHIV2_MEETINGS" ENABLE;


----------------------------------------------------------------------------------


CREATE TABLE  "SCHIV2_INSCRIPTIONS"
   (    "MEETINGID" NUMBER(10,0) NOT NULL ENABLE,
    "STUDENTID" NUMBER(10,0) NOT NULL ENABLE,
    "CONFIRMED" NUMBER(1,0) NOT NULL ENABLE,
    "NOTE" VARCHAR2(4000),
     CONSTRAINT "SCHIV2_INSCRIPTIONS_UK1" UNIQUE ("MEETINGID", "STUDENTID") ENABLE
   ) ;
 ALTER TABLE  "SCHIV2_INSCRIPTIONS" ADD CONSTRAINT "SCHIV2_INSCRIPTIONS_FK" FOREIGN KEY ("MEETINGID")
      REFERENCES  "SCHIV2_MEETINGS" ("MEETINGID") ON DELETE CASCADE ENABLE;
 ALTER TABLE  "SCHIV2_INSCRIPTIONS" ADD CONSTRAINT "SCHIV2_INSCRIPTIONS_FK2" FOREIGN KEY ("STUDENTID")
      REFERENCES  "SCHIV2_USERS" ("USERID") ON DELETE CASCADE ENABLE;

CREATE OR REPLACE TRIGGER "BI_SCHIV2_INSCRIPTIONS"
  before insert on "SCHIV2_INSCRIPTIONS"
  for each row
begin
  if :NEW."CONFIRMED" is null then
      :NEW."CONFIRMED" := 0;
  end if;
end;
/
ALTER TRIGGER "BI_SCHIV2_INSCRIPTIONS" ENABLE;


----------------------------------------------------------------------------------


CREATE TABLE  "SCHIV2_BLOCKED_STUDENTS"
   (    "DOZENTID" NUMBER(10,0) NOT NULL ENABLE,
    "STUDENTID" NUMBER(10,0) NOT NULL ENABLE,
    "NOTE" VARCHAR2(255) NOT NULL ENABLE,
     CONSTRAINT "SCHIV2_BLOCKED_STUDENTS_UK1" UNIQUE ("DOZENTID", "STUDENTID") ENABLE
   ) ;
 ALTER TABLE  "SCHIV2_BLOCKED_STUDENTS" ADD CONSTRAINT "SCHIV2_BLOCKED_STUDENTS_FK" FOREIGN KEY ("DOZENTID")
      REFERENCES  "SCHIV2_USERS" ("USERID") ON DELETE CASCADE ENABLE;
 ALTER TABLE  "SCHIV2_BLOCKED_STUDENTS" ADD CONSTRAINT "SCHIV2_BLOCKED_STUDENTS_FK2" FOREIGN KEY ("STUDENTID")
      REFERENCES  "SCHIV2_USERS" ("USERID") ON DELETE CASCADE ENABLE;


----------------------------------------------------------------------------------


CREATE TABLE  "SCHIV2_MEETING_TEXT"
   (    "TEXT" VARCHAR2(255) NOT NULL ENABLE,
     CONSTRAINT "SCHIV2_MEETING_TEXT_UK1" UNIQUE ("TEXT") ENABLE
   ) ;

INSERT INTO SCHIV2_MEETING_TEXT (TEXT) VALUES('Sprechstunde');
INSERT INTO SCHIV2_MEETING_TEXT (TEXT) VALUES('Noteneinsicht');

----------------------------------------------------------------------------------


CREATE TABLE  "SCHIV2_ROOT"
   (    "ID" NUMBER(1,0) NOT NULL ENABLE,
    "PASSWORD" VARCHAR(4000) NOT NULL ENABLE,
    "PASSWORDHASH" NUMBER(10) NOT NULL ENABLE,
     CONSTRAINT "SCHIV2_ROOT_PK" PRIMARY KEY ("ID") ENABLE
   ) ;

CREATE OR REPLACE TRIGGER  "BI_SCHIV2_ROOT"
  before insert or update on "SCHIV2_ROOT"
  for each row
begin
  :NEW."ID" := 1;
  if :NEW."PASSWORDHASH" is not null then
      :NEW."PASSWORDHASH" := NULL;
  end if;
  if :NEW."PASSWORD" is not null then
      select ORA_HASH(:NEW."PASSWORD") into :NEW."PASSWORDHASH" from dual;
      :NEW."PASSWORD" := 'password';
  end if;
end;

/
ALTER TRIGGER "BI_SCHIV2_ROOT" ENABLE;

insert into schiv2_root(password) values ('schiv2');


----------------------------------------------------------------------------------


create or replace function "SCHIV2_LOGIN"
  (p_username in SCHIV2_USERS.EMAIL%TYPE,
   p_password in VARCHAR2)
return BOOLEAN
is
    pw SCHIV2_USERS.PASSWORDHASH%TYPE;
    pw_ SCHIV2_USERS.PASSWORDHASH%TYPE;
begin
    select ORA_HASH(p_password)
      into pw_
      from dual;

    SELECT PASSWORDHASH
      into pw
      FROM SCHIV2_USERS
      WHERE EMAIL = p_username
        and disabled = 0;

    return pw = pw_;
exception
    when NO_DATA_FOUND then
    return false;
end;

/


----------------------------------------------------------------------------------


create or replace function "SCHIV2_ROOT_LOGIN"
  (p_password in VARCHAR2)
return BOOLEAN
is
    pw SCHIV2_ROOT.PASSWORDHASH%TYPE;
    pw_ SCHIV2_ROOT.PASSWORDHASH%TYPE;
begin
    select ORA_HASH(p_password)
      into pw_
      from dual;

    SELECT PASSWORDHASH into pw
    FROM SCHIV2_ROOT
    WHERE id = 1;

    return pw = pw_;
exception
    when NO_DATA_FOUND then
    return false;
end;