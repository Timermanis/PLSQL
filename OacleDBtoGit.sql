begin
  dbms_cloud.create_credential(
    credential_name => 'GITHUB_CREDENTIAL',
    username => 'witold.swierzy@oracle.com',
    password => '<access token>'
  );
end;
/
---------///------------------------------------------
declare
  l_repo_handle clob; -- CLOB object will contain a JSON document 
                      -- containing all the details required to connect to a GitHub account
begin
  -- below code initializes the connection to a GitHub account and repository
  l_repo_handle := dbms_cloud_repo.init_github_repo(
    credential_name => 'GITHUB_CREDENTIAL', 
    owner => 'witold-swierzy',                -- GitHub username 
    repo_name => 'sql_horizontal_aggregation' -- name of the repository
  );
  dbms_cloud_repo.install_file(      -- download and execute a SQL script
    repo => l_repo_handle,           -- CLOB connection descriptor
    file_path => 'json_arr.sql',     -- name of the file we want to download and execute
    stop_on_error => true            -- stop in case of any error 
  );
end;
/