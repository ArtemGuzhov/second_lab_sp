FROM ubuntu
WORKDIR /
RUN apt-get update
RUN apt install gcc gdb gcc-multilib nano -y
COPY index.s .
RUN gcc -m32 index.s -o index
CMD ./index
