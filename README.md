# docker-yumdownloader

## Overview

A thin wrapper over
[yumdownloader](https://github.com/Senzing/knowledge-base/blob/master/WHATIS/yumdownloader.md).

### Contents

1. [Expectations](#expectations)
    1. [Space](#space)
    1. [Time](#time)
    1. [Background knowledge](#background-knowledge)
1. [Demonstrate using Docker](#demonstrate-using-docker)
    1. [Get docker image](#get-docker-image)
    1. [Configuration](#configuration)
    1. [Run docker container](#run-docker-container)
1. [Develop](#develop)
    1. [Prerequisite software](#prerequisite-software)
    1. [Clone repository](#clone-repository)
    1. [Build docker image for development](#build-docker-image-for-development)
1. [Examples](#examples)
1. [Errors](#errors)
1. [References](#references)

## Expectations

### Space

This repository and demonstration require 6 GB free disk space.

### Time

Budget 30 minutes to get the demonstration up-and-running, depending on CPU and network speeds.

### Background knowledge

This repository assumes a working knowledge of:

1. [Docker](https://github.com/Senzing/knowledge-base/blob/master/WHATIS/docker.md)

## Demonstrate using Docker

### Get docker image

1. Option #1. The `senzing/yumdownloader` docker image is on [DockerHub](https://hub.docker.com/r/senzing/yumdownloader) and can be downloaded.
   Example:

    ```console
    sudo docker pull senzing/yumdownloader
    ```

1. Option #2. The `senzing/yumdownloader` image can be built locally.
   Example:

    ```console
    sudo docker build --tag senzing/yumdownloader https://github.com/senzing/docker-yumdownloader.git
    ```

### Configuration

Configuration values specified by environment variable or command line parameter.

- **[SENZING_RPM_DIR](https://github.com/Senzing/knowledge-base/blob/master/lists/environment-variables.md#senzing_rpm_dir)**

### Run docker container

1. :pencil2: Set environment variables.
   Example:

    ```console
    export SENZING_RPM_DIR=~/Downloads
    ```

1. Run the docker container.
   Example:

    ```console
    sudo docker run \
      --rm \
      --volume ${SENZING_RPM_DIR}:/download \
      senzing/yumdownloader
    ```

## Develop

### Prerequisite software

The following software programs need to be installed:

1. [git](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/install-git.md)
1. [make](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/install-make.md)
1. [docker](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/install-docker.md)

### Clone repository

For more information on environment variables,
see [Environment Variables](https://github.com/Senzing/knowledge-base/blob/master/lists/environment-variables.md).

1. Set these environment variable values:

    ```console
    export GIT_ACCOUNT=senzing
    export GIT_REPOSITORY=docker-yumdownloader
    export GIT_ACCOUNT_DIR=~/${GIT_ACCOUNT}.git
    export GIT_REPOSITORY_DIR="${GIT_ACCOUNT_DIR}/${GIT_REPOSITORY}"
    ```

1. Follow steps in [clone-repository](https://github.com/Senzing/knowledge-base/blob/master/HOWTO/clone-repository.md) to install the Git repository.

### Build docker image for development

1. Option #1 - Using `docker` command and GitHub.

    ```console
    sudo docker build --tag senzing/yumdownloader https://github.com/senzing/docker-yumdownloader.git
    ```

1. Option #2 - Using `docker` command and local repository.

    ```console
    cd ${GIT_REPOSITORY_DIR}
    sudo docker build --tag senzing/yumdownloader .
    ```

1. Option #3 - Using `make` command.

    ```console
    cd ${GIT_REPOSITORY_DIR}
    sudo make docker-build
    ```

## Examples

## Errors

1. See [docs/errors.md](docs/errors.md).

## References
