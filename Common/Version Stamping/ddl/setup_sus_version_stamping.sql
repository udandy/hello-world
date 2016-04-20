-- /* *******************************************************************************************
--    Author     : Jully Mohanty
--    Created    : 10/May/2012
--    Name       : setup_sus_version_stamping.sql
--    Purpose    : Insert Release Label
--    Assumption : None.
--    Notes      :
-- 
--    -----------------------------------------------------------------------------------------
--    Modification History
--    -----------------------------------------------------------------------------------------
--    Author                       Date            Version No      Description
--    -----------------------------------------------------------------------------------------
--    Jully M                     10/May/2012      0.1            Initial Version for 25.00.00
--   ------------------------------------------------------------------------------------------
--
-- ******************************************************************************************** */


set feedback off

spool setup_version_stamping_info.log

exec sus_version_stamp_pkg.apply_version('SUS','MSK_MSK-SUS_25.00.00','Y','Delivered on 20120908');

commit;

set serveroutput on size 1000000
exec sus_version_stamp_pkg.get_latest_version('SUS');
set feedback on
spool off
exit;
