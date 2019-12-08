FROM radonlab/debian-base

RUN apt-get update \
    && apt-get install -y clang-7 clang-tidy-7 cmake ninja-build \
    libevent-dev \
    && update-alternatives --install /usr/bin/clang clang /usr/bin/clang-7 9 \
    && update-alternatives --install /usr/bin/clang-tidy clang /usr/bin/clang-tidy-7 9

VOLUME ["/root/work"]

WORKDIR /root/work
