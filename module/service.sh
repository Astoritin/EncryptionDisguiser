#!/system/bin/sh
MODDIR=${0%/*}

MODULE_PROP="$MODDIR/module.prop"
MOD_INTRO="A Magisk module to disguise the status of encryption as encrypted."

. "$MODDIR/aa-util.sh"

while [ "$(getprop sys.boot_completed)" != "1" ]; do
    sleep 1
done

check_before_resetprop "ro.crypto.state" "encrypted"
DESCRIPTION="[⚙️Data Partition state: $(getprop ro.crypto.state)] $MOD_INTRO"
update_config_var "description" "$DESCRIPTION" "$MODULE_PROP"
