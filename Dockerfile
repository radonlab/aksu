FROM radonlab/debian-base

ARG USERNAME=code
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd -g $USER_GID $USERNAME \
    && useradd -u $USER_UID -g $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y clang-7 clang-tidy-7 cmake git net-tools ninja-build \
    libevent-dev \
    && update-alternatives --install /usr/bin/clang clang /usr/bin/clang-7 9 \
    && update-alternatives --install /usr/bin/clang-tidy clang /usr/bin/clang-tidy-7 9

USER $USERNAME
