# Patches
if [ ! -e device/huawei/ok ]
then
sh device/huawei/u8950/patches/apply.sh
touch device/huawei/ok
fi

# Prebuilt Chromuium
if [ -e prebuilts/chromium/u8950/chromium_prebuilt.mk ]
then
export USE_PREBUILT_CHROMIUM=1
fi

# Lunch
add_lunch_combo aosp_u8950-userdebug
