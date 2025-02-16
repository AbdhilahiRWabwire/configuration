FROM amd64/fedora:latest

WORKDIR /zig-application

COPY ./ ./

RUN dnf -y upgrade \ 
dnf -y install zig \ 
zig test \ 
zig build 

FROM amd64/alpine:latest

WORKDIR /zig-application

COPY --from=builder ./ ./

EXPOSE 80:8080/tcp

RUN ./binary/zig-application
