#!/bin/sh
/usr/bin/etcd \
    --name etcd \
    --initial-advertise-peer-urls http://${HOST_IP}:2390 \
    --initial-cluster etcd=http://${HOST_IP}:2390 \
    --data-dir /var/lib/etcd \
    --wal-dir /var/log/etcd \
    --listen-peer-urls http://${HOST_IP}:2380 \
    --listen-client-urls http://${HOST_IP}:2379 \
    --advertise-client-urls http://${HOST_IP}:2379
