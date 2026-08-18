# Panther X2
BOARD_NAME="Panther X2"
BOARDFAMILY="rk35xx"
BOOTCONFIG="panther-x2-rk3566_defconfig"
BOOT_SOC="rk3566"
KERNEL_TARGET="vendor"
BOARD_FIRMWARE_INSTALL=""
BOOT_LOGO="desktop"
BOOT_FDT_FILE="rockchip/rk3566-panther-x2.dtb"
IMAGE_PARTITION_TABLE="gpt"
BOOT_SCENARIO="spl-blobs"
BOOTFS_TYPE="fat"
WIREGUARD="no"

# RK3566 G52 -> panfrost; avoid mesa-vpu (forces rk3588 panthor overlay)
DEFAULT_OVERLAYS=""

DDR_BLOB="rk35/rk3566_ddr_1056MHz_v1.18.bin"
BL31_BLOB="rk35/rk3568_bl31_v1.43.elf"
ROCKUSB_BLOB="rk35/rk356x_spl_loader_v1.21.113.bin"

function post_family_config__panther-x2_use_orangepi_uboot() {
	BOOTSOURCE="https://github.com/liwei19920307/u-boot-orangepi.git"
	BOOTBRANCH="branch:v2017.09-rk3588"
	BOOTDIR="u-boot-${BOARD}"
	BOOTPATCHDIR="u-boot-${BOARD}"
	BOOTDELAY=3
}



function post_family_tweaks__panther_x2_wifi_bt() {
	display_alert "$BOARD" "Enable brcmfmac + HCI UART Bluetooth autoload" "info"
	mkdir -p "${SDCARD}/etc/modules-load.d" "${SDCARD}/lib/firmware/brcm"
	cat <<-EOF >"${SDCARD}/etc/modules-load.d/panther-x2-wireless.conf"
		brcmfmac
		hci_uart
		btbcm
	EOF
	ln -sf brcmfmac43430-sdio.bin "${SDCARD}/lib/firmware/brcm/brcmfmac43430-sdio.rockchip,panther-x2.bin" || true
	ln -sf brcmfmac43430-sdio.txt "${SDCARD}/lib/firmware/brcm/brcmfmac43430-sdio.rockchip,panther-x2.txt" || true
	ln -sf brcmfmac43430-sdio.clm_blob "${SDCARD}/lib/firmware/brcm/brcmfmac43430-sdio.rockchip,panther-x2.clm_blob" || true
}
