FROM ubuntu:16.04 as builder

RUN apt-get update && apt-get install -y tzdata && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

WORKDIR /app

RUN apt-get update && apt-get install -y asciidoctor

COPY index.adoc .
COPY docs ./docs
RUN asciidoctor index.adoc

FROM nginx:1.15-alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /app/index.html /usr/share/nginx/html/index.html
CMD ["nginx", "-g", "daemon off;"]