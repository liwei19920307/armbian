# NanoPi R6C
BOARD_NAME="NanoPi R6C"
BOARDFAMILY="rk35xx"
BOOTCONFIG="nanopi-r6c-rk3588s_defconfig"
BOOT_SOC="rk3588"
KERNEL_TARGET="vendor"
BOARD_FIRMWARE_INSTALL="-full"
BOOT_LOGO="desktop"
BOOT_FDT_FILE="rockchip/rk3588s-nanopi-r6c.dtb"
IMAGE_PARTITION_TABLE="gpt"
BOOT_SCENARIO="spl-blobs"
BOOTFS_TYPE="fat"
WIREGUARD="no"

ENABLE_EXTENSIONS="mesa-vpu"
DEFAULT_OVERLAYS="panthor-gpu"
OVERLAY_PREFIX="rockchip-rk3588"

DDR_BLOB="rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.15.bin"
BL31_BLOB="rk35/rk3588_bl31_v1.45.elf"

function post_family_config__nanopi_r6c_use_mainline_uboot() {
	BOOTSOURCE="https://github.com/u-boot/u-boot.git"
	BOOTBRANCH="tag:v2025.10"
        BOOTDIR="u-boot-${BOARD}"
        BOOTPATCHDIR="u-boot-${BOARD}"
        BOOTDELAY=3

	declare -g UBOOT_TARGET_MAP="BL31=${RKBIN_DIR}/${BL31_BLOB} ROCKCHIP_TPL=${RKBIN_DIR}/${DDR_BLOB};;u-boot-rockchip.bin"

	unset uboot_custom_postprocess write_uboot_platform write_uboot_platform_mtd

	function write_uboot_platform() {
		dd "if=$1/u-boot-rockchip.bin" "of=$2" bs=32k seek=1 conv=notrunc status=none
	}
}
