FROM ubuntu:16.04

ADD https://raw.githubusercontent.com/pbowden-msft/MAUCacheAdmin/master/MAUCacheAdmin /root/MAUCacheAdmin

RUN mkdir -m 755 -p /usr/share/nginx/html && \
    echo 'Welcome to your Microsoft Auto-Update Cache Server!' > /usr/share/nginx/html/index.html && \
    chmod 755 /root/MAUCacheAdmin && \
    apt-get update -q && \
    apt-get install -yqq curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/root/MAUCacheAdmin", "--CachePath:/usr/share/nginx/html", "--CheckInterval:15"]
