from alpine:3.7
MAINTAINER mgbaozi "https://github.com/mgbaozi"

RUN apk add --no-cache curl

ENV ETCD_VERSION v3.2.15
ENV ETCDCTL_API=3
ENV DOWNLOAD_URL https://storage.googleapis.com/etcd
# ENV DOWNLOAD_URL https://github.com/coreos/etcd/releases/download

RUN curl -L ${DOWNLOAD_URL}/${ETCD_VERSION}/etcd-${ETCD_VERSION}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VERSION}-linux-amd64.tar.gz
RUN mkdir -p /tmp/etcd-${ETCD_VERSION}
RUN tar zxf /tmp/etcd-${ETCD_VERSION}-linux-amd64.tar.gz -C /tmp/etcd-${ETCD_VERSION} --strip-components=1
RUN mv /tmp/etcd-${ETCD_VERSION}/etcd /tmp/etcd-${ETCD_VERSION}/etcdctl /usr/bin/
RUN rm -rf /tmp/etcd-${ETCD_VERSION}
COPY run.sh /usr/bin/

EXPOSE 2379 2380
ENTRYPOINT ["/usr/bin/run.sh"]
