CREATE LOGIN dbm_login WITH PASSWORD = 'k0h4mTk32d6';
CREATE USER dbm_user FOR LOGIN dbm_login;
GO
-- create master key encryption required to securely store the certificate
--
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'k0h4mTk32d6';
GO
-- import certificate with authorization to dbm_user
CREATE CERTIFICATE dbm_certificate   
    AUTHORIZATION dbm_user
    FROM FILE = '/usr/certificate/dbm_certificate.cer'
    WITH PRIVATE KEY (
    FILE = '/usr/certificate/dbm_certificate.pvk',
    DECRYPTION BY PASSWORD = 'k0h4mTk32d6'
)
GO
-- Create the endpoint
--
CREATE ENDPOINT [Hadr_endpoint]
    AS TCP (LISTENER_IP = (0.0.0.0), LISTENER_PORT = 5022)
    FOR DATA_MIRRORING (
        ROLE = ALL,
        AUTHENTICATION = CERTIFICATE dbm_certificate,
        ENCRYPTION = REQUIRED ALGORITHM AES
        );
ALTER ENDPOINT [Hadr_endpoint] STATE = STARTED;
GRANT CONNECT ON ENDPOINT::[Hadr_endpoint] TO [dbm_login]
GO


ALTER AVAILABILITY GROUP [AG1] JOIN WITH (CLUSTER_TYPE = NONE);
ALTER AVAILABILITY GROUP [AG1] GRANT CREATE ANY DATABASE;
ALTER AVAILABILITY GROUP [AG1] ADD Database [choma]
 SELECT * FROM sys.databases WHERE name = 'choma';


 SELECT DB_NAME(database_id) AS 'choma', synchronization_state_desc FROM sys.dm_hadr_database_replica_states;