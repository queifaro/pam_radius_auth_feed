include $(TOPDIR)/rules.mk
 
PKG_NAME:=pam_radius
PKG_VERSION:=2.0.1
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/FreeRADIUS/pam_radius.git
PKG_SOURCE_VERSION:=8d373539bb9f13b0abfe8bcae0095a930a00fad0
PKG_BUILD_DIR:=$(BUILD_DIR)/pam_radius-$(PKG_VERSION)
PKG_SOURCE:=pam_radius-$(PKG_VERSION).tar.gz
#PKG_SOURCE_URL:=@SF/pam_radius
#PKG_HASH:=9b7dc52656f5cbec846a7ba3299f73bd
 
include $(INCLUDE_DIR)/package.mk
 
define Package/pam_radius
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Urmet
	TITLE:=pam_radius authentication
	DEPENDS:=+libpam
endef
 
define Package/pam_radius/description
	pam_radius ssh users authentication
endef
 
define Build/Configure
	$(call Build/Configure/Default)
endef
 
define Package/pam_radius/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/pam_radius_auth.so $(1)/usr/lib/
endef
 
$(eval $(call BuildPackage,pam_radius))
