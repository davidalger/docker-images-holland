FROM centos:7

RUN yum install -y epel-release crontabs \
    && yum install -y holland holland-mysqldump mariadb \
    && yum clean all \
    && rm -rf /var/cache/yum

COPY docker-entrypoint /usr/local/bin

RUN cp -r /etc/holland /etc/holland.orig

ADD crontab /etc/cron.d/holland
RUN chmod 0644 /etc/cron.d/holland

VOLUME /var/spool/holland

ENTRYPOINT ["docker-entrypoint"]
CMD ["crond", "-n"]
