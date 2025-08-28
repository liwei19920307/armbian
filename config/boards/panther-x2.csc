# Panther X2
BOARD_NAME="Panther X2"
BOARDFAMILY="rk35xx"
BOOTCONFIG="panther-x2-rk3566_defconfig"
BOOT_SOC="rk3566"
KERNEL_TARGET="vendor"
BOOT_LOGO="desktop"
BOOT_FDT_FILE="rockchip/rk3566-panther-x2.dtb"
IMAGE_PARTITION_TABLE="gpt"
BOOT_SCENARIO="spl-blobs"
BOOTFS_TYPE="fat"
WIREGUARD="no"

DDR_BLOB="rk35/rk3566_ddr_1056MHz_v1.18.bin"
BL31_BLOB="rk35/rk3568_bl31_v1.43.elf"

function post_family_config__panther-x2_use_orangepi_uboot() {
        BOOTSOURCE='https://github.com/liwei19920307/u-boot-orangepi.git'
        BOOTBRANCH='branch:v2017.09-rk3588'
        BOOTDIR="u-boot-${BOARD}"
        BOOTPATCHDIR="u-boot-${BOARD}"
        BOOTDELAY=3
}
