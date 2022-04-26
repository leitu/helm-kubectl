FROM dtzar/helm-kubectl:latest

RUN helm plugin install https://github.com/databus23/helm-diff && \
    sh -c "echo 'https://gitsecret.jfrog.io/artifactory/git-secret-apk/all/main'" >> /etc/apk/repositories && \
    wget -O /etc/apk/keys/git-secret-apk.rsa.pub 'https://gitsecret.jfrog.io/artifactory/api/security/keypair/public/repositories/git-secret-apk' && \
    apk --update add git less openssh gnupg git-secret && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*
