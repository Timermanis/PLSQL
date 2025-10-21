--BEGIN
--  DBMS_CLOUD.CREATE_CREDENTIAL(
--        credential_name => 'DB_LINK_CRED',
--        username => 'ADMIN',
--        password => '' );
--END;

BEGIN
  DBMS_CLOUD_ADMIN.CREATE_DATABASE_LINK(
    db_link_name    => 'LINK_TO_APEX_DB',    -- The name of the new database link
    hostname        => 'PVSGKAIGRNLNNIF.adb.uk-london-1.oraclecloud.com',   -- The hostname of the target DB
    port            => '1522',                 -- Typically 1522 for secure/private ADB connections
    service_name    => 'PVSGKAIGRNLNNIF_JANIS',  -- The service name (e.g., 'pdb1_high')
    credential_name => 'DB_LINK_CRED',
    --private_target  => TRUE,                    -- Must be TRUE for private endpoints
    directory_name => NULL
  );
END;
--https://forums.oracle.com/ords/apexds/post/how-to-create-db-link-between-two-autonomous-database-with-8850
BEGIN
     DBMS_CLOUD_ADMIN.DROP_DATABASE_LINK(
          db_link_name => 'LINK_TO_APEX_DB' );
END;


select * FROM v$pdbs; -– Note down the NAME PVSGKAIGRNLNNIF_JANIS
SELECT * FROM DBA_DB_LINKS
SELECT * FROM dual@LINK_TO_APEX_DB;

SELECT 'Connection successful to ' || global_name FROM global_name@LINK_TO_APEX_DB;

select decode (host_name,'Server A','oracleserver.db.com',
'Server B','oracleserver.db.com'),  UPPER(instance_name)
from v$instance

select *
from v$instance

DROP public DATABASE LINK LINK_TO_APEX_DB

CREATE [PUBLIC] DATABASE LINK <link_name>
CONNECT TO <target_username> IDENTIFIED BY <target_password>
USING '(DESCRIPTION=
          (ADDRESS=(PROTOCOL=TCP)(HOST=<target_hostname_or_ip>)(PORT=<target_port>))
          (CONNECT_DATA=(SERVICE_NAME=<target_service_name>)))';

--(description= (retry_count=20)(retry_delay=3)(address=(protocol=tcps)(port=1522)(host=adb.uk-london-1.oraclecloud.com))(connect_data=(service_name=pvsgkaigrnlnnif_janis_high.adb.oraclecloud.com))(security=(ssl_server_dn_match=yes)))