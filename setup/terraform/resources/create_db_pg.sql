CREATE ROLE scm LOGIN PASSWORD :'the_pwd';
CREATE DATABASE scm OWNER scm ENCODING 'UTF8';

CREATE ROLE amon LOGIN PASSWORD :'the_pwd';
CREATE DATABASE amon OWNER amon ENCODING 'UTF8';

CREATE ROLE rman LOGIN PASSWORD :'the_pwd';
CREATE DATABASE rman OWNER rman ENCODING 'UTF8';

CREATE ROLE hue LOGIN PASSWORD :'the_pwd';
CREATE DATABASE hue OWNER hue ENCODING 'UTF8';

CREATE ROLE hive LOGIN PASSWORD :'the_pwd';
CREATE DATABASE metastore OWNER hive ENCODING 'UTF8';

CREATE ROLE sentry LOGIN PASSWORD :'the_pwd';
CREATE DATABASE sentry OWNER sentry ENCODING 'UTF8';

CREATE ROLE nav LOGIN PASSWORD :'the_pwd';
CREATE DATABASE nav OWNER nav ENCODING 'UTF8';

CREATE ROLE navms LOGIN PASSWORD :'the_pwd';
CREATE DATABASE navms OWNER navms ENCODING 'UTF8';

CREATE ROLE oozie LOGIN PASSWORD :'the_pwd';
CREATE DATABASE oozie OWNER oozie ENCODING 'UTF8';

CREATE ROLE das LOGIN PASSWORD :'the_pwd';
CREATE DATABASE das OWNER das ENCODING 'UTF8';

CREATE ROLE efm LOGIN PASSWORD :'the_pwd';
CREATE DATABASE efm OWNER efm ENCODING 'UTF8';

CREATE ROLE nifireg LOGIN PASSWORD :'the_pwd';
CREATE DATABASE nifireg OWNER nifireg ENCODING 'UTF8';

CREATE ROLE registry LOGIN PASSWORD :'the_pwd';
CREATE DATABASE registry OWNER registry ENCODING 'UTF8';

CREATE ROLE streamsmsgmgr LOGIN PASSWORD :'the_pwd';
CREATE DATABASE streamsmsgmgr OWNER streamsmsgmgr ENCODING 'UTF8';

CREATE ROLE ranger LOGIN PASSWORD :'the_pwd';
CREATE DATABASE ranger OWNER ranger ENCODING 'UTF8';

CREATE USER rangeradmin WITH PASSWORD :'the_pwd';
GRANT ALL PRIVILEGES ON DATABASE ranger TO rangeradmin;

CREATE USER eventador_admin WITH PASSWORD :'the_pwd';
CREATE DATABASE eventador_admin OWNER eventador_admin ENCODING 'UTF8';

CREATE USER eventador_snapper WITH PASSWORD :'the_pwd';
CREATE DATABASE eventador_snapper OWNER eventador_snapper ENCODING 'UTF8';

-- ECS databases
CREATE ROLE ecs LOGIN PASSWORD :'the_pwd';
CREATE DATABASE "db-env" OWNER ecs ENCODING 'UTF8';
CREATE DATABASE "db-mlx" OWNER ecs ENCODING 'UTF8';
CREATE DATABASE "db-dwx" OWNER ecs ENCODING 'UTF8';
CREATE DATABASE "db-liftie" OWNER ecs ENCODING 'UTF8';
CREATE DATABASE "db-dex" OWNER ecs ENCODING 'UTF8';
CREATE DATABASE "db-resourcepoolmanager" OWNER ecs ENCODING 'UTF8';
CREATE DATABASE "db-clusteraccessmanager" OWNER ecs ENCODING 'UTF8';
CREATE DATABASE "db-alerts" OWNER ecs ENCODING 'UTF8';
CREATE DATABASE "db-ums" OWNER ecs ENCODING 'UTF8';
CREATE DATABASE "cm-registration" OWNER ecs ENCODING 'UTF8';
CREATE DATABASE "cluster-proxy" OWNER ecs ENCODING 'UTF8';

-- Configuration for Flink Debezium connector
CREATE DATABASE cdc_test;
CREATE ROLE cdc_user WITH REPLICATION LOGIN PASSWORD :'the_pwd';
GRANT CONNECT ON DATABASE cdc_test TO cdc_user;
\c cdc_test
SELECT * FROM pg_create_logical_replication_slot('flink', 'pgoutput',  false);
CREATE PUBLICATION dbz_publication FOR ALL TABLES;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO cdc_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO cdc_user;

