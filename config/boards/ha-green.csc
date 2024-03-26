# HA Green
BOARD_NAME="HA Green"
BOARDFAMILY="rk35xx"
BOOTCONFIG="ha-green-rk3566_defconfig"
KERNEL_TARGET="legacy,vendor"
BOOT_LOGO="desktop"
BOOT_FDT_FILE="rockchip/rk3566-ha-green.dtb"
IMAGE_PARTITION_TABLE="gpt"
BOOT_SCENARIO="spl-blobs"
BOOTFS_TYPE="fat"
WIREGUARD="no"

DDR_BLOB="rk35/rk3566_ddr_1056MHz_v1.18.bin"
BL31_BLOB="rk35/rk3568_bl31_v1.43.elf"

function post_family_config__ha-green_use_mainline_uboot() {
	BOOTSOURCE="https://github.com/Kwiboo/u-boot-rockchip.git"
	BOOTBRANCH="branch:rk3xxx-2024.04"
	BOOTDIR="u-boot-${BOARD}"
	BOOTPATCHDIR="u-boot-${BOARD}"
	BOOTDELAY=1
}
