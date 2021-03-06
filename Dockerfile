ARG TERRAFORM_VERSION
ARG GIT_CRYPT_VERSION

FROM hashicorp/terraform:$TERRAFORM_VERSION

ENV GIT_CRYPT_SRC_URL="https://github.com/AGWA/git-crypt/archive/debian/$GIT_CRYPT_VERSION.tar.gz"
ENV GIT_CRYPT_SRC_PATH="/var/tmp/git-crypt-debian"

RUN apk --no-cache add git openssl gnupg libstdc++
RUN apk --no-cache add curl g++ make openssl-dev && \
    curl -L "$GIT_CRYPT_SRC_URL" | tar zxv -C /var/tmp && \
    cd "$GIT_CRYPT_SRC_PATH" && \
    make && \
    make install PREFIX=/usr/local && \
    rm -r "$GIT_CRYPT_SRC_PATH" && \
    apk --no-cache del curl g++ make openssl-dev

ENTRYPOINT [ ]
