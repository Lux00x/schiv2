DROP SCHEMA IF EXISTS SCHIV2;
CREATE SCHEMA SCHIV2 COLLATE utf8_bin;
USE SCHIV2;

CREATE TABLE SCHIV2_FACULTIES (
  facultyID INT(10) PRIMARY KEY,
  faculty VARCHAR(255) NOT NULL
);

CREATE TABLE SCHIV2_USERS (
  userID INT(10) PRIMARY KEY,
  firstname VARCHAR(64) NOT NULL,
  lastname VARCHAR(64) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(4000) NOT NULL,
  passwordHash INT(10) NOT NULL,
  status INT(1) NOT NULL DEFAULT 0,
  admin INT(1) NOT NULL DEFAULT 0,
  disabled INT(1) NOT NULL DEFAULT 0,
  facultyID INT(10),
  lastlogin DATE NOT NULL,

  FOREIGN KEY (facultyID) REFERENCES SCHIV2_FACULTIES(facultyID)
);

CREATE TABLE SCHIV2_MEETINGS (
  meetingID INT(10) PRIMARY KEY,
  dozentID INT(10) NOT NULL,
  description VARCHAR(255) NOT NULL,
  timeFrom DATE NOT NULL,
  timeTo DATE NOT NULL,
  units INT(5) NOT NULL DEFAULT 0,
  autoConfirmation INT(1) NOT NULL DEFAULT 0,
  deleted INT(1) NOT NULL DEFAULT 0,

  FOREIGN KEY (dozentID) REFERENCES SCHIV2_USERS(userID)
);

CREATE TABLE SCHIV2_INSCRIPTIONS (
  studentID INT(10) NOT NULL,
  meetingID INT(10) NOT NULL,
  confirmed INT(1) NOT NULL DEFAULT 0,
  note VARCHAR(4000),

  FOREIGN KEY (studentID) REFERENCES SCHIV2_USERS(userID),
  FOREIGN KEY (meetingID) REFERENCES SCHIV2_MEETINGS(meetingID)
);

CREATE TABLE SCHIV2_BLOCKED_STUDENTS (
  dozentID INT(10) NOT NULL,
  studentID INT(10) NOT NULL,
  note VARCHAR(255) NOT NULL,

  FOREIGN KEY (dozentID) REFERENCES SCHIV2_USERS(userID),
  FOREIGN KEY (studentID) REFERENCES SCHIV2_USERS(userID)
);

CREATE TABLE SCHIV2_MEETINGS_TEXT (
  text VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE SCHIV2_ROOT (
  id INT(1) NOT NULL PRIMARY KEY,
  password VARCHAR(4000) NOT NULL,
  passwordHash INT(10) NOT NULL
);
