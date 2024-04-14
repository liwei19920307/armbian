# L1 Pro
BOARD_NAME="L1 Pro"
BOARDFAMILY="rockchip64"
BOOTCONFIG="l1-pro-rk3328_defconfig"
KERNEL_TARGET="current"
BOOT_LOGO="desktop"
BOOT_FDT_FILE="rockchip/rk3328-l1-pro.dtb"
IMAGE_PARTITION_TABLE="gpt"
BOOT_SCENARIO="spl-blobs"
BOOTFS_TYPE="fat"
WIREGUARD="no"

KERNELPATCHDIR="rockchip64-6.6"

function post_family_config__l1-pro_use_orangepi_uboot() {
        BOOTSOURCE='https://github.com/liwei19920307/u-boot-orangepi.git'
        BOOTBRANCH='branch:v2017.09-rk3588'
        BOOTDIR="u-boot-${BOARD}"
        BOOTPATCHDIR="u-boot-${BOARD}"
        BOOTDELAY=3
}
