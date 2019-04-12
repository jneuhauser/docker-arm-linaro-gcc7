FROM debian:stable-slim

RUN apt-get update && \
	#apt-get -y dist-upgrade && \
	apt-get -y install wget tar xz-utils && \
	mkdir -p /opt/toolchains && \
	wget https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf.tar.xz && \
	tar xf gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf.tar.xz -C /opt/toolchains && \
	wget https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabi/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabi.tar.xz && \
	tar xf gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabi.tar.xz -C /opt/toolchains && \
	rm -rf *.tar.xz && apt-get clean && apt-get autoclean

ENV PATH="${PATH}:/opt/toolchains/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabihf/bin:/opt/toolchains/gcc-linaro-7.4.1-2019.02-x86_64_arm-linux-gnueabi/bin"

CMD [ "/bin/bash" ]
