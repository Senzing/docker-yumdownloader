ARG BASE_IMAGE=centos:7
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2020-01-30
ARG SENZING_YUM_REPOSITORY_URL=https://senzing-production-yum.s3.amazonaws.com/senzingrepo-1.0.0-1.x86_64.rpm

LABEL Name="senzing/yumdownloader" \
      Maintainer="support@senzing.com" \
      Version="1.1.2"

HEALTHCHECK CMD ["/app/healthcheck.sh"]

# Install packages via yum.

RUN yum -y install \
    yum-utils \
    ${SENZING_YUM_REPOSITORY_URL}

# Copy files from repository.

COPY ./rootfs /

# Runtime execution.

VOLUME /download

ENTRYPOINT ["yumdownloader", "--destdir", "/download"]
CMD ["senzingapi", "senzingdata-v2"]
