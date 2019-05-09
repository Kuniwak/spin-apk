FROM alpine:3.8
RUN apk add spin=6.4.9-r0 --repository https://kuniwak.github.io/spin-apk --allow-untrusted

CMD ["spin", "-V"]
