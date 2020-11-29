FROM radonlab/debian-codespace

RUN apt-get update \
    && apt-get install -y clang clang-tidy cmake git libssl-dev ninja-build python
