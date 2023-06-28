FROM mcr.microsoft.com/mssql/server:2019-latest
EXPOSE 1433
EXPOSE 5022

LABEL  "MAINTAINER" "Enrique Catalá <enrique@enriquecatala.com> | <ecatala@solidq.com> | @enriquecatala"
LABEL "Project" "SQL Server 2017 AlwaysOn Demo Node"
LABEL "BASE_GITHUB" "https://github.com/enriquecatala/sqlserver-docker-alwayson"

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD="k0h4mTk32d6"
ENV MSSQL_PID=Developer

# Certificate previously generated (see Readme.md)
ENV CERTFILE "certificate/dbm_certificate.cer"
ENV CERTFILE_PWD "certificate/dbm_certificate.pvk"


RUN mkdir /usr/certificate
WORKDIR /usr/
COPY ${CERTFILE} ./certificate
COPY ${CERTFILE_PWD} ./certificate

# Set permissions (if you are using docker with windows, you don´t need to do this)
# RUN chown mssql:mssql /usr/certificate/dbm_certificate.pvk
# RUN chown mssql:mssql /usr/certificate/dbm_certificate.cer

# Enable availability groups
#
RUN whoami
USER root
RUN /opt/mssql/bin/mssql-conf set hadr.hadrenabled 1

USER root

RUN mkdir -p -m 777 /var/opt/mssql && chgrp -R 0 /var/opt/mssql
RUN mkdir -p -m 777 /var/opt/mssql/data && chgrp -R 0 /var/opt/mssql/data
RUN mkdir -p -m 777 /var/opt/sqlserver && chgrp -R 0 /var/opt/sqlserver

RUN chmod -R 777 /var/opt/mssql /var/opt/sqlserver /var/opt/mssql/data
RUN chown -R mssql:0 /var/opt/mssql /var/opt/sqlserver /var/opt/mssql/data

USER mssql
# Run SQL Server process.
CMD /opt/mssql/bin/sqlservr
