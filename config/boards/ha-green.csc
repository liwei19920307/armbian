# HA Green
BOARD_NAME="HA Green"
BOARDFAMILY="rk35xx"
BOOTCONFIG="ha-green-rk3566_defconfig"
KERNEL_TARGET="legacy"
BOOT_LOGO="desktop"
BOOT_FDT_FILE="rockchip/rk3566-ha-green.dtb"
IMAGE_PARTITION_TABLE="gpt"
BOOT_SCENARIO="spl-blobs"
WIREGUARD="no"

DDR_BLOB="rk35/rk3566_ddr_1056MHz_v1.18.bin"
BL31_BLOB="rk35/rk3568_bl31_v1.43.elf"

function post_family_config__ha-green_use_mainline_uboot() {
	BOOTSOURCE="https://github.com/Kwiboo/u-boot-rockchip.git"
	BOOTBRANCH="commit:ced42f309e8408d0e471e9b98b467942226667c7"
	BOOTDIR="u-boot-${BOARD}"
	BOOTPATCHDIR="legacy/u-boot-${BOARD}"

	BOOTDELAY=1
	UBOOT_TARGET_MAP="BL31=${RKBIN_DIR}/${BL31_BLOB} ROCKCHIP_TPL=${RKBIN_DIR}/${DDR_BLOB};;u-boot-rockchip.bin u-boot-rockchip-spi.bin u-boot.itb idbloader.img idbloader-spi.img"
	unset write_uboot_platform

	function write_uboot_platform() {
		dd if=${1}/u-boot-rockchip.bin of=${2} bs=32k seek=1 conv=fsync
	}
}