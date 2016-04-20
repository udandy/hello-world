-- ******************************************************************************
-- Author     : Akash Jain
-- Created    : 07-05-2012
-- Name       : sus_users_R12.sql
-- Purpose    : To create user for R12
-- Assumption : None.
-- Notes      :
--
-- -------------------------------------------------------------------------------
-- Modification History
-- -------------------------------------------------------------------------------
-- Author                  Date        Version No     Description
-- -------------------------------------------------------------------------------
-- Akash Jain            09-05-2012    1.0            Initial version SUS R12.
-- Ishwari T             23-July-2012  1.1            Initial version R12 D1 P2
-- ******************************************************************************

spool sus_users_R12.log


Prompt
Prompt Creating user SAR...
Prompt

set scan on


accept name prompt "Enter name of the TEMP tablespace : "
prompt
prompt '  Is the name entered above correct ?'
prompt
pause Press Enter to Execute or CTRL + C to Exit

-- User Creation
CREATE USER &&env._SAR
IDENTIFIED BY &&env._SAR
DEFAULT TABLESPACE SAR_DATA
TEMPORARY TABLESPACE &&name
PROFILE DEFAULT
ACCOUNT UNLOCK;

-- Role
GRANT RESOURCE TO &&env._SAR;
GRANT CONNECT  TO &&env._SAR;
ALTER USER &&env._SAR DEFAULT ROLE ALL;

-- System Privileges
GRANT CREATE SESSION           TO &&env._SAR;
GRANT ALTER SESSION            TO &&env._SAR;
GRANT SELECT ANY DICTIONARY    TO &&env._SAR;
GRANT CREATE PUBLIC SYNONYM    TO &&env._SAR;
GRANT CREATE SYNONYM           TO &&env._SAR;
GRANT UNLIMITED TABLESPACE     TO &&env._SAR;
GRANT CREATE MATERIALIZED VIEW TO &&env._SAR;
GRANT CREATE SEQUENCE          TO &&env._SAR;
--GRANT DROP PUBLIC SYNONYM      TO &&env._SAR;
GRANT CREATE VIEW              TO &&env._SAR;
GRANT GLOBAL QUERY REWRITE     TO &&env._SAR;
GRANT CREATE DATABASE LINK     TO &&env._SAR;
GRANT CREATE CLUSTER           TO &&env._SAR;
GRANT CREATE TABLE             TO &&env._SAR;
--GRANT ALTER  ANY TABLE         TO &&env._SAR;
--GRANT ALTER  ANY INDEX         TO &&env._SAR;
--GRANT CREATE ANY TABLE         TO &&env._SAR;
--GRANT CREATE ANY INDEX         TO &&env._SAR;
GRANT CREATE PROCEDURE         TO &&env._SAR;
GRANT SELECT ANY DICTIONARY    TO &&env._SAR;
GRANT SELECT ANY TABLE         TO &&env._SAR;
--GRANT DROP ANY TABLE           TO &&env._SAR;
GRANT CREATE ANY DIRECTORY     TO &&env._SAR;

GRANT DELETE ANY TABLE         TO &&env._HOUSEKEEPING;

-- Ver 1.1 Started
GRANT EXECUTE ON DBMS_LOCK TO &&env._SAR;
-- Ver 1.1 Ended

set scan off

spool off;
