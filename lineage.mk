# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit some common Lineage stuff.

$(call inherit-product, vendor/lineage/config/common_mini_tablet_wifionly.mk)


# Inherit telephony stuff
$(call inherit-product, vendor/lineage/config/telephony.mk)


# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/asus/duma/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := duma
PRODUCT_NAME := lineage_duma
PRODUCT_BRAND := asus
PRODUCT_MODEL := MeMOPAD 10FHD Lte
PRODUCT_MANUFACTURER := asus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=duma \
    BUILD_FINGERPRINT=asus/duma/duma:6.0.1/MOB30X/3036618:user/release-keys \
    PRIVATE_BUILD_DESC="duma-user 6.0.1 MOB30X 3036618 release-keys"
