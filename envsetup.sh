export vprimes=$ANDROID_BUILD_TOP/vendor/primes/
export caiman=$ANDROID_BUILD_TOP/device/caiman/
export zumapro=$ANDROID_BUILD_TOP/device/google/zumapro/
export outkernel=$ANDROID_BUILD_TOP/out-kernel/google/gs-6.1/
export BUILD_USERNAME=$(whoami)
export BUILD_HOSTNAME=7072696d6573
export CCACHE_MAXSIZE=128G

function addprimesavbkeys() {
    
    sed -i 's/external\/avb\/test\/data\/testkey_rsa2048.pem/vendor\/primes\/.aosp-keys\/avbkey.pk8/' \
            $ANDROID_BUILD_TOP/device/google/zumapro/BoardConfig-common.mk
    echo "avb keys added"
    return 0
}

addprimesavbkeys

echo "ccache max size set to $CCACHE_MAXSIZE"
echo "BUILD_USERNAME=$BUILD_USERNAME"
echo "BUILD_HOSTNAME=$BUILD_HOSTNAME"
echo "primes env setup complete"
