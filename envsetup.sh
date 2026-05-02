export vprimes=$ANDROID_BUILD_TOP/vendor/primes/
export caiman=$ANDROID_BUILD_TOP/vendor/caiman/
export zumapro=$ANDROID_BUILD_TOP/device/google/zumapro/
export outkernel=$ANDROID_BUILD_TOP/out-kernel/gs-6.1/

function generate_host_overrides() {
    export BUILD_USERNAME=primes
    HEX=$(openssl rand -hex 8)
    ALPHA=$(cat /dev/urandom | tr -dc 'a-z0-9' | head -c 4)
    export BUILD_HOSTNAME=7072696d6573
    echo "BUILD_USERNAME=$BUILD_USERNAME"
    echo "BUILD_HOSTNAME=$BUILD_HOSTNAME"
}

generate_host_overrides

function addprimesavbkeys() {
    sed -i 's/external\/avb\/test\/data\/testkey_rsa2048.pem/vendor\/primes\/.aosp-keys\/avbkey.pk8/' \
        $ANDROID_BUILD_TOP/device/google/zumapro/BoardConfig-common.mk
    echo "avb keys added"
}

function 

cp -r $HOME/.aosp-keys ./

addprimesavbkeys

echo "primes env setup complete"
echo "BUILD_USERNAME=$BUILD_USERNAME primes"
echo "BUILD_HOSTNAME=$BUILD_HOSTNAME primes"
