# Seewo SV21
BOARD_NAME="Seewo SV21"
BOARDFAMILY="rk3568-odroid"
BOOTCONFIG="seewo-sv21-rk3568_defconfig"
BOOT_SOC="rk3568"
KERNEL_TARGET="edge"
FULL_DESKTOP="yes"
BOOT_LOGO="desktop"
BOOT_FDT_FILE="rockchip/rk3568-seewo-sv21.dtb"

BOOTSOURCE="https://github.com/Kwiboo/u-boot-rockchip.git"
BOOTBRANCH_BOARD="commit:a6e84f9f5b90ff0fa3ac4e6b7e0d6e2c3ac9bb1b"
BOOTPATCHDIR="v2023.10"
BOOTCONFIG="seewo-sv21-rk3568_defconfig"
BOOTDIR="u-boot-${BOARD}"

RKBIN_GIT_URL="https://github.com/rpardini/armbian-rkbin.git"
RKBIN_GIT_BRANCH="update-3568-blobs"
DDR_BLOB="rk35/rk3568_ddr_1560MHz_v1.18.bin"
BL31_BLOB="rk35/rk3568_bl31_v1.43.elf"

function post_family_config__uboot_config() {
	display_alert "$BOARD" "u-boot ${BOOTBRANCH_BOARD} overrides" "info"
	BOOTDELAY=2 # Wait for UART interrupt to enter UMS/RockUSB mode etc
    UBOOT_TARGET_MAP="ROCKCHIP_TPL=${RKBIN_DIR}/${DDR_BLOB} BL31=$RKBIN_DIR/$BL31_BLOB spl/u-boot-spl u-boot.bin flash.bin;;idbloader.img u-boot.itb"
}
