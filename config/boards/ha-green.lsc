# HA Green
BOARD_NAME="HA Green"
BOARDFAMILY="rk35xx"
BOOTCONFIG="ha-green-rk3566_defconfig"
BOOT_SOC="rk3566"
KERNEL_TARGET="vendor"
# keep firmware lean (not -full); Green is ethernet-first
BOARD_FIRMWARE_INSTALL=""
BOOT_LOGO="desktop"
BOOT_FDT_FILE="rockchip/rk3566-ha-green.dtb"
IMAGE_PARTITION_TABLE="gpt"
BOOT_SCENARIO="spl-blobs"
BOOT_SUPPORT_SPI="yes"
BOOT_SPI_RKSPI_LOADER="yes"
BOOTFS_TYPE="fat"
WIREGUARD="no"

# RK3566 G52 uses panfrost; do NOT enable mesa-vpu (it forces rk3588 panthor-gpu overlay)
DEFAULT_OVERLAYS=""

DDR_BLOB="rk35/rk3566_ddr_1056MHz_v1.18.bin"
BL31_BLOB="rk35/rk3568_bl31_v1.43.elf"
ROCKUSB_BLOB="rk35/rk356x_spl_loader_v1.21.113.bin"

function post_family_config__ha-green_use_mainline_uboot() {
	BOOTSOURCE="https://github.com/u-boot/u-boot.git"
	BOOTBRANCH="tag:v2026.07"
	BOOTDIR="u-boot-${BOARD}"
	BOOTPATCHDIR="u-boot-${BOARD}"
	BOOTDELAY=3

	UBOOT_TARGET_MAP="BL31=${RKBIN_DIR}/${BL31_BLOB} ROCKCHIP_TPL=${RKBIN_DIR}/${DDR_BLOB};;u-boot-rockchip.bin u-boot-rockchip-spi.bin u-boot.itb idbloader.img idbloader-spi.img"

	unset uboot_custom_postprocess write_uboot_platform write_uboot_platform_mtd

	function write_uboot_platform() {
		dd if=${1}/u-boot-rockchip.bin of=${2} bs=32k seek=1 conv=fsync
	}

	function write_uboot_platform_mtd() {
		declare -a extra_opts_flashcp=("--verbose")
		if flashcp -h | grep -q -e '--partition'; then
			echo "Confirmed flashcp supports --partition -- read and write only changed blocks." >&2
			extra_opts_flashcp+=("--partition")
		else
			echo "flashcp does not support --partition, will write full SPI flash blocks." >&2
		fi
		flashcp "${extra_opts_flashcp[@]}" "${1}/u-boot-rockchip-spi.bin" /dev/mtd0
	}
}

function post_family_config__ha_green_clear_wrong_overlays() {
	# guard against family/extension adding rk3588 panthor overlay
	DEFAULT_OVERLAYS=""
}

function custom_kernel_config__ha_green_apply_quirks() {
	kernel_config_modifying_hashes+=(
		"ha-green:DW_WATCHDOG=n"
		"ha-green:RTC_DRV_RK808=n"
		"ha-green:RTC_DRV_PCF8563=y"
	)
	if [[ -f .config ]]; then
		display_alert "ha-green" "HAOS quirks + PCF8563 RTC" "info"
		kernel_config_set_n CONFIG_DW_WATCHDOG
		kernel_config_set_n CONFIG_RTC_DRV_RK808
		kernel_config_set_y CONFIG_RTC_DRV_PCF8563
	fi
}
