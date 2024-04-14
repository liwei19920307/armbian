# Seewo SV21
BOARD_NAME="Seewo SV21"
BOARDFAMILY="rk35xx"
BOOTCONFIG="seewo-sv21-rk3568_defconfig"
KERNEL_TARGET="legacy,vendor"
BOOT_LOGO="desktop"
BOOT_FDT_FILE="rockchip/rk3568-seewo-sv21.dtb"
IMAGE_PARTITION_TABLE="gpt"
BOOT_SCENARIO="spl-blobs"
BOOTFS_TYPE="fat"
WIREGUARD="no"

DDR_BLOB="rk35/rk3568_ddr_1560MHz_v1.18.bin"
BL31_BLOB="rk35/rk3568_bl31_v1.43.elf"

function post_family_config__seewo-sv21_use_orangepi_uboot() {
        BOOTSOURCE='https://github.com/liwei19920307/u-boot-orangepi.git'
        BOOTBRANCH='branch:v2017.09-rk3588'
        BOOTDIR="u-boot-${BOARD}"
        BOOTPATCHDIR="u-boot-${BOARD}"
        BOOTDELAY=3
}

