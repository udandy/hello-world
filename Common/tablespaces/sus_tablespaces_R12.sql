-- ******************************************************************************
-- Author     : Akash Jain
-- Created    : 09-05-2012
-- Name       : sus_tablespaces_R12.sql
-- Purpose    : To create tablespace for R12
-- Assumption : None.
-- Notes      :
--
-- -------------------------------------------------------------------------------
-- Modification History
-- -------------------------------------------------------------------------------
-- Author                  Date               Version No    Description
-- -------------------------------------------------------------------------------
-- Akash Jain            09-05-2012    1.0               Initial version SUS R12.
-- ******************************************************************************

set scan on
 
spool sus_tablespaces_R12.log

accept path prompt "Enter Path For File to create sar data tablespace : "
prompt
prompt '  Is the path entered above correct ?'
prompt
pause Press Enter to Execute or CTRL + C to Exit

CREATE TABLESPACE "SAR_DATA" 
    LOGGING 
    DATAFILE '&&path./SAR_DATA.DBF' SIZE 
    1000M REUSE EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT 
    AUTO;

accept path1 prompt "Enter Path For File to create sar index data tablespace : "
prompt
prompt '  Is the path entered above correct ?'
prompt
pause Press Enter to Execute or CTRL + C to Exit
    
CREATE TABLESPACE "SAR_INDX_DATA" 
    LOGGING 
    DATAFILE '&&path1./SAR_INDX_DATA.DBF' SIZE 
    1000M REUSE EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT 
    AUTO;

spool off

set scan off

exit;
