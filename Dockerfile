FROM ubuntu:14.10

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    ca-certificates \
    curl \
    git \
    fakeroot \
    libasound2 \
    libgconf-2-4 \
    libgnome-keyring-dev \
    libgtk2.0-0 \
    libnss3 \
    libxtst6 \
    --no-install-recommends

# install node
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y nodejs

RUN git clone https://github.com/atom/atom /src

COPY ./build.sh /
RUN chmod +x build.sh

# run build script
CMD ./build.sh
