# RK3399 TB-LS3399
BOARD_NAME="TB-LS3399"
BOARDFAMILY="rockchip64"
BOOTCONFIG="tb-ls3399-rk3399_defconfig"
KERNEL_TARGET="current"
BOOT_LOGO="desktop"
BOOT_FDT_FILE="rockchip/rk3399-tb-ls3399.dtb"
IMAGE_PARTITION_TABLE="gpt"
BOOT_SCENARIO="spl-blobs"
BOOTFS_TYPE="fat"
WIREGUARD="no"

KERNELPATCHDIR="rockchip64-6.6"

function post_family_config__tb-ls3399_use_orangepi_uboot() {
        BOOTSOURCE='https://github.com/liwei19920307/u-boot-orangepi.git'
        BOOTBRANCH='branch:v2017.09-rk3588'
        BOOTDIR="u-boot-${BOARD}"
        BOOTPATCHDIR="u-boot-${BOARD}"
        BOOTDELAY=3
}
