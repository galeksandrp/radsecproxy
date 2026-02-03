FROM alpine:3.23.3 as build
RUN apk add --update alpine-sdk \
	autoconf \
	automake \
	nettle-dev \
	openssl-dev>3
COPY . /root/radsecproxy
WORKDIR /root/radsecproxy

RUN ./autogen.sh
RUN ./configure
RUN make

FROM alpine:3.23.3
COPY --from=build /root/radsecproxy /root/radsecproxy
CMD ["/root/radsecproxy/radsecproxy.sh"]
