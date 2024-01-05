FROM alpine AS build
ARG BUILD_VERSION=3.22.0
RUN apk add curl
RUN curl -L "https://github.com/osrg/gobgp/releases/download/v${BUILD_VERSION}/gobgp_${BUILD_VERSION}_linux_amd64.tar.gz" -o gobgp.tar.gz
RUN tar xzf gobgp.tar.gz 

FROM scratch
COPY --from=build /gobgp /usr/local/bin/
COPY --from=build /gobgpd /usr/local/bin/
EXPOSE 179
EXPOSE 50051
ENTRYPOINT ["/usr/local/bin/gobgpd"]
