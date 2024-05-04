# RK3399 SW799
BOARD_NAME="SW799"
BOARDFAMILY="rockchip64"
BOOTCONFIG="sw799-rk3399_defconfig"
KERNEL_TARGET="current"
BOOT_LOGO="desktop"
BOOT_FDT_FILE="rockchip/rk3399-sw799.dtb"
IMAGE_PARTITION_TABLE="gpt"
BOOT_SCENARIO="spl-blobs"
BOOTFS_TYPE="fat"
WIREGUARD="no"

KERNELPATCHDIR="rockchip64-6.6"

function post_family_config__sw799_use_orangepi_uboot() {
        BOOTSOURCE='https://github.com/liwei19920307/u-boot-orangepi.git'
        BOOTBRANCH='branch:v2017.09-rk3588'
        BOOTDIR="u-boot-${BOARD}"
        BOOTPATCHDIR="u-boot-${BOARD}"
        BOOTDELAY=3
}
