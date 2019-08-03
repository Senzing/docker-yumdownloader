ARG BASE_IMAGE=centos:7
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2019-08-05

LABEL Name="senzing/yumdownloader" \
      Maintainer="support@senzing.com" \
      Version="1.3.0"

HEALTHCHECK CMD ["/app/healthcheck.sh"]

# Install packages via yum.

RUN yum -y install \
    yum-utils \
    https://senzing-production-yum.s3.amazonaws.com/senzingrepo-1.0.0-1.x86_64.rpm

# Copy files from repository.

COPY ./rootfs /

# Runtime execution.

VOLUME /download

ENTRYPOINT ["yumdownloader", "--destdir", "/download"]
CMD ["senzingapi"]
