FROM mcr.microsoft.com/azure-cli:2.9.1
ENV MYSQL_HOST localhost
ENV MYSQL_USER root
ENV MYSQL_PASSWORD root
ENV AZURE_ACCOUNT_NAME backup
ENV AZURE_ACCOUNT_KEY key
ENV AZURE_ACCOUNT_CONTAINER mysql-backup
RUN ["apk", "add", "mariadb-client"]
COPY backup.sh backup.sh
RUN ["chmod", "+x", "backup.sh"]
ENTRYPOINT ["sh", "-c", "./backup.sh $MYSQL_HOST $MYSQL_USER $MYSQL_PASSWORD $AZURE_ACCOUNT_NAME $AZURE_ACCOUNT_KEY $AZURE_ACCOUNT_CONTAINER"]