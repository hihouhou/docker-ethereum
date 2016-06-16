#
# Ethereum Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM ubuntu:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

#Update & install packages for installting add-apt-repository
RUN apt-get update && \
    apt-get install -y software-properties-common

# Update & install packages for installing ethereum
RUN add-apt-repository -y ppa:ethereum/ethereum-qt && \
    add-apt-repository -y ppa:ethereum/ethereum && \
    apt-get update && \
    apt-get install -y ethereum cpp-ethereum 

EXPOSE 8545 30303

CMD ["/usr/bin/geth", "--rpc", "--rpcaddr", "0.0.0.0", "--rpcport", "8545", "--rpccorsdomain", "*"]
