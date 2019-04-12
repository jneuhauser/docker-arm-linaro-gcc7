# Linaro Toolchain GCC7 in a docker image
This simple docker container contains the gcc7 linaro toolchains for arm.
https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabi/
https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/

## Usage examples
### Compile hello_world.c in current work dir
```
docker run --interactive --rm \
  --workdir "$(pwd)" \
  --volume "$(pwd)":"$(pwd)" \
  --user $(id -u):$(id -g) \
  jneuhauser/arm-linaro-gcc7 \
  arm-linux-gnueabihf-gcc -o hello_world hello_world.c
```
### With helper script "arm-linaro-gcc7-docker.sh"
```
# install symlinks to /usr/local/bin
sudo /path/to/arm-linaro-gcc7-docker.sh install

# use linaro toolchain of docker image
arm-linux-gnueabihf-gcc -o hello_world hello_world.c

# remove symlinks to /usr/local/bin
sudo /path/to/arm-linaro-gcc7-docker.sh deinstall
```
