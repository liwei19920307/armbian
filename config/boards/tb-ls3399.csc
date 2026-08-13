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

function post_family_config__tb-ls3399_use_orangepi_uboot() {
	BOOTSOURCE="https://github.com/liwei19920307/u-boot-orangepi.git"
	BOOTBRANCH="branch:v2017.09-rk3588"
	BOOTDIR="u-boot-${BOARD}"
	BOOTPATCHDIR="u-boot-${BOARD}"
	BOOTDELAY=3
}

function post_family_tweaks__tb_ls3399_wireless() {
	mkdir -p "${SDCARD}/etc/modules-load.d" "${SDCARD}/lib/firmware/brcm"
	cat <<- EOT > "${SDCARD}/etc/modules-load.d/tb-ls3399-wireless.conf"
		brcmfmac
		hci_uart
		btbcm
	EOT
	ln -sf brcmfmac43430-sdio.bin "${SDCARD}/lib/firmware/brcm/brcmfmac43430-sdio.rockchip,rk3399-tb-ls3399.bin" || true
	ln -sf brcmfmac43430-sdio.txt "${SDCARD}/lib/firmware/brcm/brcmfmac43430-sdio.rockchip,rk3399-tb-ls3399.txt" || true
}
