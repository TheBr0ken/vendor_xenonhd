# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_UTC_DATE=$(shell date +"%s")

XENONHD_VERSION :=  update-XenonHD-$(shell date +"%m-%d-%y")-signed

# Rom Manager properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.xehdversion=XenonHD-$(shell date +"%m-%d-%y") \
    ro.modversion=XenonHD-$(shell date +"%m-%d-%y") \
    ro.rommanager.developerid=TeamHorizon
    
# ROM Statistics and ROM Identification
PRODUCT_PROPERTY_OVERRIDES += \
ro.romstats.url=http://iceandfire.co/stats/ \
ro.romstats.name=XenonHD \
ro.romstats.version=$(shell date +"%m-%d-%y") \
ro.romstats.tframe=2


# OTA
OTA_TYPE := experimental

PRODUCT_PROPERTY_OVERRIDES += \
    ro.ota.type=$(OTA_TYPE) \
    ro.ota.version=$(OTA_TYPE)-XenonHD-$(shell date +"%Y%m%d")

# Create ota_conf, Rudimentary, but it works for now
$(shell echo -n "" > $(ANDROID_BUILD_TOP)/ota_conf)

$(shell echo -e "ota_url=https://mirrors.c0urier.net/android/teamhorizon/$(OTA_TYPE)/$(TARGET_PRODUCT)/ota_lollipop.xml\n \
release_type=Stable\n \
device_name=ro.product.device\n \
version_source=ro.ota.version\n \
version_delimiter=-\n \
version_position=2\n \
version_format=yyyyMMdd" > $(ANDROID_BUILD_TOP)/ota_conf)

$(shell sed -i "s/\( \|xenonhd_\)//g" $(ANDROID_BUILD_TOP)/ota_conf)
